Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFFD7A0455
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 14:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602249.938695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgln8-00076q-Pi; Thu, 14 Sep 2023 12:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602249.938695; Thu, 14 Sep 2023 12:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgln8-00073z-MY; Thu, 14 Sep 2023 12:49:54 +0000
Received: by outflank-mailman (input) for mailman id 602249;
 Thu, 14 Sep 2023 12:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgln6-00071W-JO
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 12:49:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31c92695-52fd-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 14:49:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB10040.eurprd04.prod.outlook.com (2603:10a6:10:4dd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Thu, 14 Sep
 2023 12:49:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 12:49:48 +0000
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
X-Inumbo-ID: 31c92695-52fd-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHeuP/EKVt3VHQKHyHUMGqza34M8Sz/jijUd9FvH5d4vcPluOtViye+nqhRoQNnN73Jk7NxLkTVpE8gwlBt4BynT4IKo+4L3DKBy8abAlWNGE51jRQ93puIB+clhtl7ItxYUMxGR/Tv5Lw4q2HbMNuBLrTgUn4UlosEn/2R8YiipYvQvtANg/TnIG0XkuYB4B9pP0psIZLqEQduqMM9k0NXNkqVxtpaJ6Rotn+UuqpFDz+kSJ30C9VYWTHLLcQhX3S+x0gEFIvfp+NWhKMKOllywlIWB1tSzcqQ361BbTCPYeuvuSoW2ucECnmgovolepz09VqIKBjpdIHYMgp9skQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkLeLN+vJYO30GSrxCKC4jyEgxaLhRN5DhP+Zgb/5o4=;
 b=JY5BvZ9plyHsJxE44mTVgoPcR/aSLGTLnC3IJV9AuoiSXLh4cBlhwi/qGIUXv8l/tv99xXrSIle98oBdjvKE3jgrzgvPAkVury7J+W5DmwNy7VeMR5mww30TTCrHXoAAyLf5NUvtBD7sHEkc0lslWZGEeFKB1Alh0D8OrFFa9btqOXAF5zEEAFifY7EvBNy7UDP54RNy1aYR7h0z04SRphXYVanCmPGG6DRHKWQnmKMWUy7kkTfG7x+tkgBenKMNO38jck2bbnilVMkVLzm78+uFdBAOvUCd/v/efN49uiCdbCstS7J1Wrg65MJKSm99Rv5E+Y6XdGlBa5YK8JZ5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkLeLN+vJYO30GSrxCKC4jyEgxaLhRN5DhP+Zgb/5o4=;
 b=zo68cEAFfhxsl63LGczWukRlSUoxHEuprofRPQCSThmYgdBU6R0DFF8GnqXvmzZ4UFdhPhy3ueVAK96A8I8//qgAdiuJ2Gjk9DPoU/U2u4EkgDRP91o4no70OC+NIaP/SnLhfhR1RHgjg5GPV18HLcAXDc0+HlHOK+wA+0T5boBiuuuVzAsyAnex3KQdVbVuhGC4S8Lnb1kmgXtcmkGyeqtmWm4DRRvUutFXWbUMY+7QvsSlThJPNeWe6pU7QHv+8JzaZfIGRwuwcik3mli+/QQ+pK0n4Q4Y7gd/DL9TFjGahesDkGGXXwsCRsOPTYrsNNTS/RWQjskwB7kr+0TPcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8859459-53dd-aa02-b776-ba4052c7ffff@suse.com>
Date: Thu, 14 Sep 2023 14:49:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Sol=c3=a8ne_Rapenne?= <solene@openbsd.org>,
 xen-devel@lists.xenproject.org
References: <20230913145220.11334-1-roger.pau@citrix.com>
 <e2fe16de-cb08-4a0b-adfe-95da6c86ea16@suse.com>
 <ZQL-p3LJX7WfwCtC@MacBook-MacBook-Pro-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQL-p3LJX7WfwCtC@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB10040:EE_
X-MS-Office365-Filtering-Correlation-Id: b7701323-eebf-494f-3d8e-08dbb5211466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	enGR4tZuBEYwZtcAaZelSCzX6XlFrTCPidsHMxxTIVssBR0LATzXj/ow2Vt//iJba6Y7LBhpjAxTxw8pvFpnHd0zmOw0ODFKMD+CCy7ESaBoScRUZW/efeErbgHvZW5y7DBa+8W0RSDyd2uTwoVHHgqU9XbGpdUVk7o/DCj2fr5d/IngVpa7PkCQBo2sm+CfXZl8WCsedHvx+hBRer6aBklepGt4TvlYoE2m73f5QHjL1BgxLZzbtMGeXin0sM+lfKryxTnoib0GFhN/kEbPmsl7zj1Pm9fcdOb0yAWQ7sF77k5UBl9uQ7g3OFurffJr5SuVi+767dqBe0SUl5QOn5UTc66nGyS7+yD6Gq60PHSUEDMHbRchCExoVrSqvpmedzqL3hYZ14to9flAjMoMI39JMZCBN75KZ+cuRjivvnyaEha+thsmFkTebuhIVo1HcLr5SYAv9hhOxwfBjjo0BpBoU8l3oJbsSdzD8tw5Cxb0/MGZJbeQ2DMkak9594DHE+Im1vnXDbMUiEbQ98RBXWOInHrAwXMbs9xyy+vImkkJoagWab4z7V6Yf3aXCFZb03469MqHg4yTR/6aUkePEU/Zjait2JdYsFqPtSvJAlkqF2pKZrQkAv0EAv7HXN7Bop6DkDF3kyviMdhczsTtdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199024)(1800799009)(186009)(26005)(2616005)(5660300002)(8936002)(4326008)(8676002)(31686004)(6512007)(53546011)(6666004)(6506007)(6486002)(83380400001)(66574015)(66476007)(66946007)(54906003)(66556008)(38100700002)(6916009)(966005)(478600001)(316002)(41300700001)(36756003)(31696002)(86362001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWlrS2FBb3ZwRFRzV0tZMDdUMFdXWHhiVmQyMjcvTGt5djJuUmcrc1VqNE10?=
 =?utf-8?B?UjZHemtEd1FMNTd4aTZvVG10ZDZ5bU5WZFU3bjVJUkZseEtFV0ZtRWh2SUhB?=
 =?utf-8?B?dmFyREpoWUluK2xINmM3a0VEOW9XV3czbi9IazhoZUZ2a0ZIRkYzdHc5K2R6?=
 =?utf-8?B?Vk1CaFpXbWtlOTFtakZ5UVJrcjZXVkZFUXNFUEdoSUEzL2c2VjVBczRYMGVC?=
 =?utf-8?B?ZDlsK3lnT1Fla09aTzBjWlZMTS81MUorKytUczhwWlJsM2FGc1VzNWs4MlFh?=
 =?utf-8?B?THBVVlNnM3F1WWt5cU1PVzVYSlV4R0xkQTlWR3p2TmgzUDRWeEhLem9pcDkx?=
 =?utf-8?B?bjRaOGtOSVAyVjhKemFXUXB6RmxmODd0MGFxTWt6RHZyVlZPc2hXV0tja2lM?=
 =?utf-8?B?cWNTWFh0b1crelVwSCt4NlRWQVdTVHUyTzQvNnE0VFZoeEtmcjZsMUI0ZXVV?=
 =?utf-8?B?OWRMQjRCb2hld2VPRVMxUTlrNlcxMXZFOWFkR0hrOURmZm5tb2RORHAwK284?=
 =?utf-8?B?aFNHdFY0WlFEWTdUSS9wQ0FvS21oRFZVYWtKbVlQdkhuZkhjc1pPZFVVRGxt?=
 =?utf-8?B?bDhwRGsycEVIQWVKeENaeDVycG5zOWpsL2NoU3ByTEdtYUozZnJ3ek1nNUxX?=
 =?utf-8?B?djZEc2VTQ2VnQnBHTjNMMEN0eWk3Qi93enNUM2pmSzlaRG14V3dKcmpPd2h1?=
 =?utf-8?B?ZkEwRW0vWmJzaWZlMFdiRTJYbUNuVEh1L0FEMnJpOG05b1N6Q3JBcFRFUTBk?=
 =?utf-8?B?ZE9yb25HVzlvWXB5WkV2UlI0dHpKS01jV3JyNzdBUnlIaytpTWY1TVd4VHh6?=
 =?utf-8?B?Nm1XS3FSQ3ZCR3lIUFBQSTltQnhrY3dtamlwRU9VeXFsVjUzZmhUejNJZjdO?=
 =?utf-8?B?VmtqUEY3VmJEUkJMQnNtMFVjZnlzcGN1TndzWThxNTdIUFYxZzNwZDhMaThG?=
 =?utf-8?B?dWZrZDVaYVVudXowaTlaaVl6M0k5UkNWYXpMVmNyR055Sk5NSFpjRHZxU2NT?=
 =?utf-8?B?UHQwUm9XckdlS0lEbHRBc2QyVTV3bzIwMG5QczFvLzA1RDlxb1pJZjc1c0lw?=
 =?utf-8?B?dHF3OW5US0ZQU1p2MjBnM1RjMGJPTkFIWnJkODhHbXV4VzhCSlBFSk9yZWZ4?=
 =?utf-8?B?WmIyWkkxQzdHeTV0aFF1dkltbWE0OWpxSkh1aDFmNkoxRHQwRzdaSXBzWlRX?=
 =?utf-8?B?ZW9adTVJbEpjK0IwRlM5VWxmSVRYcHlUa3JpZ1VxZmQrUjk3d282Mms2NjFt?=
 =?utf-8?B?a2RnSWp3ZEh4Q0JURTBmN3RpekNlRHVZTWlqN0lkTmE1K25iSlBuTDBqeUdG?=
 =?utf-8?B?dW40WWtUWnBMc0FhTGhDZzhneHlnbUlEdW8rNGdhaDBVSVlOUVBXQ2FDN1kr?=
 =?utf-8?B?TDBycVArN1NyNkZhTEF6eHNxQTV3Y2ZwUE44NWppbk1CM2N1d2tlcmMwYXNy?=
 =?utf-8?B?T0dnQm1jNW9Nd0FmbzRxTVA3bFZTM0ptdCtRQUlPQjUwWndMVnBCUDVLK2hU?=
 =?utf-8?B?ekQ2YTdGMm44OGlwK25oN2lMUU5wZ2ZUamUzTFR6TWlaT0UxVjdNU1poSVI3?=
 =?utf-8?B?dFJlamVTc0svdjRmYzIvd2tKWjV2UEx3bEcrdjZHTzloOGl0Q0RQTkxGeDZP?=
 =?utf-8?B?Qm5ocFZIRXdFRjNnNUphR0lnbzhXQzZDeW1sMzAxNFVqRkdzZnNtTDJTQkUv?=
 =?utf-8?B?TkF4a0NmSDVIWUFrVHFXVFh4d0JONXh6cGp0b0JiakdWVDRqV0haNndob3hi?=
 =?utf-8?B?eEw4L0poUFVzeXJhVngwNGVjYUgyaWNpbnVHc1lSRk45TnhwN3V0RTFwVGtT?=
 =?utf-8?B?T21DcnJndDAwbzc3S3VaQWxVUjd4RWRDK3pWZmozVXdQeGdEaTlGb3ZFUUFl?=
 =?utf-8?B?T3YxOTl4ZFB5VDhVWm85UHlLU1FRb3QycVY2U2tLVlBWa044OGtoWkNybjY4?=
 =?utf-8?B?OWxvN2tHdHVwN3VRUU5LVkxTQ1J4WWxFdkd1dW5aWno3bkdMQkUyZEpOaEFt?=
 =?utf-8?B?NndxMHFRTFEwOHZnK1YvdDFIV2N0OE1EVVgxMUQvRzVVeDNwR2RZeUJOSXFl?=
 =?utf-8?B?WHhONStEZXBZNnp3ZmlkSVZ0d1Z0M0tFVkpSS2xua0Q1YVRKZWtkd0ZLVVhx?=
 =?utf-8?Q?zoZ4Yl/OF+gZF0UN1GoxOwyE1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7701323-eebf-494f-3d8e-08dbb5211466
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:49:48.5458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jX2lXOZvyOUKQnnRJrRV29Xr/68SxLpWdKQ4LljxbjZDvI31e73UVwvOjl8z0YbgRkwFWeGVdQYqY+U6B3DQ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10040

On 14.09.2023 14:37, Roger Pau Monné wrote:
> On Thu, Sep 14, 2023 at 07:52:33AM +0200, Jan Beulich wrote:
>> On 13.09.2023 16:52, Roger Pau Monne wrote:
>>> OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
>>> Invariant, and it will then attempt to also unconditionally access PSTATE0 if
>>> HWCR.TscFreqSel is set (currently the case on Xen).
>>>
>>> The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
>>> the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
>>> TSC increments at the P0 frequency.
>>>
>>> Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
>>> because the PstateEn bit is read-write, and OSes could legitimately attempt to
>>> set PstateEn=1 which Xen couldn't handle.
>>>
>>> In order to fix expose an empty HWCR, which is an architectural MSR and so must
>>> be accessible.
>>>
>>> Note it was not safe to expose the TscFreqSel bit because it is not
>>> architectural, and could change meaning between models.
>>
>> This imo wants (or even needs) extending to address the aspect of then
>> exposing, on newer families, a r/o bit with the wrong value.
> 
> We could always be exposing bits with the wrong values on newer
> (unreleased?) families, I'm not sure why it needs explicit mentioning
> here.

Hmm, yes, that's one way to look at things. Yet exposing plain zero is
pretty clearly not within spec here, and any such quirks we add
generally want justifying imo (as they might bite us again later).

>>> Reported-by: Solène Rapenne <solene@openbsd.org>
>>> Link: https://github.com/QubesOS/qubes-issues/issues/8502
>>> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> As mentioned before, with this Fixes: tag I think the description
>> absolutely needs to mention the (changed) view on the Linux log message
>> that had triggered the original change. It certainly helps here that
>> Thomas has already signaled agreement to a Linux side change.
> 
> Sure, what about:
> 
> "The motivation for exposing HWCR.TscFreqSel was to avoid warning
> messages from Linux.  It has been agreed that Linux should be changed
> instead to not complaint about missing HWCR.TscFreqSel when running
> virtualized."

Reads okay to me, thanks.

Jan

