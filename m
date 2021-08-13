Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BD3EB684
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 16:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166818.304506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEXpk-0001ZG-0r; Fri, 13 Aug 2021 14:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166818.304506; Fri, 13 Aug 2021 14:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEXpj-0001Wr-TD; Fri, 13 Aug 2021 14:06:51 +0000
Received: by outflank-mailman (input) for mailman id 166818;
 Fri, 13 Aug 2021 14:06:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ewIu=NE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mEXph-0001Wl-NQ
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 14:06:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2d9c336-fc3f-11eb-a2b1-12813bfff9fa;
 Fri, 13 Aug 2021 14:06:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-A5Bv7XI8Pl6ItAX6ZG0UGQ-1; Fri, 13 Aug 2021 16:06:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Fri, 13 Aug
 2021 14:06:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 14:06:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Fri, 13 Aug 2021 14:06:44 +0000
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
X-Inumbo-ID: b2d9c336-fc3f-11eb-a2b1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628863607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ruYCt2JKyn4B3mc286X/id6dOyCoYFUnChvb27HZxc8=;
	b=F8wYTpl/KzGUT00fEqlq6xoodUGO++AFrmRKK+edTPILe9Cjn3917WgI8LXXvURHhbHRgc
	O8m8ST+zRq62uwC7Ro4WLpgwPiuIsLolNAfNEQ3QrFSAtydM3eMSJRzqy7VygDa40WM2lR
	wO+906qvaMwUqlsMCPCAylBHR6G8XsM=
