Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D37244D40C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 10:27:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224653.388068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml6Lv-0006Bo-Rd; Thu, 11 Nov 2021 09:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224653.388068; Thu, 11 Nov 2021 09:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml6Lv-00069Y-Nm; Thu, 11 Nov 2021 09:26:39 +0000
Received: by outflank-mailman (input) for mailman id 224653;
 Thu, 11 Nov 2021 09:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3rQ9=P6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ml6Lu-00069O-UV
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 09:26:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77b8f61c-42d1-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 10:26:37 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-TgmLRbP1NL2y9yd3MFhORw-2; Thu, 11 Nov 2021 10:26:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Thu, 11 Nov
 2021 09:26:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 09:26:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0048.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Thu, 11 Nov 2021 09:26:30 +0000
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
X-Inumbo-ID: 77b8f61c-42d1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636622796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BlCOUlTbakbaK2RQv7+0DXqzQLLvjdR5sNIPLuL6DLY=;
	b=hBWzgweL7yr+qrUBD86RLta7OEv6J97+oLePioztpwEZV9s7uKVU+IcRH6awDA4yxi4KIC
	OMfB4zS1AEiTPpijHxeHRfoEEBDGUDBQONiOX3y8K+0VZb2ZEhoTo4h4EXly9uHgdGd/PK
	V3RX/cVORlSuWPZf8ZD3UlgsQa8a+Ak=
X-MC-Unique: TgmLRbP1NL2y9yd3MFhORw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/UnezSWjpilH57MAcUvzQqpm8EPVI/DMNgOshKEnHKLjauIbNbyh6bzIFmnO/OzMqXVn6EjSHVL02eQCWWwQUTWy9eLoGVZuAySrCOfJ7Pr1KeQAqoPjwTBOiLALMeipQ/uvZXjBMXrwhdTv2PN8XJcKHbtvEklY2hfv8POUjI0BdDLurpbpAxLNXBOjARxqta+l7UhsPuE9TVOy2Z6e36bVXq3l6idfWhizA7xdegHLdmy2wuPpFNrL5ReM7hVT4XAFyKEntH99OBptA/ETRaJ1x45+XUiCtocPtECW0kBTrWh4eyRep8OG9YkWN3LWjEZbk/9lG/PUayTuDTjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlCOUlTbakbaK2RQv7+0DXqzQLLvjdR5sNIPLuL6DLY=;
 b=HouJXqUyc23yajTNp5iavLYKtn9M8nZqCIwDE9dDnIdqW71z+a4+qv1GVN3tJlyM2oYv76qJuNBVeO93SXbshn3/7W1mJWbsx6j0DexGISjXXucKpBayUKGK/ghy2STUhHpX/vX9rmWgs1VnKgWW7VJJZN4zF/Aq5O1uPYZ/bqas7FgLL3PY5PmP+tCP/Y7bucnTHn3NlmBUH2Jp/SNbgBa2boZDl31bgQxLUFZmV6Sva3ampqhuxr4khev4bPfIYj+ymNhusoy5ayxTUkOBzuGtsIM7n1600Tl782GIxNtgIJDb0HX25iWVae91aSzt7Ff6HxdLYf3WjR7AVtadNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cb7444f-b1ab-524d-f94a-ede990b64f9f@suse.com>
