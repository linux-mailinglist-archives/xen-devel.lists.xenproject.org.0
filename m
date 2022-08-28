Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42A5A41B5
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 06:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394377.633817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSW1m-0001MU-4O; Mon, 29 Aug 2022 04:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394377.633817; Mon, 29 Aug 2022 04:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSW1m-0001Jt-1d; Mon, 29 Aug 2022 04:05:34 +0000
Received: by outflank-mailman (input) for mailman id 394377;
 Sun, 28 Aug 2022 18:29:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wScQ=ZA=amd.com=Sudheesh.Mavila@srs-se1.protection.inumbo.net>)
 id 1oSN1r-0004Pv-Qs
 for xen-devel@lists.xenproject.org; Sun, 28 Aug 2022 18:29:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47b131ed-26ff-11ed-bd2e-47488cf2e6aa;
 Sun, 28 Aug 2022 20:29:01 +0200 (CEST)
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 PH0PR12MB7077.namprd12.prod.outlook.com (2603:10b6:510:21d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Sun, 28 Aug 2022 18:28:49 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::104b:956d:8d57:3aa1]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::104b:956d:8d57:3aa1%8]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 18:28:49 +0000
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
X-Inumbo-ID: 47b131ed-26ff-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwHLyiRM/fwMnEmyXRKF1VzI6LnMDFbRcHl/FCO52BzOPQrufwW2kE+iCQ2BI7e8jv9IeatG+nMvuQZ6lA8GT4KqCJDQdXu3Srmeq9lDHUFnhw5AnhAcXq5P0FbpfhobSI2mGsCHFZgXNHQsoYf0d0dXx4Vv9U2a0t1VJy6GNmznNpRF+K6Vtwc+/zLrb1Hr/elkaUtk5Jas5OlY5AUGpFF5DsoJkZB51iEK/eKBmCD9ir0hmqau/82HNTvVVt6UI4JlkTMBn3erVZd6EPqP2iknIplbplYu3F7O7dstXbpFvBL72NkxTPEq2HryhjRYUVO0shLUJc8vlv13hWNwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMHNB6TAySifvCc072cGrzDQMXbAXN9dF32K6IP2pYw=;
 b=YtUGXB9pu5CiRhwjuYfNvRbIagdas10vY0jtBWGPgEx3Eq6JKA2NQH6qT+sTm9bu6kolNzV4sI5rZCFjqMvWEizFR26yHsbS5CkchYA7pGYex2yAsPeUiVCkyWqdfiybJ7RXUAyh946AbKJEtVHclKVYPOGNcurZF5fUcXbEVGXUqK7SvPuDKvPOVuXRWSDi+rHa0oFGK0TmIxvGJZQ3QkSloT1hKQcezXYheB/XRU2NbMKz+SDFiZzLWw98660lNtFhagMDpdMAjIaWMSxydMUUsIFLD6qoRyNXZQUG2MMJyQ+NbwUY0RaXLB1LZmHe+6PJLJVlvoZffyE4CA9eQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMHNB6TAySifvCc072cGrzDQMXbAXN9dF32K6IP2pYw=;
 b=Ck1Kk3LLEI45l38/fOosXpsC+n6i/cZ6zKstApLiSuzfiyOGBMZT+S3NtPi4ZDHDCIxYJ750dSxj+u/Lz61usHms6s5WhwAhdUzHB3c9Rq0HCmUKLpIYdQO4uJ+1x+Nwt091COmQxaUVCM8j3Cvfq1Gsc+CF1qbtMUFtgAQvlYQ=
