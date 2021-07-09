Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA63C22E7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 13:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153575.283729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1okr-0000JE-AM; Fri, 09 Jul 2021 11:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153575.283729; Fri, 09 Jul 2021 11:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1okr-0000G8-6Z; Fri, 09 Jul 2021 11:33:13 +0000
Received: by outflank-mailman (input) for mailman id 153575;
 Fri, 09 Jul 2021 11:33:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqbd=MB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1okq-0000G2-3I
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 11:33:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70529bd5-e0a9-11eb-85e2-12813bfff9fa;
 Fri, 09 Jul 2021 11:33:11 +0000 (UTC)
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
X-Inumbo-ID: 70529bd5-e0a9-11eb-85e2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625830390;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9kK0lePgWZ7iWYenYpILaIvYBKVL7vzm5fHWixv51d0=;
  b=a8KAGV1PFvXdOtNqICQoCsF/+bZFkF7ZJmHSIV6bj0YIA9taS5fmK+PH
   piS2jTCpxFADCZrpFxZWXBYjUw0Etw7StwyuTudjoDHLqssMuH9Ger1ND
   PqE04I/tsJdN8CF+MctIZRrH8jOuNnr153M03hA1rEey/AIEA0WbUiFgr
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VwgHp0l8+UBPQFz7BQZ+/ZhEWgcwn3vqsPS3HF73sl6SAOuVMmmJt1+rKuBUmX4VHHh11tHnI0
 LsMqjHerzs1CCFAi0RKjO8kzfvLhduZOqtFXwvhDstGtHqM0jwGNE3sGSO+Uu285QaJsgJMrQI
 SUyodVydSxn9hhnyi6lbg2odvryX1mLFM5bzBnupuj3umReGA4HshvQE/7ZZkd+JPk+2hH8f8v
 PerDkREFYxdEKThaQCdhrlbMPpxkYfhWpkR2ahZso20IJd4FP+WrMpYlUpDxC6NK/s2X025XVu
 LdU=
X-SBRS: 5.1
X-MesageID: 48302201
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:X8Ip/qs5oAPYy1UvHr4KVDZP7skCgYMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK6yXcH2/huAV7EZniYhILIFvAf0WKG+Vzd8kLFh5VgPM
 tbAtFD4ZjLfCVHZKXBkXqF+rQbsaG6GcmT7I+0pRodLnAJGtRdBkVCe2Cm+yVNNXl77PECZf
 +hD6R81l6dkDgsH76G7i5vZZmzmzSHruOrXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6T60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKfQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgkdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGf9sRLQkjQZo+ao7bWbHANhNKp
 goMCic3ocWTbqiVQGagoE1q+bcGEjad3y9Mzo/Us/86UkcoJk29TpA+CUlpAZ2yHsKcegN2w
 31CNUdqFhwdL5hUUtcPpZKfSLlMB2BffrzWFjiaGgPUpt3Y07wlw==
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="48302201"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gy5kb5wDjoB506Z+NzUJ2QDTvYVMFfKbmWmqSQMMMtWQqNxpf/CdNmI0O2bDXQkrE1uRRVVv49ZDZole5PhL/zzsfxPotCRehD/5Wy/nwediK7Y6ZXWqD/Hk3JNC2MB5PYRANnyTzFz3Fed1f6Ps7KV37w8Mw4tK58smLyaO0KqhZvMtlZSnzPClSJZahODOjgW37c3YeDApjAjSD56ovfasDTWEH+0Ot63bikmiWEyl0L5DgowW3LJhUNJrYyJxtXx29hVw+iC9mnSKvl+kSKlVH6RzMwshatsAE2IrZobmspv0xLY0owTb7EcKgLHNoEmqJbsvc2GChyD1hzHwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kK0lePgWZ7iWYenYpILaIvYBKVL7vzm5fHWixv51d0=;
 b=QNKeJ9fjOkZvhpF1AezzwpGrsGMfQsvHhjfbHmpELWV+b/MivNwunnoLPXfY4UHnVlBKZh5J/8cNWnLMlJne8pMEtvUApPAw1qN+YKKX2d8lr3C99gVoIXj/iemo7fKkvNyvaSRUDhj29olg8XPQFPbasu/nMaBxZT1tAnid8fFN9w0Fq/08OHPBXyMDBBoTL+B1lmLBaLWFAU7iHilSPpqQBHtsaQN97YSqryJQwpIj48FRTYXpR0WQVFarqFvei+QA5GpXPpsMqHRwEhHZjU48vGYEG2CxhqTykEOCoe0b4FDBfahaswwfMI+N0jddRsOcVd0fagAQAx9TQ/MZag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kK0lePgWZ7iWYenYpILaIvYBKVL7vzm5fHWixv51d0=;
 b=pduWlwkcTpQT5sj+kotAPqqtOGxF8+N2sOKf2ya1oKhe4lvZMDc/knybOzd7smQmMRyac5Rqkjmv0K8LmIU/ynPOD8Vyg08+uMpkHgAluEdjGyz4LZkluG5dY7sAYOsrMGTHGHPOEWJAYTKNLWMyttnt4yxa2CZemPYt9iybikI=