Date: Thu, 11 Nov 2021 10:26:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] x86/cpuid: prevent shrinking migrated policies
 max leaves
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20211110174059.64633-1-roger.pau@citrix.com>
 <519775a1-ba90-c5c5-82c1-abcd8c4ebb01@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <519775a1-ba90-c5c5-82c1-abcd8c4ebb01@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0048.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 436b768a-6f76-47a2-5a8a-08d9a4f558f1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35358DD4D6EC8141CC832861B3949@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HQf2atvXSBPK6WN73qgmhXugQNxuX2ce9fbvwDHsIPFBIOfJJx/0BdEOfZLGZ8J/mc/pAP3U3RZ/EAYumI66/b/JTxsNl8o7G+RtCH8i+xEdb2Gugu3+mA1PEjq/oHySHbedYetl9dWUWhtUZ2Dt9dAGEse032MgviJLPplGurpftoEpJWqNQ8YeTdaZLa6CXOjLbNoFVmEaZFGHxaIyibnvVPHKhUDdlRDIsqWT3NvuKJYxt9IOQtgW/FWlReuBVclG3pTjON8cY9isQygx95wcRwoA7yMUWRlNPandaOvmDa3qzEo8mssYdIrjPj7OnK8vGeWJdJ3DRIRLNs9pAsNHGfudh9X4PW40fbARPhNXCZJkyrgh0SmIn5WqR4ZB7H9022XA5CM9yHwP+O1uSSsuRC36MROESufdwaEISlIVl9OzfwFWbwCvFT6Wx06ivFtkjRG5+tfq3FN6KlnYf2+ccRP/SKy7iEmVetrIRHOx/CGQBAhYFjZVP/BZUQGXkvpeIFH+eWY0Kd59FTQLkwQg3dtyFBEhfD3FUor+ZrPfweYkmKTxKiIDHGDy6cFp2eIlQ6AmTYL+4dmXecViaoy3bRidzEaZpmoGa1uAysnJuDd5w9m1EnAqBD81mQ6yGnq/UY5FlhYLDpwsKtv48zMv7Dp0CPBtOKZRuMereDsL05ZyLM0uDJe5wpQbNKPAgt3C5M/z3Ja3TaqvbzXQ5rxf+uHKnVKVvW6QHMErhrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(956004)(5660300002)(54906003)(36756003)(31686004)(83380400001)(186003)(2906002)(26005)(53546011)(38100700002)(6916009)(8936002)(4326008)(6486002)(8676002)(508600001)(66476007)(66556008)(66946007)(86362001)(16576012)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU11Zkx2RUJ2N3B3RHdOSU4yZjVKYStHSXNURTRzUzBHMlhDUHBoQ0Y4TnFD?=
 =?utf-8?B?T3hHNkRZeE84UHMrVGQyaW9KSjIzeFgrL0k2OTlybEJRdVBxTlYyeXk0ajRs?=
 =?utf-8?B?eTRLcWhDYWdDSmFDQVJoWm5iajBNNW5ZcG1GMGZ2NGxzdjF0ZDNEVm9PTTBI?=
 =?utf-8?B?Tk9pWUE2ZVNwZ1lRbllJTHVjeVppUWRQY0lWTkplOE1BQk5lWUdIU3g5VjQ5?=
 =?utf-8?B?R3VlUHZkWEFyREJzV04yV2JlajlvNU9ON01VUkk2THI0a2VWbEFrZWppdzZX?=
 =?utf-8?B?ZHFZR3lRTWhOOWZCNG84TFVjRCt1YlhEV21ITmd5L2NxQllJWlEzVTdmVDhE?=
 =?utf-8?B?MTZINExTa2dFdGJqUmhCc29EYkJQdmxZR0dJR1JiSitDWFlUaFB4eUNTdkk1?=
 =?utf-8?B?b3VwMmQxZ2pNK3hNS0c0Sk5Rd1lMZFVCdUFPSC9sNUR1ZmpmUXkybWxjYXRX?=
 =?utf-8?B?OCs5Wk81bWRjZnlPUHNKZlFnZjNheHhFRklXb2t0V2F1NTJaYm0yTGxjQytJ?=
 =?utf-8?B?cXN5Um9qSmIreFNOQ245WStOWEZtN3BuTU1NNDlDYzBKd3Uxa3A0Z0UrZ25k?=
 =?utf-8?B?K2pjK0JUb2JMQW1peDBrZEtraEtCK0JPamQxd1FSUklmL0FrVkpmMEZHU2dH?=
 =?utf-8?B?dTd0Uy8xcEc5VEdwTllWaTJhOHhNR0kvMUNralEvdHBoY0J4MktPWG1uTTVM?=
 =?utf-8?B?ZUxwWE4zUFpOcEhVdGJ5N0pjQjdqVkhndEZoclNqVU8yVnd0eFN1c1p3WTVZ?=
 =?utf-8?B?ZDRBOTJLQ2lVVXFEUTRTV0IyL2dlemo1OWlsdVFIaGs0U0ErYkk2YWkzNkFX?=
 =?utf-8?B?Sm9oclI2T3pzQTBkMVpQTmcybUdpM0s0Q0F3eWFzYUE5MVBXWEtVS2gyZHh2?=
 =?utf-8?B?L1FtNlgzUzhSWFFNS3cwYTJSOG5jeDF3TWwwYmlqQ01iOUFSNTMzNWI1QW9U?=
 =?utf-8?B?eGpHMVpqVXBqN3pVR3lOcUR6NVlDdW10U2lVZ2lhaERDZXBESmM2d2ZMSEZj?=
 =?utf-8?B?WEVDV201OElqdlhHNWd2SmhqNFJPeS9XTEJRcEI2YVBXWUo5eklDN3RZWlVR?=
 =?utf-8?B?bE04Rm5QVW8wZCt2NWxTRlJacWhiNXpNdUxjYVdJREozT2dlSmNGYXVWb1Mv?=
 =?utf-8?B?UzgzVWlXRlcyWDlUN2htcFpkNzR6em96b1FGMjc5clNVdmF1YXNNNEtkakda?=
 =?utf-8?B?cnV1ZFpHZ29abG1MM1I1Um5DSjVHcXcxMXFJTFEwcHNocFNCL2U2MVVvdXM0?=
 =?utf-8?B?R2RvVEhoaGlBd2NhVHBLaTZQVElHRU5oY3lmUjYrcjY4MTVjRGtZRUQxOGFR?=
 =?utf-8?B?WmlFNDRTMFJwazRHbVpDV2pLMTltc3FDK3M4bVZRVFlCUjBXLzdXam1oWGlh?=
 =?utf-8?B?Z1FaZWRpMTNnV0p1VEExanZHTXlRbXI0QzgycFUrMlR1azdQMFpXbjJCaU0v?=
 =?utf-8?B?NjgzTVdGWGNodWtYekh4dE5wSGh6aWx6WnZOcFN4VmhQMktGM1oyellSbWZR?=
 =?utf-8?B?SkRydWk2UVBQYmhlbTgvRFFWYlFpOEFzNy9mZ2V4MEduMktxVEtRU29xamRU?=
 =?utf-8?B?aVJ3Z0JEZGNGTldpdUsvNzZNZnNHajdqZkw2Qk5lM1JaZkUwSlI2Y0Q3UmM2?=
 =?utf-8?B?NnBLSWV2bEtEenplaXN4Y1V3Yk05Zzc5Uzk0SmYzSnpiY1pqZk9sSGhkbi9E?=
 =?utf-8?B?VExuTThqMUxzQTI4WnlRa0hJdXBzSlhTdlZsaHhTWjZPUHAxU1JPSjFGNU1l?=
 =?utf-8?B?bGVFMGNmeWtteCtycEhRSUthT010dW1HUFJxQWdvdlZUd0Y0dytzZVNxVXRM?=
 =?utf-8?B?SDdNOWtpUXpBU0JjRStyWXlXUHhSZC9nZTc4L0lnMEVDTHVtbFFtYUlGOXdV?=
 =?utf-8?B?SklEN1B4Z0lqSUw1bnIrT2VCWDQwaU1NNTVJV0lTdFFnOWk3TTVIUExqd0Fq?=
 =?utf-8?B?b1RhVGJDYkt5WWRFazhybmZaK0pPOHowckJXWk0zM25zc05ZaDBzZG5tVTZp?=
 =?utf-8?B?alJFWXk3Wno4WFcrM3JYU1B2REZuMzlnY1p1cGN2RVE4RlZkTkw2V3Y1cnhJ?=
 =?utf-8?B?S0tmSEs3b2liK3hBTzFVNFlaYmUySXhiVHlIN2I0T0tONVZKMjgrenMrZDNj?=
 =?utf-8?B?eWJocjJsaCtncnN2dmFkVTlGeWRTbllmMkZxdjM2T01LSHp6bmgrMGtnVnRK?=
 =?utf-8?Q?jUIDFDIZS9SC7hbXGc+b5KE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436b768a-6f76-47a2-5a8a-08d9a4f558f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 09:26:31.7490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzh9g85tLyTdPmLz2uVIhrTYHsi0QGEjtgyhIoy37mLwMZ5R33ii63kYOCotb54O9/sOp2n8ykR3aUfH0GRB0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 10.11.2021 19:17, Andrew Cooper wrote:
> On 10/11/2021 17:40, Roger Pau Monne wrote:
>> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
>> index 198892ebdf..3ffd5f683b 100644
>> --- a/tools/libs/guest/xg_cpuid_x86.c
>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>> @@ -638,6 +638,13 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>          }
>>      }
>>  
>> +    /*
>> +     * Do not try to shrink the policy if restoring, as that could cause
>> +     * guest visible changes in the maximum leaf fields.
>> +     */
>> +    if ( !restore )
>> +        x86_cpuid_policy_shrink_max_leaves(p);
> 
> Nothing in xc_cpuid_apply_policy() changes any of the max leaves, so
> this is dead logic.

I guess you mean nothing there does anything which would result in
shrinking of the max leaves by calling this function? Yet even if
so, isn't the call here to take care of any earlier changes which
might have resulted in fully blank tail leaves?

Jan

> xc_cpuid_xend_policy() can in principle change max leaves, but that
> logic is all horribly broken and I don't recommend touching it.
> 
> I'd just drop this hunk entirely, and retain the deletion in the hypervisor.
> 
> ~Andrew
> 


