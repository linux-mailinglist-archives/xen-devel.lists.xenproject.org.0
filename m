Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B071F6BE5AB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 10:33:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510971.789583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd6S9-0006rF-Oj; Fri, 17 Mar 2023 09:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510971.789583; Fri, 17 Mar 2023 09:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd6S9-0006pY-Km; Fri, 17 Mar 2023 09:32:49 +0000
Received: by outflank-mailman (input) for mailman id 510971;
 Fri, 17 Mar 2023 09:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRv9=7J=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pd6S8-0006pP-0d
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 09:32:48 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac8bdb56-c4a6-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 10:32:45 +0100 (CET)
Received: from DS7PR03CA0330.namprd03.prod.outlook.com (2603:10b6:8:2b::22) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.26; Fri, 17 Mar 2023 09:32:42 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::26) by DS7PR03CA0330.outlook.office365.com
 (2603:10b6:8:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35 via Frontend
 Transport; Fri, 17 Mar 2023 09:32:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.10 via Frontend Transport; Fri, 17 Mar 2023 09:32:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Mar
 2023 04:32:40 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 17 Mar 2023 04:32:39 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ac8bdb56-c4a6-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGufOuySThNh4a7QT6JcP96kxK9FUtuokgchjEOKdQ2d9UyASgrTqkR4AXSmh+3pq35KFwVGTkotM4tqABDlGyE1ADLKwHTDf3ME/7uY5Udtx8K8V19yprDIry4oNJZSTEFEbCPS1FUzngb7mlCkcRO7anHRP1uSbmLfmy7AsXuJg1iyZ2vvrR+sR10m19fYHBwxuD7ooGbYFmrzN9G0ze3bcdJ8lMk4jD+Yc2K/bbCw6N53oJDi/uDgsS50nzchtoU8Qlf63dUDC7l9ABvPO7qqBdA0EPuoh0bXd6xpYCml4zfgYS+2ZlQGRDE2kB0/QBVG/7BF+voRRg76etBjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+yAJLAReIoG5jda+TQq0X0yLNPbNOso2JggJsFHInc=;
 b=l459ZWX6vak+WmiLWKT7ZgGWJ/bdsnFASpfjQxjZE0PNb8XcRGYJ6rwiWdaRv6N2gyFhyYMW2xP2zSiawFodsapJP/2Sqt4Qvnh6vG1W2IBmKEarx4NvcJYMRMENYrDutGCy0FaeNIUqpzE5YbFdB7z/0SvB9UF3k8/rRL6LsEb0A7mnII6BOBZVCC0EpQeUgQKixSA4H7HAjZDiqtaRlBYF3tQeodbh5lJCsu/Q+5I29uh66Mfmycp4BIiOgD0xtVnm0Dwnw/h7GiN91hYIy3a04hkCq6ljuo4D5ALs5C7wmmHS773j/BgxAP/RQdRy608FL0E3QuHqJo53M94/CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+yAJLAReIoG5jda+TQq0X0yLNPbNOso2JggJsFHInc=;
 b=3jN7madykkxhrEY7KEdnjueUkAWvh0WJR8PxgeqdGV+UHqge+jRnNoKTp4ivhv4gr4EmOQhICNrqHsxy6JP35sFhSMBwoBp6wrb0zLPFinNWgTzLFdr8pugOYfI9vMIC466v+NjAMN70x5iigsiFJaCl+3+iGvt7ZtQujUZlEp4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <875eea95-a9b2-656d-b182-1a48cf557a9b@amd.com>
Date: Fri, 17 Mar 2023 10:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] xen/console: Skip switching serial input to non
 existing domains
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20230316102635.6497-1-michal.orzel@amd.com>
 <d9654392-ce4b-07b6-9be0-7a6d4230c287@suse.com>
 <alpine.DEB.2.22.394.2303161559250.3359@ubuntu-linux-20-04-desktop>
 <02d111e0-000b-ff82-9483-6301c18e5172@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <02d111e0-000b-ff82-9483-6301c18e5172@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d645ca-9190-45b2-1500-08db26ca8e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	08Ise6m+b57aTe+AJulj19Mmd7VUvBOuvkwHNjAsQLAf3fOlJnTZcdi9CdbNCUnoHjl6RJg8pouYGCqH3U/+OC5YDrRnAyXta78guv5WdhxOfKV4iMFejJdWLI+9B+X4+ad/57WQ6XbJGJoeDv3Zs1utqzqDlaLWgXywDv4dOdHI4sfwok7/gKOaVXX7VSDqQ5HctlAm97uJdBvK3BChmuM1iZwi+rkbBbqs88nYzoCvYh0dqD9H509/CdYMPh42ldLRyOyNgvCXtaNSfEyKa/rELBxIuZgytvkMw5NTX8j7OUBkIJGtxaVl7O7qViwbQRH2dpheyiSIMstiIkxwbw3GqnN2YMmLlxYM+Vs9XYCS4tkz2yyhV+itJ4o+B/ggUm7o6GjgtFAzSsPoHCjdXG6aLToWbtESK8qWvipq5y4GF4LTi3v5j2IgGlnwrZTbE4IcmyEAduuWlqNlu4XXjCSduyoUZ+8N5gMVScK3khyM6nlg9cS3EwdCpsZ0QKMYLopjIDuUYKlz/DnmtNA9MzqtEpoi3GWJ9Fj6mr6ImaT9zLrQmuqKCTLEvpVNY7mEBRGhGyTaf1x5w0SYaXRth7yxva/oE7J/1l2PG+TUdopKYESQsLRCOtIicVgYTDjM+xWEQ69s7/2mlBPzvi8L1S867Zr70/UipdidrSBtmgiyPGp9f2dduE7UYBcPxqrqYQracu6/8pi2zG+u52ndLH6cefPJ61wh0D41ZwaxUweQedd/u1vyaH64GU35SxsZoFfKq1bKxTDd4qi1HhFEVg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(31686004)(81166007)(54906003)(40480700001)(316002)(426003)(336012)(47076005)(110136005)(83380400001)(16576012)(40460700003)(36756003)(82310400005)(8676002)(82740400003)(4326008)(36860700001)(70586007)(186003)(86362001)(8936002)(53546011)(70206006)(2906002)(26005)(356005)(31696002)(478600001)(2616005)(5660300002)(41300700001)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 09:32:41.1942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d645ca-9190-45b2-1500-08db26ca8e24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930



