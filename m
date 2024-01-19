Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55A832712
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 10:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668998.1041540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQlaV-0000Ut-V4; Fri, 19 Jan 2024 09:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668998.1041540; Fri, 19 Jan 2024 09:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQlaV-0000Re-Qp; Fri, 19 Jan 2024 09:54:59 +0000
Received: by outflank-mailman (input) for mailman id 668998;
 Fri, 19 Jan 2024 09:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g64t=I5=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rQlaU-0000RW-5z
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 09:54:58 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc7a4c24-b6b0-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 10:54:56 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 09:54:50 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845%5]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 09:54:50 +0000
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
X-Inumbo-ID: cc7a4c24-b6b0-11ee-98f2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgnLm8NRMHLvBaqL0r7h/mkft+I5iyY65v/jZZHqWymHaitCUsDFXbEK0K7KAVx487W/PemeQnVg+JbgP7jNjGUPF6P2+kxhhkxKRJFOXHJ7CyHU7QHBZNWDnUv4gpAKM22ebI3OxKScCJ4DEh8zygz0NcAcux/KIVO6QePtcgG1aFFuhTygvEIWSlMYZ9jgjHNKBooAbN7eUWCfp9z0tAUFMQpTb0OqQYkT2qgAjYsnZasZFKlN52ls585LLDD/XzcCj10jNpU0VWwbnt8LC85k2kkjR86Yf7nx3DEbEdWGz1zjGG2eCIT3pTbi5Sd2fBLVDsKcaqFeYV/VSYt8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfYZBIRYDsek3oo3J1UeIqyTfQfsbwCYKillH0oExJI=;
 b=TKbKrxxeDVconIrmHIjfdZrpgSorHpd8a7SNlnj++NN5Wk3dhQFI3jL51y9GylRAC2N58Flu/sJejoAjRLfaEt/X9MG26/bjI+o5wGNNwN3ColNlQ929n3u3f54cyebSxd+3AoTmxaV+m4eHL02+LKP/QSyFEldYyUzQ2zWhUWXdRSb5KPKzMWXFlURLwDZTiglVVpHk25/Y0CnLkD0Qgf1QxpTMwvue8klqfNXs/WRDvKv/3NcKaGLtN4UwppTY8g9sJiAh0VTNzpc+L5q4m6iPI6p/v6hlOMgYxpyvtgV8ffLLYRFXi8tYV/0NvHResB4RvhcoRgWC75iETGRseg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfYZBIRYDsek3oo3J1UeIqyTfQfsbwCYKillH0oExJI=;
 b=kGf+PywKwW3GI7nSsCMgxm6ZH7xT2/xHYgGeLpsGNfCWsH99ywcN79mWJ5bh1fxrP5cmoGNFXe+0PTTqXMYGSvzeAH21kveist/vgeU9AhUTpDSmhin/bvKkLbyKoexR0tADOFf70qE38iHvA7RkAeuYp7w/+eWszyTrexj3yDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Fri, 19 Jan 2024 17:54:31 +0800
From: Huang Rui <ray.huang@amd.com>
To: Patrick Plenefisch <simonpatp@gmail.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: Re: ACPI VFCT table too short on PVH dom0 (was: Re: E820 memory
 allocation issue on Threadripper platforms)