From: "Mavila, Sudheesh" <Sudheesh.Mavila@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: vhost-user-i2c on xen x86
Thread-Topic: vhost-user-i2c on xen x86
Thread-Index: Adi7C1KeC2b2cv7iS1WzEpMAU109yg==
Date: Sun, 28 Aug 2022 18:28:49 +0000
Message-ID:
 <DM4PR12MB5168B087425BA2B586CEE6ACFC779@DM4PR12MB5168.namprd12.prod.outlook.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-08-28T18:23:45Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=94d3cc84-354e-4331-a0d0-62720f1e9242;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-08-28T18:28:47Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid:
 05dd458b-0434-4f9c-baef-0ce7423b781e
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a2e5317-515a-4d8e-576e-08da89232710
x-ms-traffictypediagnostic: PH0PR12MB7077:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Nzqt8YUZnJtF9pgruKdO4lVJgcqmJoaP5hQPr624lpDyS3FDpJBUgQ7ZnzYHBCApD2L0Jb+Ao0IQcuXz77itH4XgG8LtDqC4uqx+J/8X5GmeVEwr3cwCHWnKMQroZzOwDN6XwRFVhGgc1utBiKOvWkQWwlk1289WlIGMDF06MRtD0BQ3BYPxqMjlWDp5yKL3eBWsLfV/z//IsVcxXk7zZgUwjhh4DsGHueX28oD3dmgte9CVWjX+LCio9JTX4/xrmYLWbl06ofVRAaf/RtSYyfKPsmEyVuZhIauaN1QLjZTgJFOccct9ev6LVGl+iYT6X57VRErlrQU0QPuO39DbSDTBr90kcRPKPW6xmbMotv5wUNg9XdX99OHN7Z10Io2D4pVrx/uTdKpefqLiJKKDtxHky1fViY7yIl9XJXMnHlRxdUmO01PvfOwH0lvr8uWpiA2BAp0W7Nmh+J9xs5bkHmL/UobDva0Gv1uDPVmJu/Eg4XtNWhZJUETt//sseWJyuGji6/zSAwc/+ehxBF2Riag0UsiHmshvWQ3qYpaXz2CY4TkItnpNOD8SmscX8pVl3o1ot3ut7b3QQ8dPSNqgQWjrbVvFpSrPzDCeo+PiCfzy9FqmkkqaozfgiBQ8G92islNGFuSAHovxpu9Wgg86h0Ilu7+0F2VkfkA77bEdHMESnR0NhT5idz/I4ZxZXvGeXGgoIhMGAK7UY9fuZ0Q5gwBEk/NiV1uv4xqn8H4oNZW4QimDuJl+MXPPgWLpTic9OWYWFfqycqGlfv2MZBvdjAz4IlmI/OER9vfBUmkzaeY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5168.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(33656002)(8936002)(52536014)(41300700001)(55016003)(5660300002)(2906002)(186003)(86362001)(7696005)(6506007)(21615005)(9686003)(26005)(83380400001)(316002)(38100700002)(71200400001)(6916009)(122000001)(166002)(38070700005)(66556008)(478600001)(66476007)(8676002)(66946007)(966005)(66446008)(64756008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OLntj91hpKGl9jieobxrO8mWpFDfzkm+iv9/MJh2j8pFF49He4Eh6v6R+yTU?=
 =?us-ascii?Q?4XsY6F2u+dzvHrM4Z3gbXt/nhoGuuX/RZi+5kttyw24TbE9aW8XNMgLpKF2a?=
 =?us-ascii?Q?wr7F8F+7Kas/PNF1aIJVr0XhXzX8XAF2eOl2ot6C9GWajOLI0nfb2m30aI60?=
 =?us-ascii?Q?2PAcn/1PDL4Q0mmBdOVslyf489YFfA3PhChFGliQff0OhYt8lH7cJwJcZ6fr?=
 =?us-ascii?Q?U0Anz4xfhqAc7WiETwa4SwXFu+0OwCYz8VqO1Lv5gzIu3S23Gf6vCCHTA9jm?=
 =?us-ascii?Q?/6cN7DnsYfay4RiVz0jeNQk39gO7CkZqLve8TEI/FWTX+4DxCMzsZRS5g1pe?=
 =?us-ascii?Q?8qBrapja1sHrsAg4emTzb/2MpfSI2paK83uRzYFQoG8iCsDw/DWsFyVWLsAx?=
 =?us-ascii?Q?ODkeT4W6aeXdmI7uP8HNYxHjMqfE7ZF3fp6pfmQNuv2R3bJ21nasAhk6bUmr?=
 =?us-ascii?Q?omL4ZHctgAEy1o1gVtCLS1lUv4nqwrgskFomqZ3A8XDOCjIWjkZNgcdwmZ15?=
 =?us-ascii?Q?c56QME0kevm/JbhiTsb6N1y+5eiQwUUQsa4HU0sLg2mkoNRWQJsPgr80Tde3?=
 =?us-ascii?Q?QZKAqgu4Qs9SNqpaVUJux4I7k9hc0PA2i5KnNmDdwK/ua/kdKxcWU9ZvhOgF?=
 =?us-ascii?Q?cskp6tTQSnrAMRaFGKn0xNC7GOinUiP97YrQyRqaNSsKpiPUUY6UDhLqvTp9?=
 =?us-ascii?Q?FG+q8vQPDKjGmTr/cpZRZYG/0A5xo10OwijQEH1H+8OAw4m+6jeuYE2ndF3b?=
 =?us-ascii?Q?Ci0gEpgHS9UH3wYQYNIP2ZhlJTuPLtO25+ZmJIqLM30yShkqiFmCeFM83MHp?=
 =?us-ascii?Q?Hn0hrBaGKSLOdo5V6OVLcZZdhePbocs84Tig9iLCDt+fobPn8EPIGlreTJUK?=
 =?us-ascii?Q?npqVb4aw/XIZuttplL/VBwQSylVINYqoizvU80rU0JN6RqNxRS2Wofqr7K2B?=
 =?us-ascii?Q?PaPjbGugE4UCHoLuJk4tf9hHekpN2gXvhGcDSRjR5Whw4iJLjkO9VYTiiwCv?=
 =?us-ascii?Q?fKFrn0iaF6nqmOwryj8E1iLfJJOxu5df9EmSwnRH0924Dp5p7L4QtCSo9Hvd?=
 =?us-ascii?Q?UYe+NtbbhoVJu5LRfyn35sDwI5Zg8nZqyRBfeoHlbXqtpjPBRAnPa+1GenYQ?=
 =?us-ascii?Q?7vzhQwOojql/2pJqfl1nRl719My36JoLq9WVnDeDaIH26gA3sK57DT4lMd3j?=
 =?us-ascii?Q?pbC7/UZ20LVeoCiKdrtleRa707d7fm0JBsYHZuE/1dG++L2aURGvYmD500Xc?=
 =?us-ascii?Q?T9PS61DN1oT1CoS4D9DrFhj2TfV4XSbKUkuNSZOU5x4rZ/XAQQazxSGwccc7?=
 =?us-ascii?Q?5fKWXNcSuFMYApwD7EDwyI9tbCx8gStBZRAnckiuf6Gd+nj4uAUbQYHGG/vO?=
 =?us-ascii?Q?NycUBrnkAbVLqwD2Jck4NgssDJoWZD9ERh4gPBOk7mh1PcVz4nmNWutgaUFG?=
 =?us-ascii?Q?ZXO9CgywPLZjY4ezWoBdy9gMDHqWgYZDRrik7JgvVlZTuOnVGh9D6q+o7mpS?=
 =?us-ascii?Q?nY7x6fELAlwzAFqyyROUcyqjdwjzQePU2pjuvCQGvxSLSy1mkB7EXetefa5T?=
 =?us-ascii?Q?Yr+9h7kYzXy70t63TWM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR12MB5168B087425BA2B586CEE6ACFC779DM4PR12MB5168namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2e5317-515a-4d8e-576e-08da89232710
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2022 18:28:49.8121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ssE6F7AW2LkEGB2Ql5MnKSWKkw8l5rYIJcGl9Ik/0L1twsfNQ+0qUbEyrkd5KO4h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7077

