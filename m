Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4AE3AA309
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 20:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143502.264442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lta5E-00016k-Vm; Wed, 16 Jun 2021 18:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143502.264442; Wed, 16 Jun 2021 18:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lta5E-00014u-S7; Wed, 16 Jun 2021 18:16:12 +0000
Received: by outflank-mailman (input) for mailman id 143502;
 Wed, 16 Jun 2021 18:16:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOo1=LK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lta5D-00014o-Cm
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 18:16:11 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df8d5487-4cf7-4e2c-a0f3-2c4e903ff88a;
 Wed, 16 Jun 2021 18:16:10 +0000 (UTC)
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
X-Inumbo-ID: df8d5487-4cf7-4e2c-a0f3-2c4e903ff88a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623867370;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sNpQzDIlnm7MsoEC/S7AiHE4ULsw2UwrHUkFA0POEGw=;
  b=IovncgtZWagR36jRrGvMV7BgRzt8deuiYXRTJ2de9H9g6mASoAbBAx3x
   CitTTkziJnpywg2PlSEqupQMqm3jbC7NUuJXhdRlcg2R+a65zB7knuRmB
   7+vJ/ZsAdqiKLHvY/z68MafibBTnNX7Vgse2Ivk7Eju5NEiT77h8a4I+7
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tcPL1OS48t9WCPHElOZERB02mnYsCec8GziUNLcgrMv0lGAbw5ORGHdYjCWU3DtTHspRCLrlWY
 IWru/Y6Bjcxme8U94WuunZscC0LZdSi6wMonc4Je9qBZLFsIDqPqD8lrOkXRmJ2G0TXZXx9cdB
 96VWt7jFvwr2JVog2R7/3dpmbslmIU9Le97BsQZj/xr26+8cIhZVZ4pAdI2NoVyS3LqQIFU1g2
 treK9jRvLsaDXzebSrqBexx2YCbZ4fvFwp1+PtRRbjpYqqp/HsJkNwCzz4U6dqBCYYdXMKHtwe
 JZU=