X-MC-Unique: A5Bv7XI8Pl6ItAX6ZG0UGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VA+tjZxMBvhRIJHtocQ5p9ha/EnGK55hJvyzeGzKK4cYuewlpRHKmOEdI3nQZLciKNVw1Qz2N0t4IUn3M/o1CVuG8qPnf0uOodXqs3iY4muWCSfawKWHQVBl/UoMHyu+EI6DD5s9lEcQaqbiuC5KAe9E7SVww4c8XB8wfXfbO+Z7s6hKv0nqa/kLTp0Oa43F3xEORHClUDj/7SEWTE9xaipLXDutJdXrXFAvbmw3b5THw7r7BDXw9kssapwgbpUwp56mH1Gbrse/Xq8Nu0067ubGZQN0IGsZ7IG1lmHLW0Y6nbuhmBKflZIrYuTBcjkBsdly9JYc/aLkWdlVpzE54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruYCt2JKyn4B3mc286X/id6dOyCoYFUnChvb27HZxc8=;
 b=RVohmispn5LSCLgzbgAXDv0qCwvzAWhlPOUtLkrNUYgIuHm7XWLrTjKFqufUN4r+U3B5BYK6lZqtrzr5yS1L0EXOx9oBiW9sKbDqcow/Ok7ne6SnRRG3IGg9pnhjn37wCvXiUVnWphr+6Dp9W53+MYQqA9aekFg4DueGABmLV6g/MVyzyTHPkC3sIiHTXVPLZJeg2nc8r9oYxZqzRh/JmbnSOojEt2lG6CyA2EtFn3e/p/kNRbiK0nm00hxVkH8qWf+P5GoX6uWDacK4IvNmu1mtfyy15vJk+6m9Wmz5H/lT+SKJtW3np1W2AbR7Mjw6R/Jg2z+9H7LRzJ3Xl5Bzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/pv: remove unnecessary use of goto out in
 construct_dom0()
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210813110224.14820-1-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18136ae8-cb66-0bc8-e5de-b1117b2f1c19@suse.com>
Date: Fri, 13 Aug 2021 16:06:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210813110224.14820-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b25b325e-7295-4e35-4aea-08d95e639516
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233649F1CF1B3F3CD497FEEAB3FA9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TO2REO7eACmd8eT8jUMS8YV3nKIpqep7RAq59UBH5Jk+gPR9dL6XzK0CLUljo+Rpp3ZagUwd/MtA7cYPlj074Gh4mYCwgyUnyP3cqxzQYv9kiOdP1r678nr6Pcw1BzoxZX3uyUvA+Oy/A/WHwXmkwHEruRy9nh7Sg9kKVTl6qj+0UM9Dwz/zh+WGTtYS8dGt1sH0JY5rqQSv4gOmjPV74VLZGwxEt+krdquJuMWWM+ksW5BNQeE+rJgW9ejQDkMhZJa+hBFJld8FtXHIWx2x0NGGmgfZg4AzfHZzNB7t1RQ6h0VMYgvU77h9I8MyIaStp6CrI1yfrYsqVt1c/gs0SqO0l7Ct/fX3iBg3R8oXz63HJfEJpYGI/bSq4zRFteJrVE+VAafuvOvJwMmkm6+1RrpnEHqypMtjMN4OdW9zlFo45L1qjWsGtG4Vk/Q2afe+rOmuvctqEjfsl6be7j8ki/RLb91aJuWz2O2xx9RoqZpfHRHXDOkIIbo7uDS6QJR3WFtbqzIYvERRzXGlallYkVxgQ3pZKiqTedG1X2aEcIkohJXLAXPxvxaBQ0AJvVRmL+Y8iCoxsNCK8j1BZHkWp6z4eiuw0+gHbqnDbY4o+zKvVjHKBTbDQos8mfjfSOHLTj2XiLeZafj3pa2DGi0MtTKljP1JPNVyPuYoqxy8NvL40s1mm9QR72c12GUAJ2kZ3QCPndDmWBU5bcFFw4Q/v6wYnnpnk9Ln8f5ukomnQw8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(136003)(346002)(366004)(396003)(86362001)(66946007)(66556008)(316002)(6916009)(4744005)(31696002)(2616005)(6486002)(4326008)(5660300002)(8936002)(2906002)(54906003)(83380400001)(26005)(8676002)(38100700002)(186003)(31686004)(956004)(478600001)(66476007)(53546011)(36756003)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVoyajI3anl5cVp6SUdCTkZKQW1zU2dnZkhkRlB0dVoxcWdlQzRmdmhDZ1lX?=
 =?utf-8?B?NTRCdndjZzM4a2RMSmVuR281aFdxNnNBeEJaTkxKdUtZNHJyb0ZlRjAzbmJT?=
 =?utf-8?B?ZGpLYWpDa1NoODB4cXMzUTBlc080bHlNQzhMV0toRHczS09SSmJIRnZkWHRH?=
 =?utf-8?B?U251anZsbG5SWUFQcUFyVWRBemdwYzA2bzc4NE9VRUtDTVp2c3EvcTIrRUcv?=
 =?utf-8?B?MHV2bS9GcUV3S2N4b0ZlQTBZSTVaUEdHK0w5Rm9qL1JuTzVndmc4MXAxbHJF?=
 =?utf-8?B?eFhIRVNYb1dZakIzVlN6VFg4L1diL1g2ci9aQzNVSWhMaGIxeWwrWEV0UEx6?=
 =?utf-8?B?czJpR3NUUERwVFZMcERndHhSY2tuWXpZU3ppZ1hpekV5SEVaNllPT29rbDFu?=
 =?utf-8?B?UkNIRWtpaWg3UXlxdi9oL2kweEI0N0tkc0hrN1FTVis1T2E4TWtSVCtuYy95?=
 =?utf-8?B?ZUJDWWVNRXErU3JBdExiYWVsZEl1QnVDR0hXS3JQcWJRam5jZXorUHlMQ1Ns?=
 =?utf-8?B?VEFrN2tzY0RrT0ZzTFpSVGcxSzN0UFhWV3FvVVdmTmhncTFETnU0SGFOOXU3?=
 =?utf-8?B?Q0piZGtMNUVYMENTbTVNMkdRWVVQRW9hSkVrWmRFUGhieXBPRmxZaUVYdmo4?=
 =?utf-8?B?S2lCMmxURGhybWl1clVYeTBuZ3k3bmlnTHhzeVR0UUV4c2ZSTGo0dEg2Q1dr?=
 =?utf-8?B?NVcyMVB5MkNGUXNYY1dGOFRVd09DSVlBWWZkSGNNVk1FWW9ON1d3VkpZZ2Vj?=
 =?utf-8?B?Q2JldkU2b0J4bExiT3A5c0FpQjFRWXNyUEI0VXFoMnI0MERzaVV2ZkVJbHRr?=
 =?utf-8?B?YTNxZEpvTUxaaWh0UURidWs3YVlQQ3NzWksrNXEzUEUzMEJDeUdpbnIyaW1t?=
 =?utf-8?B?YWtJT3lpbDFtTDlZUHpkS3JCRXhBb3RnT0xTeG15bnY4aFlVem5xb0JrcVFm?=
 =?utf-8?B?RTRGbldEbHh3dFZmUVU2OEJGOTUyTVBYT3NOdjFleXErNXlRenQ1dkhlT2J6?=
 =?utf-8?B?cmZ0Ky9lblZ3Y3BFbTBoUmZwL0liUW5nZ1JPUjZGSXpSTk1xYXc5L2pmaEpW?=
 =?utf-8?B?aDFtbDNMcVA4RVA1bmg0UVUvWmtpK2pPZGF6akxYVTVhcjJMc0pqeTRKTWw4?=
 =?utf-8?B?ZlhLY1ZQbnNhWGNBaElYdVRZNjk5VXF2cTlFdFFZZ20zUkt0OEpaQU8zWDdB?=
 =?utf-8?B?SmtPL1pvNG15SlZzYm5sWmlTcHNxK0N6M0owSmxXdDY4UGtoTnh1ZWJzeTJD?=
 =?utf-8?B?T1ZVWHpXRmpQMDF4bThpYTNoVTFzU3MvNEFqdHIxclNxejhhZ0JLeWE4MHJQ?=
 =?utf-8?B?dXJBWXRDaU4yRkhnckQ5dVdrTllLWFZBVnpGWWp1ZTEzZkRuNjk3N08rd3NH?=
 =?utf-8?B?QUVITXpvbTBUelVuVzhlZUJiV2JBVWNybzF3a0FERVlFVWFwRXBmRXpQL3RS?=
 =?utf-8?B?d3ZMMk5DdG1HVFdIOHZ1K2JrYUNJMmdYZmJZdkJ1ZVExbUFOdWJoRUcwVjZz?=
 =?utf-8?B?RlVJQ0JlaU1ZL3pXenYvN2M1ajRYT0lvaXdZWHI1UVI3ZXl5Mm15akRRRXI0?=
 =?utf-8?B?M09PaGdRdlA4OTJtT3IvaEpxY0VKOTZlRHl6TnNsZFkxTis1RTNzbkNzQVRm?=
 =?utf-8?B?TUFQSEhIWXF3bE15YVpXQ0xpV1J5OUFteXhDY1JwMlhrUlpGeGltejJyT0lB?=
 =?utf-8?B?V1c2OGJ6d3RLNHNaSFRZVU5MTnMxQ3lVelFaelVtTGpSem1ManlUOVRISkZU?=
 =?utf-8?Q?lJt/43bymYFUSC2+gsy3PalH1UxKtMZcCazAHGb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25b325e-7295-4e35-4aea-08d95e639516
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 14:06:44.7194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MSsKLAprPrVcQmGHRk3qJmplv3BrywT+z911RSyW4dKYg8rwyhpjJXp3lsVR5txvH6KxNebYJ/dTpFCCT0OuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 13.08.2021 13:02, Jane Malalane wrote:
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -379,8 +379,7 @@ int __init dom0_construct_pv(struct domain *d,
>          }
>  #else
>          printk("Found 32-bit PV kernel, but CONFIG_PV32 missing\n");
> -        rc = -ENODEV;
> -        goto out;
> +        return -ENODEV;
>  #endif
>      }

Afaict here you're fixing up your own earlier patch, which hasn't gone
in yet. I did expect you to alter that patch and resubmit, to then
omit this hunk here (again in a resubmission). With that the patch here
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Note that generally when a patch depends on another one which hasn't
been committed yet, you'd point out this fact in a post-commit-message
remark, so that reviewers (and possibly committer) are aware.

Jan


