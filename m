Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEBB32649B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 16:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90398.171104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFewS-0000O5-Ng; Fri, 26 Feb 2021 15:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90398.171104; Fri, 26 Feb 2021 15:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFewS-0000Ng-Kf; Fri, 26 Feb 2021 15:22:08 +0000
Received: by outflank-mailman (input) for mailman id 90398;
 Fri, 26 Feb 2021 15:22:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSsz=H4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFewR-0000Nb-4r
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 15:22:07 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a19ecaa1-c0a7-45c1-8bf4-d551b96585f0;
 Fri, 26 Feb 2021 15:22:05 +0000 (UTC)
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
X-Inumbo-ID: a19ecaa1-c0a7-45c1-8bf4-d551b96585f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614352927;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/iZkzWXubcciC54G3U/GV6lU27YWtOlUMpJqcCJP3nU=;
  b=QFnor260YGsJ5dxQeRTnTLHEslyKoQk+E017PtbbXi6x6xLRS3LUX8oj
   gQFWe/fy4scydMRrpRM+bEsygsXpLLS56dcRuZGsuJScs23EphXW5XiDR
   wuXjYTyUDpj41k+AbWRC00b+vZlpGJOaXuyOXjN2cQDNuHLUQyssuoG9O
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: K/cACOhBasEEdJMhaZj4BlKAsgJKncI0787NmpSm6EWGAbhiwPYx69eMevOxaVFvctfQR3h2gx
 RKsm/iBQ4LBC+DmN5Y043MwE9LLO6kMPds+YoUrMzllIzPV6M9rSEXkvJIc/cjEt7OiK8xojNA
 1B6upNlf4NqJSGIFcwQ8nyIl6FztOmX/GdORBSCvYmMXhc+7rFoZLgZsdZcLBiPOIEE2XclOj1
 bHKV/iLf/sF8rlruli4saqNGeMe4d4+XUQRRUhdgWgxl0Nkgn4WsWb2HCtDmCksEdqntiNSian
 PpI=
X-SBRS: 5.2
X-MesageID: 38038773
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38038773"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q89+pG9mpgPrq1fRhDBwXWdxBa7P0iyfp+vVoCVpKgIkIgNB2SbSDQPWEtZU9/Vz0sSwFEfz8vS+rVj9GK0mHBzPKUUMEnrRKmqKXFk4q2mE6z0JXkLetJcw8UkR62Pjjak42/B5uNYXdQcFTt5zmrmAetC4J1/GIAoYpuONti5O0shucy0ONSOcWbnxIVb3qVyaLIiw2yNiF6q++ONUg/mT0xjC7EPXMLF0fBmpY+tXFGksrDDPmMCXYm3BDV0hGPaaRI0dLdOE0HWi+yZrfKanuPMmdfSoApfJeDiMMVeNr8QE5flAuazE++z2+H32rkObglCI6yfbpSckeOQ2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iZkzWXubcciC54G3U/GV6lU27YWtOlUMpJqcCJP3nU=;
 b=LXA8H8X3EI6KJEGhCHdA4T3fJaPNpd8V0v6+x5SXcTJWudV5KEQVi8Rm9zkrW69EerkVTXg9/+v66GscXK94pTAPsyzGVp9dOisYV2ywhuDJfDjDMaSO6vu91t6nyC5sCIz0hnSJovZ36MeWj96JXXYjbU3pTy/bAm85qDzumYUG+trnPxFAmAVbkWEPrutvrra8yZksleJtiw/5ZjRvC0DDpjojD2xCY82hFF1Q+lCf7PTj6mYijCNMibObFrl3nIxftIFgvj16cLL18PATqb40yyxYJCTpEf6nyXFQjX1AzibHRPcXCZ/GyjHHREJVZAgctPWYQ60VWB247WwkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iZkzWXubcciC54G3U/GV6lU27YWtOlUMpJqcCJP3nU=;
 b=mSff6DmKFqbtb05iZu7AZT/kwMhHh3soHbOYLFCoDhO2VXn7h9vnhVYLod00gOqbqYav2KTKIT0mslhg1tfqTjEJtQYKZp3XJ2lMkaIZCIJmxOXH6aKZXBesix/hKu/ak+QF2PwoIY5qhzJ5ouvRGGXirzdauvIN2nAOyubtcDk=