Message-ID: <ZapG1weSIJWOkT8m@amd.com>
References: <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook>
 <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
 <ZajzcpArQYQhdj3T@macbook>
 <ZakcdfS3UwEb0oh2@macbook>
 <CAOCpoWdL3YnpitZxEoFgdvtZ6juy8oykYj6fX_tv4QLvj2Fv0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCpoWdL3YnpitZxEoFgdvtZ6juy8oykYj6fX_tv4QLvj2Fv0g@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|PH7PR12MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb03616-a8c7-41cb-7387-08dc18d4ad9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t4VZjNqZpmHan3hbvf7GKvqHcxfoT7cJ51DKwe2ovGD1K5dynRnO0WvYeX6xe2GIpkAwYlLgu8esPUJidHEJyweQvluyqREG0SSEVaLoQVfHTcYB1YCeueoiX+m0E0IES2zLGH/L3lTdCPgVO4IMqATla2Ft+lgXH4riPh4Od4oOTeAsjqRPJ92/KQ+SlIWzuLEwoJVA4gXwl4JbTF9ezG8yGwLUN9fsIqdifBoTP9+vVaQJnHEzuEih+j071u9I5uPjh19T2sUv6Lq45nhATPYQp60eYUbNYcM5vA6WxcTtM1qhO1urk9SwkhwGEd8UuzrM2K34GgZII0bQ3fdDHZ1/SH7WGH4C0/HAMqbEVqhyWzJ3bY9c/pKnjBwZ7qRVbrgu2yjDE/Tv2RjoqKxQZ9A6csHAYRoB/R+Xq0ZPmNYHEVEwZLAF3d9VsEWlygxdM/ZSEzh2jMf77JFvZwljLQgYIeZXBZkE5FdpjRxk4k7tNw0v7IVG0vtEZnE+Nz4HfmdjfcWDi7guOLRhnbguFcitJPCqVRELqEaDqQ4dR7zkBJvg+D4RsePVEiqYUFMxSM0xXrA58RWBDzieoKKcY4hzdUUjIH+T/xay9gqEFapGRnu4meU92C/UUd3EjDbKYyp4ikORBHXv2dsIC3C/ag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(1800799012)(186009)(64100799003)(451199024)(8936002)(66476007)(86362001)(66556008)(54906003)(66946007)(6916009)(36756003)(5660300002)(2906002)(316002)(966005)(6486002)(6506007)(4326008)(8676002)(53546011)(38100700002)(41300700001)(83380400001)(2616005)(26005)(6512007)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVNBZ1Q2T1dZc0lJQU1UdThJRUZmRDFQL1JmekNHRTdNdnZHdisxUU9wRzc1?=
 =?utf-8?B?eGpQMGw3SjNPT2NTbTFzV1dGOFBKYUtpdHhKTTM2bHJqUjlXOFNYL1JQTVpu?=
 =?utf-8?B?TnZDVmxsZStQVDFZV2tJanlnREtLRWU1N1hnYTJMTXlYZkVSdHJ3aVNHM0lY?=
 =?utf-8?B?UlpjYVhJRjlzVkF6bzJZekVDamt3SlRSTGs5OFBkcjlQUUExTitvN3JiWFlv?=
 =?utf-8?B?N0k5VVdmdmdUQzhIWjJlSDE5V1NtNkFYQy8rckxSMjc0Rmk3OFN2em11NG9P?=
 =?utf-8?B?NU8wOS9tWDIvUDJObDBoMThFNGZJQTVjU2ppSnByZG01RmhkTWVMaVo0ZWk1?=
 =?utf-8?B?ZjJqNWtQaFdnWFdKL3pMTG94cXFCZXQ3REN5eTJabGFidEVkQjROTEJVVmt5?=
 =?utf-8?B?UHVMMjVzV3RRNG4rNm5ZWlhhd0J4NDh6OVVvRzF3alpxeHhFd2pNZGFZUk5z?=
 =?utf-8?B?VU9oQ1h5bEh2S3p3SWtxbGlRemQzekhwQWwza0JyeG8yS3lpeDFqWmVzQUd6?=
 =?utf-8?B?SmZmSndpYUdJaFcvdUxPWm1rMEw0SHZrL2sydHpLUkVOTkZtRnVsbmQxc04v?=
 =?utf-8?B?SnlPaWtQdnNCN2NGV1UvS0tRV2xuY2R3QnhLakNGVjRRelZ4VnJlVk9jclZ6?=
 =?utf-8?B?S2syTzZ6eVNib2lycnpaZXR6eVEybGpSemdkRXlPZUdnRFJzbW9UNG1uN3Yy?=
 =?utf-8?B?UW10alZlYmNGTHY5VDVFS0NGZGtvV24rVXRJQjZtSlBLWlJHdGRQTGpXTCti?=
 =?utf-8?B?d010MHdqeGdkR0JralRuNzQwdHBkRjZxeUg1OHhUM0xXL0lrV0JWV2pPNzdj?=
 =?utf-8?B?RzFvZ0xUUEkxSlBEZzdOYVlhMGhYd21qSHB5aHNoa1lya0laM0hRVlVHSTRN?=
 =?utf-8?B?NTEzY0w2dzhaWVBFdUxJdHFMZng0N2g0QmlpU1JrcXA4YndZZGp3czlaTURK?=
 =?utf-8?B?allwYlJsRjBSRTJOQWVVZ1pyUFN2aXFKb2dOY3lJMkpTNG1rZXM4V0xPam9Z?=
 =?utf-8?B?TWhsZ1ovY1NTT1BuUEZZTExJMnNwUnBjbnNENXA3V2NSc21pcUhIdVl1ajZC?=
 =?utf-8?B?K2RUeG5tZXJyYTFPdE96UkgyMVBOcXp3dnZQaGtJM1ZnY1JkeDVRM2xaTytV?=
 =?utf-8?B?WVZmNlFSbkpDYktuWXhXZ3lvdFU0c3hRbzU2azhwMWtzdDdnZ2d6NWNvV0FN?=
 =?utf-8?B?Z1duTmxLTVlHeGg5TU5yekxheHZURnl6VEF0a0dTZitoRWlWTCtSVDBYQk1D?=
 =?utf-8?B?Q1duc2tZTThkOWtnZy9HNjdOOUpDRVlUeVVJUjlxWUJMd2ZwMVBHeDJ1UlNI?=
 =?utf-8?B?RTQ4S2w1OEN3amNlU3lKU1BnN1NqaUY3WXZGeG01Y3FjN0pOdFVxUjNzcFFH?=
 =?utf-8?B?VGhyTFhHSnlaOXpQVUZSYURrOUhicjV2SzUrdmo2cGpFNllDRUhzUmFyMWF3?=
 =?utf-8?B?ZnE3RVFPRGV5U2V2eklheFpmYlVoRXRvdlZZZzNZTXg1UjgxTklsQU5FaWxl?=
 =?utf-8?B?K08ycjRtWGV0QW5DdnRLU0pnalBibUg5eGFtTUlobXVORVl0dytIV1JxS1NM?=
 =?utf-8?B?YjRCbzNqclNKWjlFZHdMcWlvazd4cWczTUNMNERjNWVVWElYSHhKRmhaVWVH?=
 =?utf-8?B?eWM4ZFFtY1lJRHlHUzFSeUYvckZGM1RETm0yZVBEMUROS0ZiTkIxTVNSWURX?=
 =?utf-8?B?UTgrRlpQUWx4VWlPOGtwK1M1NSt2NFZSU0dOZ1Z2SW10WnZpenFLOXlVc1A5?=
 =?utf-8?B?elM0ZWtIZnJSbWRrQitvWTBKcVBmQnArMHFIa0VvdW1WY0Y5YmJOM3AxMUxQ?=
 =?utf-8?B?azRwMjFmTWZqYXkyNHFJSmFWbnBVYWxORjRIeGM5MXVmYUdrcExTMmFyV0pI?=
 =?utf-8?B?OVdJRk1UTlcrMWp0VnNpTVRScmFtSzViQ0tqOTg0QUljaXNKVStZTHVEcU53?=
 =?utf-8?B?TU5XQjVhdU1HczQwRmVqUmdHL3pEVWcwaVBmQkhWMTNISDZIb21OekxBaFdX?=
 =?utf-8?B?SzAwQzdGZitUYTI0bG50V21xYSsyTUtQaTF1blBISUxmZmQ4RndUNXNUUWo1?=
 =?utf-8?B?OElTNGNsTGo5YVZ3VUJkbzVPU25Ma0dwRWowOUQ2bkkwd1JFNytCRTd4TXdu?=
 =?utf-8?Q?gb4anaLb16eeSUUvkdsiDw76h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb03616-a8c7-41cb-7387-08dc18d4ad9d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 09:54:50.5999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4gQiJkelNW5203vzOEPjfles3IIfff1hJ3k7k1O9iyRig1S+w259y4X0COpedMWmp+4Mgqjh+EFdiha4LZPhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636