On 17/03/2023 09:36, Jan Beulich wrote:
> 
> 
> On 16.03.2023 23:59, Stefano Stabellini wrote:
>> On Thu, 16 Mar 2023, Jan Beulich wrote:
>>> On 16.03.2023 11:26, Michal Orzel wrote:
>>>> --- a/xen/drivers/char/console.c
>>>> +++ b/xen/drivers/char/console.c
>>>> @@ -490,7 +490,24 @@ static void switch_serial_input(void)
>>>>      }
>>>>      else
>>>>      {
>>>> -        console_rx++;
>>>> +        unsigned int next_rx = console_rx + 1;
>>>> +
>>>> +        /* Skip switching serial input to non existing domains */
>>>> +        while ( next_rx < max_init_domid + 1 )
>>>> +        {
>>>> +            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
>>>> +
>>>> +            if ( d )
>>>> +            {
>>>> +                rcu_unlock_domain(d);
>>>> +                break;
>>>> +            }
>>>> +
>>>> +            next_rx++;
>>>> +        }
>>>> +
>>>> +        console_rx = next_rx;
>>>> +
>>>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>>>      }
>>>
>>> While at the first glance (when you sent it in reply to v1) it looked okay,
>>> I'm afraid it really isn't: Please consider what happens when the last of
>>> the DomU-s doesn't exist anymore. (You don't really check whether it still
>>> exists, because the range check comes ahead of the existence one.) In that
>>> case you want to move from second-to-last to Xen. I expect the entire
>>> if/else construct wants to be inside the loop.
>>
>> I don't think we need another loop, just a check if we found a domain or
> 
> I didn't say "another loop", but I suggested that the loop needs to be
> around the if/else. Of course this can be transformed into equivalent
> forms, like ...
> 
>> not. E.g.:
>>
>>
>>     unsigned int next_rx = console_rx + 1;
>>
>>     /* Skip switching serial input to non existing domains */
>>     while ( next_rx < max_init_domid + 1 )
>>     {
>>         struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
>>
>>         if ( d )
>>         {
>>             rcu_unlock_domain(d);
>>             console_rx = next_rx;
>>             printk("*** Serial input to DOM%d", console_rx - 1);
>>             break;
>>         }
>>
>>         next_rx++;
>>     }
>>
>>     /* no domain found */
>>     console_rx = 0;
>>     printk("*** Serial input to Xen");
> 
> ... what you suggest (or at least almost, because the way it's written
> we'd always switch to Xen).

I would prefer a loop with if/else inside. If you are ok with the following code
that handles all the cases, I will push a patch in a minute:

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 51e5408f2114..96ec3bbcf541 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -483,15 +483,34 @@ struct domain *console_input_domain(void)
 
 static void switch_serial_input(void)
 {
-    if ( console_rx == max_init_domid + 1 )
-    {
-        console_rx = 0;
-        printk("*** Serial input to Xen");
-    }
-    else
+    unsigned int next_rx = console_rx + 1;
+
+    /*
+     * Rotate among Xen, dom0 and boot-time created domUs while skipping
+     * switching serial input to non existing domains.
+     */
+    while ( next_rx <= max_init_domid + 2 )
     {
-        console_rx++;
-        printk("*** Serial input to DOM%d", console_rx - 1);
+        if ( next_rx == max_init_domid + 2 )
+        {
+            console_rx = 0;
+            printk("*** Serial input to Xen");
+            break;
+        }
+        else
+        {
+            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
+
+            if ( d )
+            {
+                rcu_unlock_domain(d);
+                console_rx = next_rx;
+                printk("*** Serial input to DOM%d", console_rx - 1);
+                break;
+            }
+
+            next_rx++;
+        }
     }
 
     if ( switch_code )

~Michal