Subject: Re: [PATCH][4.15] x86/shadow: replace bogus return path in
 shadow_get_page_from_l1e()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
References: <d6cf1205-d537-fafb-a082-e973bfe11315@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1ef6a569-f6c1-f20c-6b63-a5577cf95e36@citrix.com>
Date: Fri, 26 Feb 2021 15:21:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <d6cf1205-d537-fafb-a082-e973bfe11315@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2f92ade-e024-43f1-6a1f-08d8da6a4510
X-MS-TrafficTypeDiagnostic: BYAPR03MB3992:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB39926C1359382CF23CDE3D1FBA9D9@BYAPR03MB3992.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3aR5vjA9qlWcqtk+eXu8kUzvrV7uqS+r6wj+5pEz5TAtMR6v5Pb+lIsbUfKGFw9qsb+smqPkel40pD9jf8/EwJPhI3z+C5bcvoLFAwQC2HXZEZvu1hv2qTXjeWRT8rClfkqEtcHnIBVSKxC4mn01Hwv+MnAQajjJPWNaYDh8eAzrjCXs5lPYtGM5cCpD4KvbFauatHgZDiMmY3oIY71+0yAhlzSC2ge54Xt0a0+pP1mPWDbxSraxi7uRwMVAln53EHQ1PbcovCHwfZqs0wukJQQus4klJeBcFNf1w22O87SSraMtATyy8d+pROtBBCytcAy5dFZz/XmMbvPKwE9Y7DjlLM5yJFVQbdqvJrtJZycO/SI+mf18MPld6q70NLRl4o67ApSlkmmHAkyR6dP2/OP881BOjvzUGyfJNUtKn6UrVBn0EblbjzC0nNrrq/WPLS6bJzZi+CQiQyoEz5Pq/kKhy0tRk2igeRDOTUKjpNtBd9YoYnZi/ggoEpwLfuMbOyVPKfx5KjxekqSZbZihMZN2QSD9M6XmDji0vGFyZcgt/0VR5CAF/xJPwd7KrMf/IDyd8soFGN3GiGDjM7D/+iK6HIiKFkXtotBOSX+DR2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(4744005)(66556008)(26005)(6666004)(54906003)(6486002)(83380400001)(31686004)(186003)(8936002)(2906002)(2616005)(16526019)(110136005)(956004)(66946007)(53546011)(86362001)(31696002)(4326008)(5660300002)(36756003)(8676002)(478600001)(316002)(16576012)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eHFEYWtpbjkrSVAyWkgyeTAvN1k1TVhWOWQ2Wkw5eWVpditLdmVSOG81MXJ5?=
 =?utf-8?B?cnZkR2huOVBhK3ljNGdiTjF4QkVpSHBtTlVSUWk5UHU2QUxxdzB3Qmt4ZHg0?=
 =?utf-8?B?d2lyVThKUmVMVWRRb1Y1ZnllMHVhZWdVQlV0UkNWWExCU2tKMklCQTI1NlRI?=
 =?utf-8?B?ZGp3TXQzWXRwWWllalQ4YmJrZ2tCNERucXNVTXh5SHp4UWpNa1FhQnR3d1Yy?=
 =?utf-8?B?TndYSDI1eUFHUzc2SlU0NmVUYk9MVUlhNHo2NVZiNnd0RmtvQ3V1bkxQMHJF?=
 =?utf-8?B?QUtUMmRLOTFybmxrUVl2K2RxTlh3cVJoa2tnSnJzbktLeUVMK2VjV3JBWHVk?=
 =?utf-8?B?UlcvbWUyLy83Y3JzWXJxb1Z6bU1JeDVlS3pGYlh1NVk1SnpzRG9iZ2VNcyt1?=
 =?utf-8?B?bVc2ODVGVGtadTJCTzA4aXJqR3F1L2MrWFNmZ3pGbGF5N3AvSHRBb3Y5WWFw?=
 =?utf-8?B?WEw4ZVF3ZTBONmgva0FSYnp5RStSVlFwWm8zajU3Yk8yK0p2cHduQ0lzUi9L?=
 =?utf-8?B?ZUNsdjYrZ0tXSkpVUjFpR0Q5RzFsdEVaRjdXVFU2QjhWbmNuc01BZS9oSFpX?=
 =?utf-8?B?SDVNby9YbEtQQ0RoYWVFOHR6TTdXYm8wVGsyUkdTU1BqWnYyWXNqYkozcDZ0?=
 =?utf-8?B?NmRzQ3hreENPMHJJL0JGTFptSlVHK0VHd20xUVNMYjJpVmxwWWdyNEdnbWl2?=
 =?utf-8?B?bVdDRW8wemtsNjRIaVZBSDcyNmttNVZxazc2Wmg4eW9ZUXZEaFNmclE5V0xV?=
 =?utf-8?B?RkhOSWl5ekFKb2hYa1VxbjUxcWMzcmE3UnI0MVFBZys5ZHNXRzNaUnphamV1?=
 =?utf-8?B?TzFvNWdrRjVQSTRhVFRYemxSRm9wc1p4QTk2UVlYUm1mMXl3V05wejJKamtq?=
 =?utf-8?B?SGxDT21Idy9GdzdxVHVLVjZSVk5JNnJVK01pZXZmRFhXbVNDRldDUVNtNUY1?=
 =?utf-8?B?bVhEMnRDMkROM1g3bXd4UXB0aHNUSzFPSjliOFBWTTZwcXg3U0Fmb1pqRHF5?=
 =?utf-8?B?anhiSGxSSEZwV0laVk94aFp0aU9PWmNYYkltME1SNmNFdWdqQ2ZLZ1dheEJZ?=
 =?utf-8?B?K2ZkTXlQUlFBanBGZUVBaDNkL1pWWm5LV0FVeFFRMFRrWThzbENZZUIxSTVL?=
 =?utf-8?B?dHp1a1JkckwyaWRrTTdkdWk3RG10WW1BSjRicFFvcU1ENmdKZ0RDOHZwRmox?=
 =?utf-8?B?WDdjNGlUZ213dVZsZ0F6K0RXNkNncDg0MXJrdnArNXA4T05TZmZCQXYyUFBs?=
 =?utf-8?B?bUdGeDdoVWlNUFU5V2kxTFBJc2ZjM0I1MkxCbjc5anFrYjhRU0VHWGE3U0po?=
 =?utf-8?B?c0NFU1lrNE9ZSmRsTmUvcCtKaTl5YVR3NlB0V0k0RTkrV3RkakNqQy9waGRy?=
 =?utf-8?B?T1FsQzgwT2l5Y25FR1NNa0FTUXk1ODQxQTdTSFcxVE1uWjFEOXVoZllGV3pW?=
 =?utf-8?B?c0dpUDdoK2hzcDUyWWVKNDljTVltakVka2FHdGtNSmNPSXlrWDZDLzc1RDBR?=
 =?utf-8?B?ZC80LzRzV2NmZGNkeURJMTl6WTNIdzRLdTZmTzc2MklwZk5nWXJ5V0hYa3JU?=
 =?utf-8?B?ZnY0ZnNxQngzWXZCamFBMjlhcllwcW9WUllmMEQrd1hpK3d6S1JmM0NGdC9W?=
 =?utf-8?B?VG5tRStEcHBiNlNhT3p4U1NYdWx3ZE5WZ2Q5YkhCamNRRmo3ejU1VlFxbHdR?=
 =?utf-8?B?SCtjNmtvYjZkajMyczJaYUFKdjdldDRGWkxSVDJaU3VoYnlLZW44UUxuVDMx?=
 =?utf-8?Q?xsPyzy60D0kUN2nbyX6rSrb9ND2xpYXgexVeQpC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f92ade-e024-43f1-6a1f-08d8da6a4510
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 15:22:03.5275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADvXkMSpubPH1K+GvqHZ15f9HhGgw7MHSCapTaEemDyRodM2m2qMzGVraqZuD8W2wkjpPZ98Azmr12DOfZqeWyv1spYDmPehYYKv5gam0hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3992
X-OriginatorOrg: citrix.com

On 26/02/2021 15:08, Jan Beulich wrote:
> Prior to be640b1800bb ("x86: make get_page_from_l1e() return a proper
> error code") a positive return value did indicate an error. Said commit
> failed to adjust this return path, but luckily the only caller has
> always been inside a shadow_mode_refcounts() conditional.
>
> Subsequent changes caused 1 to end up at the default (error) label in
> the caller's switch() again, but the returning of 1 (== _PAGE_PRESENT)
> is still rather confusing here, and a latent risk.
>
> Convert to an ASSERT() instead, just in case any new caller would
> appear.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Yikes, and only 9 years to notice.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

