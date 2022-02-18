Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8981B4BB42F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 09:31:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275209.470977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyfh-00060k-FS; Fri, 18 Feb 2022 08:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275209.470977; Fri, 18 Feb 2022 08:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyfh-0005xn-BT; Fri, 18 Feb 2022 08:31:21 +0000
Received: by outflank-mailman (input) for mailman id 275209;
 Fri, 18 Feb 2022 08:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1rr=TB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKyff-0005xh-PV
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 08:31:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24a8d434-9095-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 09:31:18 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-bwnr58lXO_Cn0k5-iKhrHw-1; Fri, 18 Feb 2022 09:31:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5746.eurprd04.prod.outlook.com (2603:10a6:208:131::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 18 Feb
 2022 08:31:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 08:31:15 +0000
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
X-Inumbo-ID: 24a8d434-9095-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645173078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S2WcSMWv6vYT6GuxsW7yHK1xG36f0wjL73/6I1eRVEU=;
	b=jHAX3hjaJ7a6wZusMU+8gM/xTn4lj635X8qHTfo7DvncFS31Q8hsZHCxyktQm9oGKhxKRg
	HyB7NFOVVeGSk1lK6FtGQLQgswtPMZEF/sNif92Oy6LmXjXZPjcn1NjUlMwZkkX3fnDEJT
	C/U+fzZ7sm0+Je72i/Wg2x9L5cCm5Es=
X-MC-Unique: bwnr58lXO_Cn0k5-iKhrHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG5LsHdHQOKIQ0T4aiEQUwvT3R3Fj3ycsmi3lUlDewprFW6/nIjnGtgmRTQD7nW2U27wh0C0aqHHT8rXDUhjUgf2vQnp2nwZLrtMPDOYcqsnCTLXZ7MgaClaQ5ejU2bb8XEV7mXv0/7p1rtgtWb9AAHwdJA5yABylZvP5l9dnxm03bbQxlCY9B1G7jfqGaj15hCdObXwqRZnhToEWAFPOEbJzEPfcYtlV3AoX5nS13gdS2T03/7Yp2SKnKPhu8jkwXo3ARyvu1Bfr7wZthx1N+Y2TavA/fM3MA4A43x2nW7/L/hn6479qot5f0EvfkwnxNdHwnoEKd9kzwBv+veBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2WcSMWv6vYT6GuxsW7yHK1xG36f0wjL73/6I1eRVEU=;
 b=mXyHXepIBB3lXpWYvVRPWUNoyiagThiPWtCu+JtiSJDKT14OJIAqzz7NubcMnEmkx06lOgzwG/C5pVOXpXeRfQxbENx4N9nb8wVN+kQB41bgvJCYYfWx8dzLW7gYkf8vCxZ6EWzYJDP2xRxxbZW63Q0j1QaZq9Mzo6eLE8AkQOuGgTDAPHFMP0b5n0d3Hl7GdsTzpzAO2PZtCWqSGDfG3Ed1WXOHPEsoF3lf92rDJ/TiFUWivm9Y3T4PM2cKvgATXhk8eyacH4DEFfwC6aYjlPkLhunItWGFYAoSpWV5BgUMO1aaIk1BvsTpMC9MZ9cIhADMhOxtARFBuQVzDeR6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9432990c-6de4-ad12-e9fa-12792200748a@suse.com>
Date: Fri, 18 Feb 2022 09:31:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 20/23] VT-d: free all-empty page tables
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant
 <paul@xen.org>, =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <807a48fe-3829-d976-75dc-1767d32fb0f4@suse.com>
 <BN9PR11MB527622E58C2E4EF90CF29EF88C379@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB527622E58C2E4EF90CF29EF88C379@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aa9d653-9ab9-4346-f467-08d9f2b906f2