On Fri, Jan 19, 2024 at 03:44:35PM +0800, Patrick Plenefisch wrote:
>    On Thu, Jan 18, 2024 at 7:41 AM Roger Pau Monné
>    <[1]roger.pau@citrix.com> wrote:
> 
>      From that environment (PVH dom0) can you see if you can dump the
>      contents of the VFCT table?  I don't have a system with that table,
>      so
>      not sure if this will work (because iasl is unlikely to know how to
>      decode it):
>      # acpidump -n VFCT -o table.dump
>      # acpixtract -a table.dump
>      # iasl -d vfct.dat
>      # cat vfct.dsl
>      Would be good if you can compare the output from what you get on a
>      PV
>      dom0 or when running native Linux.
>      I'm also adding some AMD folks, as IIRC they did some fixes to Linux
>      in order to get some AMD graphics cards running on a PVH dom0, maybe
>      they can provide some additional input.
> 
>    Well, this is pretty weird. I'll go into more details because it may be
>    relevant. I had been working with ASRock support ever since I got my
>    brand new motherboard because I couldn't see the BIOS/UEFI screens. I
>    could boot up, and once native linux took control amdgpu got the
>    screens/gpu working fine. I finally managed to be able to see the
>    UEFI/BIOS setup screens by patching my VBIOS: I extracted the VBIOS
>    image of a cheap R5 430 OEM, ran GOPupd to update the VBIOS UEFI
>    component (GOP) from version 1.60 to 1.67. That allowed the UEFI to
>    actually initialize and use a screen. However, I later realized that
>    only 1 monitor was lighting up in the bios: my monitor plugged into the
>    Radeon RX 480 that was still on VBIOS GOP 1.60. It appears the GOP was
>    initializing the RX 480 too, despite not being flashed with the latest
>    itself. I am working on an email to asrock support about that. Once I
>    get into linux (native or PV), both monitors light up as expected.
>    Also, If I boot linux PVH from grub, they also work. Those usage
>    scenarios have acpidump output as identical. Booting linux PVH directly
>    from UEFI (no grub), the monitors go to sleep on the RX 480, and amdgpu
>    errors out about VFCT, but the R5 430 OEM does still have output.
>    Interestingly, there is a different screen mode booting UEFI+PVH, the
>    characters are basically squares, with more vertical lines than
>    "default", maybe close to native screen resolution, but horizontally
>    it's still "default". Booting from grub gives everything in the
>    "default" resolution.
>    So what is in the VFCT Table? VFCT contains the non-GOP VIOS image of

