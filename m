Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B85F4635FE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235156.408001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms3jg-0004mq-NG; Tue, 30 Nov 2021 14:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235156.408001; Tue, 30 Nov 2021 14:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms3jg-0004kF-Jt; Tue, 30 Nov 2021 14:03:56 +0000
Received: by outflank-mailman (input) for mailman id 235156;
 Tue, 30 Nov 2021 14:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms3je-0004k9-QR
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:03:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d46b09-51e6-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 15:03:53 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-0YTFbAAgPaGVBsBvZnuDDg-1; Tue, 30 Nov 2021 15:03:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4608.eurprd04.prod.outlook.com (2603:10a6:803:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 14:03:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 14:03:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0303.eurprd06.prod.outlook.com (2603:10a6:20b:45b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Tue, 30 Nov 2021 14:03:48 +0000
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
X-Inumbo-ID: 59d46b09-51e6-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638281033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IpeNV9Kzg/iIq4UHO4dlJkEL63TnAzPG8palzs5RgWU=;
	b=Jf/DhCOQDELSl5RPeuIzaAj2mwAR3GR5vrGVf7k1frT8pYyWqjo4Z8N7JFZ2dmJz80jhIX
	EoAENjDOGRQ4AP5hT/2CGtz3qZM4n0QXyvVBI7A0EBOrGszP/thUneF2W6PQ+bpvuyyqVR
	PdWrgP0mKJjIvLDowTnvcpmGtsTO9Bk=
X-MC-Unique: 0YTFbAAgPaGVBsBvZnuDDg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lj+kJ9SbeBOtpAjF7XHwdsm9gpdlkq2SHKriaYudikOtpgpPbKD3ok/KxvKhfob4LnHHvAEAamxPta/sMl4rlIadw5tIg2PWhP5Q9ccc0jTWRAvKQOcI/w0kcJ2Nns0H60vqIPvfmYcUEqNtAStyjfnShVN3eCflcGRN7KhwNYKVCMiFYBPJtpnTi/czewjqGEtFVq9lVo0rR3dBj6/TT7k67TXd8rZmkzrcbPz2iqd5V7T0SF0cUnjvcVINgn66jOgwi+Pd7RyQ820RkeYkNTq+2xDrYfROrx4UuBx1xcD9/MXafOPxfvBbEhTc95J6neTcphsJnhoxRhK7iCM5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgIvEDRPymYqiCULnMzgDLE+GveIcMHqTNRvZc57TYs=;
 b=mYovv8PMqHhCvYCBbgqOLDqbciQ2OSqaU829TIq5vLo9CdM018LFT6iOkA45Ej58kmffB+RKPXx0dISObXHlSdR6godIHVaBcyrX19+OZHuTet5BSEwEY6gXwCqB8D+WSWWX0mBE3vaTfj2UbqkFINko8Jz/UfqyqjvVZuBFF1xK95hJX9eo8D5ub7CFw88sFXLs2TODeYt6Fc+JfENzcVQzFBegaIIGfI+sg29hVchMl5afMM1MNSra/wKubsuGfgMfqPUyJPH7XOJcww8buyDez6Zul4WHEfFYTh/ghX6K3ssQ5WPN/ub63c9nxXdHmLv8M4virvLReKLsEh9rAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30b2711a-de67-ca15-e8a8-a4c8b962e620@suse.com>
Date: Tue, 30 Nov 2021 15:03:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/HVM: convert most remaining hvm_funcs hook
 invocations to alt-call
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9fd8ba19-9744-fa50-1afb-15fae8955cac@suse.com>
 <17b42cc5-1979-f977-7c2e-a59fc97f87ea@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <17b42cc5-1979-f977-7c2e-a59fc97f87ea@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0303.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d20e511d-6364-4632-9faa-08d9b40a3bc3
X-MS-TrafficTypeDiagnostic: VI1PR04MB4608:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46088DF724A687AB880BF391B3679@VI1PR04MB4608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oVwqHem7NTumLZFGJ7hhONN0Ez6vIL9mK2i4Ayw0xpa1o7dPFO0TlWz59sIH6v+r1Q++BzzFDqu/SVLkGRERSvIb8WzYuylYcEMgBvNIKnUX7t9XXtEyHTJItSDnv0yYBkTP66Wie3YsGvAaQRID/2f+dHiWFk7d0Q4hANEjbjEtk6UzIGCr7caXHX1qoycoWqt0Yx1oBTwzdlbi9F0OwvkK7+c0bv0eoveOk51jTM3KR5yHRmni1/l9tbfoLxt+VT0rzRnmsGigyrvScR04Pben7e0+03ceogNdNCD9e7ZLIh2EphOvKQrFufNGVUSIZT43ws5fqZ7FdiTbzUgim1G1eCtzoOpdnh/MzDuQIYaK+wQOPneRTFw+aBuoyLzNqNSyhdrbI1zDeIoZLvguDtjGYUUluRqd+0frEAhUKuCZmhPdPw9hziNqCWWzdwOsHd6L6CyZcSNdK/L5qy1pmvJMjdenRg0xj45By5/XXRfIFh7MJXU0Db+cFwRZ3SODsMASOfM45Eth9BmOrqkrZIgOvqMHk1dOopNjkdL4ppIW1LfOrYXbtoDqB5b3JNmKlIhmTrSYwHONeAwRS+/L34BjMgUBBBz8bmBqZmDcDgOMFvSINSn3ctQG47nvCT0sn6RVx29kihua+rvyGiNDVDwtuE4gUGfAB1ojIBEWlOOzhO1s3gtmpbI9B5hnRJnMo8l+sPScFV2VwPDZWIUPLuDRlERzls59X0XsTfGYnenrr3pen0OjUA3N0SQwGnIXAhz9lRNf/V7PMdzvFzsFbZZ0VxQVj6s7sJ6CDjnTUZwmi1FUUkwzhg4ZjHcd1De4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(508600001)(26005)(31696002)(66476007)(966005)(53546011)(66556008)(16576012)(6916009)(8936002)(66946007)(2616005)(36756003)(31686004)(38100700002)(956004)(186003)(6486002)(316002)(83380400001)(4326008)(2906002)(8676002)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CSIyvrgaUA07dMCIiC63jZtYLGxwMb/WfJcTkPV+yeJ9cLZ+KWzBO5oywvnR?=
 =?us-ascii?Q?vwj4fCO4IwFGeMFyjTrwqY9VrCnlg4q/T5MVjmAKOo5MPIEpYvxf9kf6KZzf?=
 =?us-ascii?Q?Y/FA4BV/koLEuEko2+PHkPrhWDWEDmlrP+GvTVulDyyiKagNZtkrmPFOAwE4?=
 =?us-ascii?Q?r616XTJvym2QMHWH4xmx4FZk7pyXUfv8j6ULyAo4zcA5Ad7lfyFvtIhwhstG?=
 =?us-ascii?Q?F7vqMS6RAfMIRtPMKtEFlw8oZ0wy5cGFOwm3kbaqs+N0A2Yl8joeU6hCYc8a?=
 =?us-ascii?Q?tRQSoeye+d+9yebyOZbuRvgPZSnbjihz/ZDUjgWjyGLzu2bZVc5aa7wiqNuD?=
 =?us-ascii?Q?a+bYmWZjKFe6Cb2VGJBR+8cd0aItl3SYBX279GwBkTQevBEWLPcSXwCtIpM2?=
 =?us-ascii?Q?NdJCC4A34U5aTIQHg3nNSgtZVvDkeKrDjGRydlBjZaTPJJ6mJVPY0ln9HB43?=
 =?us-ascii?Q?ZBfhblpdHi8ExFqbfLpsbchGzd1wrvo7JnyMpJh9giFu3ylvkqzex4jtjwxk?=
 =?us-ascii?Q?nYQbkhjhgHcsVs8Y/XgK+1QB4F82997OrRiax/q6kfvvvXut2DQsLRzjQMXh?=
 =?us-ascii?Q?ODeSc3zJN5POA+bVhlcuL2LmD8JeCv/T7PFUQk8vrGaM295VDUR2ErMd9uOv?=
 =?us-ascii?Q?3OVx1bfNVr/XZ7ml+WT99ZFsUkQhmbtUQxpJs80+eXLXLsJjiNFuBHcEukoQ?=
 =?us-ascii?Q?TZmjPjptuS4UiLP/UXGMlMpwLg67Vgz/MrBwK9YK93NzYOZo3G9stxF3EpMD?=
 =?us-ascii?Q?NpRGtBJaLL0lCM+B7rapPlGChfEEeWD1xsAdhReGWmrJ3oFFltMzWngwh9zQ?=
 =?us-ascii?Q?d765dmfkUY7sPSFOe5bb5lRUtAPowM8n1/VAl8Blab4CsjVS3oU+aHmCkKBS?=
 =?us-ascii?Q?ApeNyZnY8GCL+KaGZZKja2zwQsQRgHQMj813Y8BlKWKb6SCUNadmmtOVDjsD?=
 =?us-ascii?Q?jZ1GfkkOEs+GqEdqUe3HnwqaLr9CxEpDwICsOUPLUHVnTBTKMLBliKwFgTai?=
 =?us-ascii?Q?8T1VWk3oELDfZEs2FYUJ3OQiCeBvVBc4EMKn2IRe6vgfTDHwsaDcTiMA7p2/?=
 =?us-ascii?Q?eWmIHnG10Adym9v3q6/uC5Io7S/o8u+3P1ywVVjWCyQFsjW+IKueIg1ZrFPg?=
 =?us-ascii?Q?tdtIbGirEL+zNeCd3cVelv+CkLP27q3MBN0R06nHB9WK5pGcT7HmLfxpUs87?=
 =?us-ascii?Q?YJjZo3Oaq+X357S3+QvxvTPJdlVHPnb9mPYMdbB2zzGm+L9Q/9cxHm4+mIht?=
 =?us-ascii?Q?GUE/XZOkXMkQhqziCm1LKP5XHVmyN3eqWaRtAMmhDaDIpkPLB4j5iSzxILSR?=
 =?us-ascii?Q?TWT8yOxkkLuMZPqHZXNtpmnz+ZLrB/Vk4fOlLHkDvARjCdBqpaTrSjEiso+g?=
 =?us-ascii?Q?KyZa6xikWBJZsmkFrESRekWPL3vZcsXPBTs2K+uB5nmAlY5e+ZiRoMleqX/w?=
 =?us-ascii?Q?jstynbDW2iEtvvY9oztc9+SHwrhwqNLSWSsTnTK0GRVoIt3OGLplWoC3776T?=
 =?us-ascii?Q?dVT8i+CuVIsxeO4u7MEdOjogdQjwkxA+0uWfqgqzKIzgxFWG3iR+e4s/Rl7J?=
 =?us-ascii?Q?D4g518Q3vdmwbnPVboK9fkRAYa3VronJqkUroFsn//zrmLrB5bfMXD5yyuiY?=
 =?us-ascii?Q?f+1F2oNrOCFuwDGOH95g8Gc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20e511d-6364-4632-9faa-08d9b40a3bc3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 14:03:49.6453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7BgtBUgeyWtVjvP422bgVe4UdsROwRX4X858qBmSlM1VFDAVkA/E99GLpBvoB75dyA6xfdCO3euGMT+ic29Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4608

On 30.11.2021 14:48, Andrew Cooper wrote:
> On 29/11/2021 09:04, Jan Beulich wrote:
>> The aim being to have as few indirect calls as possible (see [1]),
>> whereas during initial conversion performance was the main aspect and
>> hence rarely used hooks didn't get converted. Apparently one use of
>> get_interrupt_shadow() was missed at the time.
>>
>> While I've intentionally left alone the cpu_{up,down}() etc hooks for
>> not being guest reachable, the nhvm_hap_walk_L1_p2m() one can't
>> currently be converted as the framework supports only up to 6 arguments.
>> Down the road the three booleans perhaps want folding into a single
>> parameter/argument.
>=20
> To use __initdata_cf_clobber, all hooks need to use altcall().

Right, but that's not going to be sufficient: The data members then also
need to move elsewhere, aiui.

> There is also an open question on how to cope with things such as the
> TSC scaling hooks, which are only conditionally set in {vmx,svm}_hvm_func=
s.

Why's that an open question? The requirement is that the pointers be
set before the 2nd pass of alternatives patching (it's really just
one: setup()). That's already the case, or else the hook couldn't be
invoked via altcall. And that's also not the only hook getting set
dynamically.

> As for >6 arguments, we really should discourage such functions
> generally, because spilling parameters to the stack is not a efficient
> thing to do in the slightest.

I was thinking so too, but didn't want to fold the change in here.

>> While doing this, drop NULL checks ahead of .nhvm_*() calls when the
>> hook is always present. Also convert the .nhvm_vcpu_reset() call to
>> alternative_vcall(), as the return value is unused and the caller has
>> currently no way of propagating it.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>.

Thanks, but as per below further changes may be done here.

>=C2=A0 However...
>=20
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2021-11/msg01822.html
>> ---
>> Another candidate for dropping the conditional would be
>> .enable_msr_interception(), but this would then want the wrapper to also
>> return void (hence perhaps better done separately).
>=20
> I think that's a side effect of Intel support being added first, and
> then an incomplete attempt to add AMD support.
>=20
> Seeing as support isn't disappearing, I'd be in favour of reducing it to
> void.=C2=A0 The sole caller already doesn't check the return value.
>=20
>=20
> If I do a prep series sorting out nhvm_hap_walk_L1_p2m() and
> enable_msr_interception(), would you be happy rebasing this patch and
> adjusting every caller, including cpu_up/down() ?

Sure. I don't think cleaning up enable_msr_interception() is a prereq
though. The potential for doing so was merely an observation while
going through the hook uses.

With it not being sufficient to convert the remaining hook invocations
and with the patch already being quite large, I wonder though whether
it wouldn't make sense to make further conversions the subject of a
fresh patch. I could commit this one then with your R-b (and further
acks, once they have trickled in) once the tree is fully open again.

>> --- a/xen/arch/x86/monitor.c
>> +++ b/xen/arch/x86/monitor.c
>> @@ -270,7 +270,8 @@ int arch_monitor_domctl_event(struct dom
>>          ad->monitor.descriptor_access_enabled =3D requested_status;
>> =20
>>          for_each_vcpu ( d, v )
>> -            hvm_funcs.set_descriptor_access_exiting(v, requested_status=
);
>> +            alternative_vcall(hvm_funcs.set_descriptor_access_exiting, =
v,
>> +                              requested_status);
>=20
> (For a future change...)=C2=A0 It occurs to me that this wants to be:
>=20
> for_each_vcpu ( d, v )
> =C2=A0=C2=A0=C2=A0 v->arch.hvm.recalc_intercepts =3D true;
>=20
> and leave the resume path to do the right thing.
>=20
> While it's not a big deal for AMD, avoiding the line of VMCS loads on
> Intel really is a big deal.

Ah, yes. But as you say, at some point in the future.

Jan