X-MS-TrafficTypeDiagnostic: AM0PR04MB5746:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5746A29B9DB772B42739A1D3B3379@AM0PR04MB5746.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SlMryBsF/Uj08xQm/GPfvOoxosY782JgDLurOO+WbIoxyT54dAccSjR35eQESNztt+V/R8kHZA7Yq0ksl/Sj4yO8mEaq2mYy9PLLukeI2OPgjHIgP+S1K2s7haj0ZgefsRFA9nGvHeTnd9hQcYmmRZck4QfPHKBT/TCZGMt7ziMHATyObp/DpUkMIk3s2zpP/i+W+z51Tab9POxQctSZ11FmE5zqkToY8J6gFIB1zoYuXWvfjkoPLcvvlSFAuqS9u37d4UJkSZ+bv1AmZyYe3BrXUlrJnU9EbHYincCSt6jXuFYGuivXpegREAmEwwsZcULHRs5welap2VNLVZKQRdyFPFBGd3cNQ2OgpGVANmFOFZmd4csp5QVrnq3agOIqJKV9X0acM+/FTl4fImkxAGuZB/4O/P1YiOHhZNDwQep672qTgeOgBIKcYn0eOVYJ7BSVAKBo4FZuOR5PGoLyGinMu3euPWGCYI0HISVxcGnyu4manAYleO9S+kuSPyDPjYUS9QG1hhTN6mm0QJi2tIXDnWQpyLii3JcEt5Qp8cKq4nTh4xF4XNkhiY8iwuSbxNP7KX4qYbslJgcT/RuSf8Bwa9aVnZ6G14qD+x8ObYuTaaVJPnxUPBeNqIKP/+dnf5qQpjWxKxHszTIkHOm2apg4bnYVxfmN853vyQcVMGCR6qTigKX/wg/zkX6M8t9Tl7iT09fiSYc4xkt4+weGRPi1XnsxW+rhYHXJxKXxSFrf43GH72bGIn1jYyDeaAQz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(316002)(66946007)(4326008)(6916009)(31696002)(2906002)(31686004)(66476007)(66556008)(53546011)(2616005)(86362001)(26005)(83380400001)(186003)(6512007)(6506007)(36756003)(5660300002)(8936002)(508600001)(6486002)(8676002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWM4R3FXVDBMaklBNlYreDdpWG16V1VVVlREeUFGRnJjSVVNcmYxbldxQUpQ?=
 =?utf-8?B?VTBQWnBSSGZ1WFhiVXF4MG1BYmpjYnhJRnVtRjRhY3pGSTg0dXZ1bzVjR0VP?=
 =?utf-8?B?Q3NGeFR1RXpPdGRBWDRhbG9Vd3pSZlNiZDgydHdzeE5OL2Q5NFBxdVppbDZO?=
 =?utf-8?B?MGZwcHdpeTRqTklWRjZnYmxxZkNpRkNMbG9DaDVITGNkTjE3aXNQSVpqN0Ev?=
 =?utf-8?B?NGlnaFpjMitqK3p4SUxxRzBYSlRWM2NLMVZMTVdQL3NGQ0wzWXVOWFdXNFZo?=
 =?utf-8?B?WTNBQ0R5STVKc3g5UC9ZSlNyNXhoKzFzYys3VHNaV1FEdUVnRWRIcDgrbWZi?=
 =?utf-8?B?VDU3K2NUS3V2T2IvMGdIUUFNN2JIOXVFdzNvMTBFamNSR1ZkUVdKQ0ltWVBK?=
 =?utf-8?B?V1lKVzQvZHpPWUdUa3ZqYkRZUC9ja0tYZWw4ZlhUYW5CNzlmRkVTMGFJWVdI?=
 =?utf-8?B?UTNXSDJKbXk1dThqN3pqYzJiZGdUOTBBTG45YXBXNFR2VmowN3IwSnplYzZn?=
 =?utf-8?B?MUUvS3Q3SzliV2VsZFJUQW0rMEFia2tSQW1weTFCRXVCSHlOeUkycitVdHZQ?=
 =?utf-8?B?QTdWK2w5dFlzdlVSVXZGZC9QYytLMklwWjVPcU56djVUb3hVV0xzZS9RVTJP?=
 =?utf-8?B?SXBZNXRXaVpKcWkrc1gzcmU3QytoSlI3NzdhNXE1aG9TZC8wa0VoQVovTCtt?=
 =?utf-8?B?cmdRajB4eHV0UWhmU1l3blgwRDgrR2ZFK0dYS3I4Q3AzeHduUE5JTXVGQTQv?=
 =?utf-8?B?Yk5hRjVmNUpmeDV6cUk2MDlTODNZNFJqeSt3UklEYk5BczB2MFZsN3htVzln?=
 =?utf-8?B?MVdRWlIzQTE0TUtkZ3A1YmluMlkwSFZzZWU1MzVXOUd4TW5Zck9HeWIwNzZX?=
 =?utf-8?B?a0NRQ1RWSENhS0pPRy9ydEx6alZlMFZLTElhSE5HQlVObjNQZnY4NnY1RUpH?=
 =?utf-8?B?SWJac3FQZUY3eG9JanJOWnZ5eXAyVjBCZlBTUmxvVnBYeEE5SS9nMDN4eGl4?=
 =?utf-8?B?MDl0OVlCRFd1MFdYTnAwU0pXUDRBVDVLL2RLbWZxcmcwWDF2d2lnSSs0QTNo?=
 =?utf-8?B?bitseUo5M21WdWMzVVN2Z2JTYjh5SncxeENFQzNWNStVRGRaNGRxMEY2OGdS?=
 =?utf-8?B?ZzlrWVhkL2MzMGF1eW9YRHNtSkd3djlTUUxvV1o2dWpsMmpyQ0cralBXZFcz?=
 =?utf-8?B?YUF5eGhsWGRuNzUxNTEzSmJ3cnRyZmxBTlZPYnlnQjZadUZlSG1uT1RCcEZM?=
 =?utf-8?B?TUl4UHdzdURHaVBaeW9KODN3a1hBOXk3QWFGYXoxdDZGUEozRUd0RkkzMXBD?=
 =?utf-8?B?ZWoxdVN4Zk96ajBaMTBuRklaNWN4R0p3dkg1Um1iYkhObHZ3TVNhU2tQZXRP?=
 =?utf-8?B?VjZ1bFBVcC9jaGd6Ym1SNGdaTCtqMVFOTUpwS3FBbWN2cG1QWjNzdVlFTkdw?=
 =?utf-8?B?NFBPNUVoYlltVmNOYVNDTkJKQ3FzY0FPcDZOdDd4L24wTTVpOVozR3BzMU5o?=
 =?utf-8?B?MWdyczJjYjNZcWhhOU00MVVFN0lJYWNRdVBjamRwbEZ3dVd3Q3FGZkpQNjlP?=
 =?utf-8?B?eGNISWlDSHhRL2tSY3JQVTNCY3c1bzBVNHowZVNlSk9XR0xiWFZlVFlJdGhC?=
 =?utf-8?B?VFJydUg1TUxLcytjRWZ1bHNhZnVESUZtUC9vK28vUG9HMG9XSUFHc1lmd1Zm?=
 =?utf-8?B?VWg0aTJpak5QTWtOOWNkWEdMVzZiRXdWU0lRVXRnVjFtOC92V2tjSEhTVUR6?=
 =?utf-8?B?TTVqQlN2cFZnQjlLR2tDS2p4SUgzZ1h0eU1PY1JVaDNFbkpndHBZd0RsZXVP?=
 =?utf-8?B?WXgyZ1d0cHNVRFV0c3pQNFdINmEzSXc0N3l1Q0NUVkNZODN3SnI2Z1AzTDNS?=
 =?utf-8?B?TDFKcVlLcVVJbUNGT3pSTmZuWUtKRll1eSs2VmZ2YlpYL3daZVltaEpvNkl0?=
 =?utf-8?B?SFRsamNJWG9MTnFSaWZOSGh5bjhEaU5yUVVwbkhwMU5MbGIrcll0SXMwRTFx?=
 =?utf-8?B?blJlRWQrOEYyTTZ5a3RRWldmRVgraW9GbFZUSVBKT3RBamlnbEhzL0NvVTht?=
 =?utf-8?B?SjloQ2I0eCtvMS9CNk5sMTJJODhhTS8vY2gzVzlTSStwajlncnZtSGFSbG81?=
 =?utf-8?B?U0YvL3NwZWxWQ1JkUExvbVZNdnh6T1NjQzI5MGZDYlBCWVJHM2pXZjBoM1NP?=
 =?utf-8?Q?APvRb7zSNA4eRs5PQHfFtpI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa9d653-9ab9-4346-f467-08d9f2b906f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 08:31:15.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ynMpSSECP6Kd30E+gAiqgH3CCVGW3QDCgpwPNHy+pA14uhfD7cxPUTSPs9pUW5HQHCewCxiEwBD5BYdMyUdUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5746

On 18.02.2022 06:20, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, January 11, 2022 12:36 AM
>>
>> When a page table ends up with no present entries left, it can be
>> replaced by a non-present entry at the next higher level. The page table
>> itself can then be scheduled for freeing.
>>
>> Note that while its output isn't used there yet,
>> pt_update_contig_markers() right away needs to be called in all places
>> where entries get updated, not just the one where entries get cleared.
>>
>> Note further that while pt_update_contig_markers() updates perhaps
>> several PTEs within the table, since these are changes to "avail" bits
>> only I do not think that cache flushing would be needed afterwards. Such
>> cache flushing (of entire pages, unless adding yet more logic to me more
>> selective) would be quite noticable performance-wise (very prominent
>> during Dom0 boot).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v3: Properly bound loop. Re-base over changes earlier in the series.
>> v2: New.
>> ---
>> The hang during boot on my Latitude E6410 (see the respective code
>> comment) was pretty close after iommu_enable_translation(). No errors,
>> no watchdog would kick in, just sometimes the first few pixel lines of
>> the next log message's (XEN) prefix would have made it out to the screen
>> (and there's no serial there). It's been a lot of experimenting until I
>> figured the workaround (which I consider ugly, but halfway acceptable).
>> I've been trying hard to make sure the workaround wouldn't be masking a
>> real issue, yet I'm still wary of it possibly doing so ... My best guess
>> at this point is that on these old IOMMUs the ignored bits 52...61
>> aren't really ignored for present entries, but also aren't "reserved"
>> enough to trigger faults. This guess is from having tried to set other
> 
> Is this machine able to capture any VT-d faults before?

Not sure what you mean here. I don't think I can trigger any I/O at this
point in time, and hence I also couldn't try to trigger a fault. But if
the question is whether fault reporting at this time actually works,
then yes, I think so: This is during Dom0 construction, i.e. late enough
for fault reporting to be fully set up and enabled.

Jan

> If yes maybe
> you will observe more information if trying to tweak those bits at a later
> time (instead of when iommu is enabled)?
> 
> Thanks
> Kevin