X-SBRS: 5.1
X-MesageID: 46299123
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LGaQka1wt1H47nllPsMdTgqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJE80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YGT0E6MqyLMbEYt7eI3ODbKadY/DDvysnB7o2/vhQdOD2CKZsQizuRYjzrYnGeLzM2Y6bReq
 DshPav6wDQAkj+Oa+Adwg4tqX41pL2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTopOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpMCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvErf2UIUh6bD3wXklV6vpREnBmcYa+a
 hVfYHhDc9tABanhyuzhBg3/DTENU5DbCtvQSA5y4aoOnZt7ShEJ+Zx/r1Xop46zuNLd3Bz3Z
 WODk1ZrsA7ciYoV9MKOA4ge7r7NoWfe2OBDIqtSW6XXJ3vbEi91aIfpo9Fv92XRA==
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="46299123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnPrBs8mzxggplF32FEN80sBocLA7DQDv1g7MfQrtM1yHvI5j8ogHX6RKdo6+cV/JQitQpZD/z8IUeWmjcwBUaedXzQIdRyn9s0FFJK/fi2AqVYY7AxCtM+xlibgHrp8g1tUMBO+Gwt+srYQeWShL+cS2Hyc50DJOOHuuMAj9hlDSRk+R4LWZBmKNvC8lFp+IZ3IZZdTiKcKw+7AiSIjzjzh91idaq3wk6pE56xoipewbna39h/O3XNqrfJCfRX2QctIFUD3QwqpIney46JgeXXKHB+ZthygODFmvhmJb/dMAXu+FUNgXxGDgVAARoqOMh4IRLr+G3OfamTh0EJTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNpQzDIlnm7MsoEC/S7AiHE4ULsw2UwrHUkFA0POEGw=;
 b=IZHD3T2oIKqy7BeUrr/uIKfZcAr5yHhsaRcqhk6mebzaauGWlWIiWCLfIgDpHCTx/OsEfAnZwLFqjP/yfbtlzhsBZgMAWsX2K0gm9gTgq2ihsxy25erwu9aOhsKy2myDeAQFQHti+AXxQ9OknS0TRlyXdsb6NmyeNBjOmoNU8Thartes2Mn/OnptFSJF+FLaBCf0PvRXTjrnwaBqqSs0dtoPCp88IN68pJOI2VtyIQlR6l9d7nVZpzd/Hbi0Tru8/VBBOGhsl72fck8ru8cEzyRQYy/9cgkTjaLmdzWt7dL7rlGFnv3uFmdIdElKpxYGaJY529fRFi177yuifvsejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNpQzDIlnm7MsoEC/S7AiHE4ULsw2UwrHUkFA0POEGw=;
 b=bNngVdClWZaji1nl02/krQHD/Ru7I6bYmqxQER2z3ZoYGtEoc8C94dESEApULs+/J1HRbLweaB9VjVNSsDNs+11guDg0eW9TVZnjodWzrNzXircDHksqYWDaeL3umblZ1H048nTUTczBhRHljP8SFdkdav3iD4caYQs5GNMx2co=
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: hypercalls with 64-bit results
Message-ID: <d38cd3a3-6139-5ebd-6a78-debc20c3b2bf@citrix.com>
Date: Wed, 16 Jun 2021 19:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0351.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48e04db2-f3f6-4957-b5d1-08d930f2ceea
X-MS-TrafficTypeDiagnostic: BYAPR03MB4119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4119345B4842B6F9AFA58744BA0F9@BYAPR03MB4119.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q1npZMLABpFBf1LJVS8X5USPyx+IqK3l40/YT4k3qk7PaLD1iObbm94MI72tH1uzdjDlRs02b3EJWSweR7C4lvATGZnE1e4bg4dBFpOfw0bGrRR14Y2fYGPsdW4NlAwD5kBQWF538zYlbtfBbC/fulLthNEweiyPGfgI5Whu1X1obV3YQK3DDr8W+ZIWXAfxtWQ6zCGTcCaaBvWJ5iIhsZVZ7EKwDH6WgvOpnKbxWPgMl/h9GRmDBYmQLa2eYdWwCX9COG9lv+JrkJZhBJdOdl/tHE713qYO0iQTZ3uXxcsRZ5ss4IoPF4+PEcWaN8K+fa9agP69QUNxU1GAOO+gh+R8pJQTOLO9S+SeaHM1IDXB2xLAT9FqwX/qubyoXC+6Nqp4B98GjbPfvnsLwBhf0B9TM3QA4kACIMF/8xUA/+9GqS4j5SWXpJQkk6423HSKCs0sDVjh3wOTjFlGiKsVzVAupIYVF1hgMi71AMLBWMk2CSNBo89IUqNO5S6bD8PpfTP+zDI3b0HSRSTSuzB8E5D/uBETeM1zKFCBKaFAKLe1K86iVVr/3BV49dwA1zPGyqF660s/PjbYbCxKlEyXmX/T8rLbZZC7Nqp+jrFZCBncMNWw/MHoZDWfUUfA8cpbRbEds9U07nNMKHL1bHvy0rIHlcSMzFiilXFep7EaisBnQ/Gd7OUIG/5tO63VO8Wf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(6636002)(956004)(4326008)(31696002)(2906002)(53546011)(66556008)(2616005)(66946007)(478600001)(6666004)(66476007)(8936002)(83380400001)(54906003)(36756003)(31686004)(86362001)(110136005)(186003)(16526019)(6486002)(38100700002)(26005)(8676002)(5660300002)(316002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWpNOXNjWGh3bUE1MmVuemhvK0pCa1lmRVlFaU9tSDJXV3pPTlJsL2cxSWpY?=
 =?utf-8?B?V2ZCR1VmN05xZHo2eStSVU5EWGk4cjZkVExsMUpGa2RuRWI0S0twL25LYTRz?=
 =?utf-8?B?K3dFVEMrWHA5NkpsYldpN2tQS3Zha3JEci9JNWd5QWQ5cEFlMGtJTm51UkxW?=
 =?utf-8?B?MWc2SDB3MUdVL0pldHJjM1dJWlYrUWRTSGhkZjVIeEpLcmIvMkxGb21YZjg0?=
 =?utf-8?B?dEVSaVFrTWN1WUx2NlQ4dml3ZlBvYWJ0d1V4R0hlc1RsUDhCKzdrNEo0R0JD?=
 =?utf-8?B?TEVXdDBzY1pKSS8wNkkrdXRhb1pFa2d5M2JDaE9FL2ViR0hFU21HWTlvc0Vn?=
 =?utf-8?B?Rm5qcnlKTSs0NkpzUkJJZCtiYjdBR2ZXaDhMeGsxaDdZc0hPemtwV3NQUlhv?=
 =?utf-8?B?eEV0NW53RFVJZnRHNTVHSjJNUU4rQlM4V3QyUzBPQk13NDNIdHBuQnhwUnNl?=
 =?utf-8?B?Sm5iYUxZM2R4RjFUdGZEZGN0dkdwY1pBZXNWc3ZvMkZsQ3A0UXgybmZCSTRq?=
 =?utf-8?B?SC9hcEl5cEVtdndtNXhIQ1Jvei8rNWUvR1JyTDlISjRJQU95ZytvejR3Qzly?=
 =?utf-8?B?WjBMNXNTL2NtcTlhMHpYYU9ubkV5MHhNamxpK2psUGVwcWV6RWtpbWlrNjJo?=
 =?utf-8?B?NmxZZzVkZUhzSzdPZnV4Ty9WUkZuMi96bXlQNExzVkVDb1lVWk16eWJIR2I0?=
 =?utf-8?B?TXdTZHB4anc0U2ROOVhvcUJCTitKVmthdWJ3RzExUG5aN1ZaWkJ6ZFBZYTJ0?=
 =?utf-8?B?cHdSMklKL09Lcno5Z0RsRktDZStyMjlGZW1QNVNIZFdHcklGSnA0eEpGQWlv?=
 =?utf-8?B?YzFBUE9PSmJYcTFzQUdjS2NwaDZkbFRaZnMvWkxBY2xEZHpkVmN4aG1zb2J1?=
 =?utf-8?B?YjRveDg4M0t3RFJaQ3JybXRvaExpVkRsWXZHZWREa0RjSGFSUG1weHhOanZF?=
 =?utf-8?B?QzkvUndQb1VzRzQrZ1NPUjg4a05rdzlTdXBGcFlnYkh6c1NUdThMMXliMjNn?=
 =?utf-8?B?TlV2b3MzNnZmaGU0TVBZSlJIcHRaREdLRGxYYmFCN3BHOEVTQUc0amZzSlpR?=
 =?utf-8?B?VmlOK1VhT2R2NWg1RHV0QU1LeUhZbWVOME4vcXVXR1BzbHRxZURlWU5MYXdP?=
 =?utf-8?B?SmZWdmpxSFV5bis5R083MkR4OWpRaXpaMjJDdkNPcFlQaFoxRGR3aXhoVFFt?=
 =?utf-8?B?UmlmK21ZU2owWUc5R0FmdFNqVGU2TnpOVStNcXVPazVoaUFpK0dYQnN4TUk4?=
 =?utf-8?B?OUozY1I1WUxvaFlzNTlOUEdndFZISDIySU5BNWdTUUpsL2NpVFk2cExTVkxl?=
 =?utf-8?B?N1JXc0JZSXNGRFRJanh3d0ZoM2d5cE5YbUw1aWY5Qno1dVFGTHdKWmlFSUhS?=
 =?utf-8?B?aXVjczd0V2dqZ1R1S2Y0Q2JRVTRoM0IxQURsZ1AxdEJKV1Z5Wk8wK09uTU1C?=
 =?utf-8?B?TG1SUGYzVzZGY2E0azcvdXdKU0NoRncrdURTM203aTRIYmVOSkRIdWQ0YXZ0?=
 =?utf-8?B?L2dQUXB0TEllOTVydjBzdllWOHB2QWVGNG5GT2h3VGQ5c3I0ZExBM1VjWXph?=
 =?utf-8?B?alNWUjJsZUN0QzdIcHBDMDB2Q1lXQ1BuYnBWVmxXN3NHODBQRE1VazZKZlQy?=
 =?utf-8?B?Vyt4Unh6RFJ2TkpoVTZ4TkorcGtmRGlNSkNLVEs0Qmo3RjNPRkhMQ2NkSVpi?=
 =?utf-8?B?Qm9lVzhybkpzRFNDbUxRTnRUZ0F4YVZtaXo1WFJaRmtra3BVd1JtV2VOV3pV?=
 =?utf-8?Q?7brKTLb7Z7Wp4+BRTrXWhehqgBZR7SQoHu0MNIr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e04db2-f3f6-4957-b5d1-08d930f2ceea
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 18:16:06.4371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPlleJjG/5W76SiJuApEQuBEzReZW3OMOBIxjCJ6iCk62cMPsjOhUFhT5AEk4ivUhKhe2NtMCxjaf95I7NnkUAtC4aYPL0SO8rVNrF6DiAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4119
X-OriginatorOrg: citrix.com

On 16/06/2021 17:04, Jan Beulich wrote:
> All,
>
> several years back do_memory_op() in libxc was changed to have "long"
> return type. This is because some of the sub-ops return potentially
> large values as the hypercall return value (i.e. not in an argument
> structure field). This change, however, didn't have the intended
> effect from all I can tell, which apparently manifests in the present
> two remaining ovmf failures in the staging osstest flights. Anthony
> tells me that ovmf as of not very long ago puts the shared info page
> at a really high address, thus making the p2m of the guest very large.
> Its size gets returned by XENMEM_maximum_gpfn, as function return
> value.
>
> Since hypercalls from the tool stack are based on ioctl(), and since
> ioctl() has a return type of "int", I'm afraid there's no way we can
> deal with this by adjusting function return types in the libraries.
> Instead we appear to need either a new privcmd ioctl or new XENMEM_*
> subops (for those cases where potentially large values get returned).
>
> Until we manage to deal with this I wonder whether we should suggest
> to the ovmf folks to undo that change. I'm anyway not really
> convinced this aggressive enlarging of the p2m is a good idea. There
> are a number of cases in the hypervisor where we try to reduce GFN
> ranges based on this upper bound, and there in particular is a loop
> in mem-sharing code going all the way up to that limit. EPT P2M
> dumping also has such a loop.

There are multiple things in here which are disappointing, but I think
they've mostly been known already.

But I do agree that this is very much another nail in the coffin of the
ioctl ABI.

For ABIv2, there are many changes needed, and this ioctl ABI was never
going to survive, for other reasons too.=C2=A0 Obviously, we can't wait for
ABIv2 to fix this immediate issue.

However, I think it might be reasonable to wait for ABIv2 until we can
reasonably support VMs larger than 8T(?).

For now, I'd agree with trying to undo the change in OVMF.

~Andrew