Subject: Re: [PATCH v2] tools: ipxe: update for fixing build with GCC11
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616131435.27770-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <90c83829-7c4e-49b2-cc94-7791b38d0c65@citrix.com>
Date: Fri, 9 Jul 2021 12:32:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210616131435.27770-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0329.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d4a319b-e9db-4a3b-ed6f-08d942cd443a
X-MS-TrafficTypeDiagnostic: BYAPR03MB4872:
X-Microsoft-Antispam-PRVS: <BYAPR03MB48724B581BA763483833CB7ABA189@BYAPR03MB4872.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:336;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCiqpAzWW0czI1zsRISkBjypuBb4AP/BiacoD2cezvfU9POrY3TD/x37TOMgC0NUADNK5GQciWNUD4u6pnnLGPI6LorhfBTf8PsW8ikLA+LlJQihzmRFI85gdGbM+8gS8tDC8jWRPUB79AcNoisusOxIIRg4wSEvLTcjNAoF+B71USuDmGl0ADXI9QuTnY21PWEopOyPVamozLtPwjTqvKNV9E+vW7w4gzXTKAKGJj3G+m1H52vIO0C/29LDLbwOSi2U6Ku66wxTk5w+wXir6O/GJJ14hUtnysuSO6fqBJ1Z7sPRrQHLNYdK/F4suiZM/0nlXU2H3Ck7ZymMlSkM9efmR+IvORy4FNhBpVZQJN8uwZlVsCVgvWOq95qVfcbuPCK7KoIvkfjhHTWPNSbmOlNJ3KnbXMf8ZLOkTavk7g+vrlm2T+XJlc4UrN75gGg4ByenSlmNh3dP1w0y9+EstSxs3vUdCIMyctBuMTrjHi+k3KqgkiiPgBRq63OcjZ0AVy+lZ+gZ9p8nr6HvXRdrKuoGPjo46rFhHbhl1LspL4znp3ES0phzvamtLqkeXPFpnquNcuRGKSKVIG/HPILToyMRyYC6CStYV39WePAxxt8+3N81q2dC9YmIA/N2eEr+S4k4oe43mo+WuWC8+l0s1xNKPLiwPavnCQmVjIcC1AXBEKFF5VsC6FkaeWnWa/evfpUvBUATh+zIsQP9HT8YDwXc4PqKbVj+GAqeHoP7sjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(36756003)(6486002)(2616005)(186003)(478600001)(4326008)(5660300002)(66556008)(86362001)(4744005)(31696002)(53546011)(8936002)(66476007)(8676002)(6666004)(38100700002)(956004)(54906003)(66946007)(26005)(316002)(16576012)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wi9pMHFvMXdVMGZZN0xLdGdmRHNOdkFKNUFnQlhJK29sdkhSVlA0UjVOeGhj?=
 =?utf-8?B?VWt4a0NVbG1Nc1dXMno1NG02eHZSelB0TXphekdYTEdOQ241alozRW5MbXpt?=
 =?utf-8?B?QnF0R1NoSzF5YTF2UncyVFplWG8zWjB1Z25jMmsyc0pmMDMzZVJEMjNDQm5r?=
 =?utf-8?B?NzROOWloQmppMTdIUUZkeTNEd055dkJ1QXM4UDNwMkl4VGFuV3V1VE9KZEVT?=
 =?utf-8?B?bU1vUDg3RCtreGpOWWpyV1M0dUZlNWdqUEdMeWFRdkRVV1JFQnlxYnB0MEFn?=
 =?utf-8?B?YXZmelAzWG5id3lKV3FvakV5VGFVSWVERzUrVmxFaloyK0pmc1ZNKzVJZ00v?=
 =?utf-8?B?bjNIK1BpbXk1U2p1RnZ4QURpV3NCMjN5QWh6YmZUcDFJVmFZSTR5VTZjMVdq?=
 =?utf-8?B?MmhxWER3SGdpTUhNT2FaU0pFKzhJTlVXMnhQRDJ2NmVoSVFXY2g0cU5rM09u?=
 =?utf-8?B?Yll5Ris3TTJGVFBQMlNwSEZYNS9UdUlqS0hieXR3VlhPUzVrNFpiYWpnbGNL?=
 =?utf-8?B?Ujl0cFQydGxaM21YTG02eGFOR3JVdXFDME0rUDN1SFBYbnZRSEViY2w3cTRQ?=
 =?utf-8?B?VkxLNmExS0NZNTJpYmdvZGFmUVZrNmZteFl3eC9kV1Nia0dWdURrQzZvbk5j?=
 =?utf-8?B?ZE5QakNUdXUrQnd6a0xmeW00NUw0R1ZFUkczTDNTL2E1bDc5SmV4eGhOeE0y?=
 =?utf-8?B?SFZuNDNRTFhpYzVOcm5JZ2dXQW5hczBCYmpWRnJ4TmNCVGJ4ZWxXYTFlc1pW?=
 =?utf-8?B?dzRxb1pZdTNIUm9zNGVQK0s4N1E2cnlUNzlKck5FRzdkR0F6bXlDeVZxaCtz?=
 =?utf-8?B?MEdRMVlIOStOdzhMandCc1c5VExqNnhxRjh0RGFlSzROelgrd3RERGE4WkFt?=
 =?utf-8?B?YmJOeGpXZG85R3BNSDViWVlicUtYV29oSStnVW5TMHNwV3VxNDYwMU82MHh2?=
 =?utf-8?B?WlNwQnNZVkVzbmNqUDc0c042Tk5oTUVibnJmTmluUGJUKzZ6QmswTlJ2cXN4?=
 =?utf-8?B?RkgrVE95YlNDL2lNdXVBV0RPVHBtQ3diS1Vld2lJcEQ4bG8rQ20wTnZBNUxH?=
 =?utf-8?B?R2l3UVd4aWJNbzZIRkhtOHJtMGN4dkFrL0pra0VkKzVQZ3dVSjJXRWxyZ3pR?=
 =?utf-8?B?U1l5SDJaWUpUZVZUemNJd0k2V3E2V1JVU05HMFlCQUtmTldUZkMxRUxTQ3B1?=
 =?utf-8?B?RGYwdzQrQVYwMTIvUHc5NlNXOTc4ZGFnWWJQUnNOQWlCbXEyakV3YmVnT3pF?=
 =?utf-8?B?Z0haOGl0NHV4NzZJeDZzdjZNT1phcjN2SDY0dlFNSmQ2bXJObTJQZ2dQOHVo?=
 =?utf-8?B?bmJRZlk2cjBRRkgwbStXcnBWMS9IQ2g4amY5eE5IT0R4blRDSkZTYVB3MmhE?=
 =?utf-8?B?c0xGQjIwODVDVGpKa2h2b3BvUldhRGV2bHA5WVlZcWpyZWZRYnljVGpZWHFr?=
 =?utf-8?B?c3kybzlXY2lOcVFWKzJDZGgveXRBSHdXNGgzYktnUm1IVmZZNnFCbnhQc21l?=
 =?utf-8?B?d3dXUFBFbkRaa1NwRElDSlBvc3QxL3RHZlQ1VWY3WHJrZEJiZ1h3Rmh3QVQ5?=
 =?utf-8?B?dyttNE1oSitVL3VaelRzbngxVS9GMkhpMlVreHRrSzVrcHZLNExJMVFEL0JT?=
 =?utf-8?B?Zk5idml5RVBPaVlEQmlTa0ZzeHY5MXlrN3RkcFdoNlU4RzJLWFdWT2c5aGQ3?=
 =?utf-8?B?RkRrNDYvamJhMm9OeXQ3ZHNLanYyd3Qvd1N1TUVHNzhLUUtnUGJBSjE2c1Ex?=
 =?utf-8?Q?8+1/Opat9uqwfPUHO3BZfm3ZAfByebMB/Up6AFg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4a319b-e9db-4a3b-ed6f-08d942cd443a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 11:32:43.2875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOo+n1TwnvDpmqHR6LJ3db3lwqQTkfys9Fga8zXGR7YLxcS025ngBe0P3sMBf6nFR/hzUmh8fUNDbZlREdkRRB+tfR1gbgJHDJLkuEa58mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4872
X-OriginatorOrg: citrix.com

On 16/06/2021 14:14, Olaf Hering wrote:
> Use a snapshot which includes commit
> f3f568e382a5f19824b3bfc6081cde39eee661e8 ("[crypto] Add
> memory output constraints for big-integer inline assembly"),
> which fixes build with gcc11.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> and committed, along
with what is hopefully the right rune to do the xenbits tarball