--_000_DM4PR12MB5168B087425BA2B586CEE6ACFC779DM4PR12MB5168namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Hi All,

I tried to run vhost-user-i2c on X86 machine according to the page https://=
lists.gnu.org/archive/html/qemu-devel/2021-03/msg08379.html
The aim is to access i2c device from VM.

How can I pass the below arguments to boot the VM using xl tool? Which is t=
he recommended way to access i2c bus from VM on x86?
  -chardev socket,path=3Dvi2c.sock,id=3Dvi2c \
  -device vhost-user-i2c-pci,chardev=3Dvi2c,id=3Di2c

I tried to pass this arguments as below, but failed to boot the VM
device_model_args_hvm =3D [ "-chardev", "socket","path=3Dvi2c.sock0","id=3D=
vi2c" ]
device_model_args_hvm =3D [ "-device", "vhost-user-i2c-pci","chardev=3Dvi2c=
","id=3Di2c" ]

compiled  qemu with  the i2c-backend patch
./vhost-user-i2c --socket-path=3Dvi2c.sock --device-list 0:57
vhost-user-i2c-Message: 19:23:00.434: awaiting connection to vi2c.sock
host                   : test
release                : 5.18.0
version                : #137 SMP PREEMPT_DYNAMIC Fri Aug 26 15:04:03 IST 2=
022
machine                : x86_64
nr_cpus                : 4
max_cpu_id             : 15
nr_nodes               : 1
cores_per_socket       : 2
threads_per_core       : 2
cpu_mhz                : 2595.174
hw_caps                : 178bf3ff:76d8320b:2e500800:244033ff:0000000f:209c0=
1a9:00000000:00000500
virt_caps              : pv hvm hvm_directio pv_directio hap shadow gnttab-=
v1 gnttab-v2
total_memory           : 14234
free_memory            : 269
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 16
xen_extra              : .0
xen_version            : 4.16.0
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-=
3.0-x86_64
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          : Tue Nov 30 11:42:42 2021 +0000 git:b0b4661fa3-dirt=
y
xen_commandline        : placeholder no-real-mode edd=3Doff
cc_compiler            : gcc (Ubuntu 10.3.0-15ubuntu1) 10.3.0
cc_compile_by          : root
cc_compile_domain      :
cc_compile_date        : Fri Aug 26 18:27:08 IST 2022
build_id               : d1e031cd177cfb054ac36a8872af15f6be926c56
xend_config_format     : 4

test@test:~$ /usr/local/lib/xen/bin/qemu-system-i386 --version
QEMU emulator version 6.1.0
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

Thanks in advance.

Regards,
Sudheesh

--_000_DM4PR12MB5168B087425BA2B586CEE6ACFC779DM4PR12MB5168namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p class=3D"msipheaderdf3d92d6" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Arial;color:#0000FF">[AMD Official Use O=
nly - General]</span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I tried to run vhost-user-i2c on X86 machine accordi=
ng to the page
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg08379.h=
tml">https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg08379.html</a=
><o:p></o:p></p>
<p class=3D"MsoNormal">The aim is to access i2c device from VM. <o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How can I pass the below arguments to boot the VM us=
ing xl tool? Which is the recommended way to access i2c bus from VM on x86?=
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; -chardev socket,path=3Dvi2c.sock,id=3Dvi2c \<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; -device vhost-user-i2c-pci,chardev=3Dvi2c,id=
=3Di2c<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">I tried to pass this arguments as below, but failed =
to boot the VM<o:p></o:p></p>
<p class=3D"MsoNormal">device_model_args_hvm =3D [ &quot;-chardev&quot;, &q=
uot;socket&quot;,&quot;path=3Dvi2c.sock0&quot;,&quot;id=3Dvi2c&quot; ]<o:p>=
</o:p></p>
<p class=3D"MsoNormal">device_model_args_hvm =3D [ &quot;-device&quot;, &qu=
ot;vhost-user-i2c-pci&quot;,&quot;chardev=3Dvi2c&quot;,&quot;id=3Di2c&quot;=
 ]<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">compiled&nbsp; qemu with&nbsp; the i2c-backend patch=
<o:p></o:p></p>
<p class=3D"MsoNormal">./vhost-user-i2c --socket-path=3Dvi2c.sock --device-=
list 0:57<o:p></o:p></p>
<p class=3D"MsoNormal">vhost-user-i2c-Message: 19:23:00.434: awaiting conne=
ction to vi2c.sock<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">host&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : test<o:p></o=
:p></p>
<p class=3D"MsoNormal">release&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 5.18.0<o:p></o:p></p>
<p class=3D"MsoNormal">version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : #137 SMP PREEMPT_DYNAMIC Fr=
i Aug 26 15:04:03 IST 2022<o:p></o:p></p>
<p class=3D"MsoNormal">machine&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : x86_64<o:p></o:p></p>
<p class=3D"MsoNormal">nr_cpus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 4<o:p></o:p></p>
<p class=3D"MsoNormal">max_cpu_id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 15<o:p></o:p></p>
<p class=3D"MsoNormal">nr_nodes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 1<o:p></o:p></p>
<p class=3D"MsoNormal">cores_per_socket&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 : 2<o:p></o:p></p>
<p class=3D"MsoNormal">threads_per_core&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 : 2<o:p></o:p></p>
<p class=3D"MsoNormal">cpu_mhz&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 2595.174<o:p></o:p></p>
<p class=3D"MsoNormal">hw_caps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 178bf3ff:76d8320b:2e500800:=
244033ff:0000000f:209c01a9:00000000:00000500<o:p></o:p></p>
<p class=3D"MsoNormal">virt_caps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : pv hvm hvm_directio pv_directio hap s=
hadow gnttab-v1 gnttab-v2<o:p></o:p></p>
<p class=3D"MsoNormal">total_memory&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; : 14234<o:p></o:p></p>
<p class=3D"MsoNormal">free_memory&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; : 269<o:p></o:p></p>
<p class=3D"MsoNormal">sharing_freed_memory&nbsp;&nbsp; : 0<o:p></o:p></p>
<p class=3D"MsoNormal">sharing_used_memory&nbsp;&nbsp;&nbsp; : 0<o:p></o:p>=
</p>
<p class=3D"MsoNormal">outstanding_claims&nbsp;&nbsp;&nbsp;&nbsp; : 0<o:p><=
/o:p></p>
<p class=3D"MsoNormal">free_cpus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 0<o:p></o:p></p>
<p class=3D"MsoNormal">xen_major&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 4<o:p></o:p></p>
<p class=3D"MsoNormal">xen_minor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 16<o:p></o:p></p>
<p class=3D"MsoNormal">xen_extra&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : .0<o:p></o:p></p>
<p class=3D"MsoNormal">xen_version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; : 4.16.0<o:p></o:p></p>
<p class=3D"MsoNormal">xen_caps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : xen-3.0-x86_64 hvm-3.0-x86_32 hv=
m-3.0-x86_32p hvm-3.0-x86_64<o:p></o:p></p>
<p class=3D"MsoNormal">xen_scheduler&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; : credit2<o:p></o:p></p>
<p class=3D"MsoNormal">xen_pagesize&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; : 4096<o:p></o:p></p>
<p class=3D"MsoNormal">platform_params&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; : virt_start=3D0xffff800000000000<o:p></o:p></p>
<p class=3D"MsoNormal">xen_changeset&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; : Tue Nov 30 11:42:42 2021 +0000 git:b0b4661fa3-dirty<o:p><=
/o:p></p>
<p class=3D"MsoNormal">xen_commandline&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; : placeholder no-real-mode edd=3Doff<o:p></o:p></p>
<p class=3D"MsoNormal">cc_compiler&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; : gcc (Ubuntu 10.3.0-15ubuntu1) 10.3.0<o:p></o:p>=
</p>
<p class=3D"MsoNormal">cc_compile_by&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; : root<o:p></o:p></p>
<p class=3D"MsoNormal">cc_compile_domain&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;:<o:=
p></o:p></p>
<p class=3D"MsoNormal">cc_compile_date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; : Fri Aug 26 18:27:08 IST 2022<o:p></o:p></p>
<p class=3D"MsoNormal">build_id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : d1e031cd177cfb054ac36a8872af15f6=
be926c56<o:p></o:p></p>
<p class=3D"MsoNormal">xend_config_format&nbsp;&nbsp;&nbsp;&nbsp; : 4<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">test@test:~$ /usr/local/lib/xen/bin/qemu-system-i386=
 --version<o:p></o:p></p>
<p class=3D"MsoNormal">QEMU emulator version 6.1.0<o:p></o:p></p>
<p class=3D"MsoNormal">Copyright (c) 2003-2021 Fabrice Bellard and the QEMU=
 Project developers<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in advance.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sudheesh<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM4PR12MB5168B087425BA2B586CEE6ACFC779DM4PR12MB5168namp_--