Thanks Roger to involve us. The VFCT table is to expose video BIOS image by
AMD GPUs. You can see details here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/amd/include/atombios.h

Did you apply this patch?

https://lore.kernel.org/xen-devel/20230312075455.450187-2-ray.huang@amd.com/

Thanks,
Ray

>    my Radeon RX 480 GPU. You can compare it to the VBIOS hosted at
>    [2]https://www.techpowerup.com/vgabios/185789/msi-rx480-4096-160720
>    (Compare the end at E667 in the VFCT table to E5ff in that vbios link).
>    I find this extra suspicious due to the above.
>    Now for the extra horrible things:
>    UEFI-booted PVH Linux doesn't support keyboard getty input, and at
>    least some of the USB devices are not in lsusb. It also decided to
>    vanish one of my HDD's. The `reboot` command hangs. The Power button
>    doesn't do anything. There are several stack traces in dmesg. But
>    Alt-SysRq-B does reboot! Luckily I could ssh in and capture the ACPI
>    tables. They are much smaller, and VFCT is empty.  Booting back to one
>    of the working scenarios (direct linux, Grub PV, Grub PVH, UEFI PV),
>    all of this is normal.
>    I've attached:
>    xenboot.log which is the serial log of xen+linux booting in UEFI PVH
>    (kernel is debian's config, but patched to start at 2MiB)
>    dmesg.txt which is the linux dmesg that contains some nice stack traces
>    (kernel is debian's config, but patched to start at 2MiB)
>    efipvh-tables.dump is ALL acpi tables from UEFI+PVH mode (acpidump -o
>    efipvh-tables.dump)
>    working-tables.dump is ALL acpi tables from the other modes (acpidump
>    -o working-tables.dump)
>    efipvh-vfct.dump is attached in spirit, as it is 0 bytes long (acpidump
>    -n VFCT -o efipvh-vfct.dump)
>    I ran iasl, but it just said **** Unknown ACPI table signature [VFCT]
>    and spat out the raw data table, nothing interesting
>    Something I can try, but have been nervous to try due to GOPupd
>    warnings is to also flash the 1.67 GOP to the VBIOS on the RX 480. The
>    R5 430 OEM had no such warnings.
>    Patrick
> 
> References
> 
>    1. mailto:roger.pau@citrix.com
>    2. https://www.techpowerup.com/vgabios/185789/msi-rx480-4096-160720


