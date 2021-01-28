Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA99308134
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 23:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77483.140349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5G03-0003Nj-Ap; Thu, 28 Jan 2021 22:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77483.140349; Thu, 28 Jan 2021 22:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5G03-0003NJ-63; Thu, 28 Jan 2021 22:42:51 +0000
Received: by outflank-mailman (input) for mailman id 77483;
 Thu, 28 Jan 2021 22:42:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oM/R=G7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1l5G00-0003NE-UM
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 22:42:49 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87472f5f-3479-47d8-96d7-a1d4d9fc4659;
 Thu, 28 Jan 2021 22:42:47 +0000 (UTC)
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
X-Inumbo-ID: 87472f5f-3479-47d8-96d7-a1d4d9fc4659
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611873767;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MbiuWYEdJOOkAupm7y9jZuvXlCn/WkebLm8uh69dRII=;
  b=NGKlGBPBFUZvD13dzQ3N8wuweRdiUJvlHf78rWZNJt5gZHNjdBimpjBf
   /pZ3l6c2m7od/7aBXeKZxUU+lxxZsTifplLUwSE7XSNdC8XNYlE92Yus8
   Aejj4r7HiHNiCJ7tYuKD7o1CMP07X9aKjGPZsGyNjITu+flIrMBWjTNgJ
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QCxzb88PYO6hAf/T1ojTfgrk3D2msUiAeyu2wO1prfzzg02UxoMCh1g3kkVfUzBgVfA0W3E1s4
 7JIfO6HlA932hx8QlBqQDAlkFehXr+z9AkkPNeSmmnTFbe0Cs/h2JuNT2SAV9xbtlq7VO26zqY
 dGKRsBvmORUGbieaVlU7oazaStdHcmAl7OSByKYEPwGt9WvQLz4LE9xlVX8Ob64D6xLyrM54Ab
 UeuJ5I7OPNHaaGLF6DgQcvA0i0bzPHfcAHR0eyeUzyrGZ58ZViBnHXxc1hgl0qAWRqrfebx8Sh
 WWM=
X-SBRS: 5.2
X-MesageID: 37433139
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="37433139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeD5huCDWSQLbS2bzqx3ZbnsVaGKdFd8oHJjLZV6vqTkbO6xulStHZGSSjlaXlwNE0ZVZxk6CIC73pTvEONln6nVz9dqeOoL53BMID12mAdC7FmcZutEHccNjZ5aZhzzHmPbQeIrrHPnruz4FX2vavsRnA+SqGm3VMkUwKKDebxHlUbglc2bg7DnXBzkaW+ZVDMWfkQejiMA/cstwSd610gkTBd/71kCegoqFITTAIgbkbpqU7UlNrViwZFGyycquEKiAgAafE7gSKnAOmciyMr5Xk9G06swgyfEBPJs+kQ/yU07/qpYtZYX5OzATY41caEtim5ULoVm6IvXpaS2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Im7e75RtKVYo17MpKBj3FecmXrQAG9wI2+1Nc9ygZ3Y=;
 b=aT4oP8bWC0Pzgub9auNEFxdOsCZmagvpdlKAihFUpoFhVVegF1Jn5XrFG2RYa7sxEXaCyG1+2DWjqIl9bM6wC1ta/Swt4dITa8/g12CkAuRa9/io36MQ5WsI5pseJDbjgoEZBwih4fAj4I6tKAL+PNjfGSMiJoTmZM0mNXrjD+vUnptRrNAFwCpRXOsU5RAw8chUQvK3QSgkiYRy7h/SYkas+2mnDwNasKn+dXxFnCRDVkOR5x657cAh9F99D7ZJNE6Td4JqqJ2ybBXzuOEIfuwPwd9j3ytqVFdCLqKgYuFJ7Co9dDH6V6NP/VEuDQ5TE9GTtaSzYHdJvWJx3UKdTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Im7e75RtKVYo17MpKBj3FecmXrQAG9wI2+1Nc9ygZ3Y=;
 b=EoTFYu04UJVPzzIflHOF1vcZK65n9AZcX8tSTfW03IiXlEh0PsZu0VQvw8ZQX6s7h6n3XQ8hn2pdYR9u3z5P91RCDPAi9NtmZfrUC8sWm9ryGDhMBA8+EBh66jy2Byfsg3MtRDbTGXsGHKRmbHArf98GfSFZNLM1o6lNhZfLwZI=
From: George Dunlap <George.Dunlap@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Thread-Topic: [PATCH] x86/pod: Do not fragment PoD memory allocations
Thread-Index: AQHW8qXhfghyfjZCb0iw2DUJHGLmxKo4G2OAgACDU4CAASMUgIAAcJSAgAELJICAAK7PgIAADiAAgAAXqgCAAMbHgIAAiAKAgABHgwA=
Date: Thu, 28 Jan 2021 22:42:27 +0000
Message-ID: <DC18947E-BC67-4BF8-A889-04B812DACACC@citrix.com>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
 <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
 <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
 <YBHo/gscAfcAZqst@mattapan.m5p.com>
 <44450edc-9a64-8a6e-e8d3-3a3f726a96bc@suse.com>
 <YBMB1VUhYd3RUuDO@mattapan.m5p.com>
In-Reply-To: <YBMB1VUhYd3RUuDO@mattapan.m5p.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f21e205-0b0b-43c7-7503-08d8c3ddfd85
x-ms-traffictypediagnostic: PH0PR03MB5718:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB57182BA2B076E30AF1E8230F99BA9@PH0PR03MB5718.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qi7Y4hmgW9DumSRns+aPtI7SZaMqphw0BOWaq/6upQd0mYs52BcCeaI4h5Zkux1wlsszBHoA7MSJ/XxGZuMzDaoyWCt/dwaxfMQsPsf43oHh1jvizJW818ZBJIqA+awzsDoziBo1A2daV30CAcyoZw2xPDM6bWXTtXV5attRnNlwtoPdWcRur5qGqoTkLYj5zrhCjOJ6pAvzghrFDqGyqdxCczcclqnIucZSkOCwFt1Zgf7+/ztK5q2x6ihrnLkuFQ2gvjWnDgVUeqt++x1UfKbg/2GS03P+KwZo9pbAwD4Sqfd3ao/DYzxbUM2Q5w4fkyIALRAt4z5whyJqoF6drAzz/DZ5i5dUFNVh67AQelJCavrGoa1ZqMaG2T2r1yMpn77aQyFaVB1vQ5Px7iTARxqA4GzvsZAJzPFw1NznSH8dxZlewwSTHCJFcY14MmnFH+UqpZbbFsUn2gDAWB7gPTW0eBjcyrY96zceJqV9lWzYvDCEksl8mSxnef6N9pPI2iDGtNpnOzm1NvvZeH5Oiu9Q0W3exdwsEer8lvadxT+M+HFiSXGfp/oa6AM1bOZEiRQGIeOjYnpqJJJnSCzBXw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(2906002)(53546011)(64756008)(26005)(6512007)(316002)(2616005)(4326008)(186003)(36756003)(8676002)(33656002)(5660300002)(54906003)(71200400001)(83380400001)(6506007)(8936002)(86362001)(76116006)(66476007)(66556008)(66446008)(107886003)(478600001)(91956017)(6486002)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BphdmnPmPyBBd/kGJ6lO5mLAtjR8Z5GeZOw8WFwFk9VdMcqqxxbow7OvnFQQ?=
 =?us-ascii?Q?4txkoiDJkaXsD9DCwALg/Xl+0yASSnhilAUDeVFSiqtXgFDhJkjkR9D0bMuI?=
 =?us-ascii?Q?RdclYjLlTsIjhEeBt+wuhTlBvBVMLosnEU9kLdL76pDygQvvqP93EzZbDt+K?=
 =?us-ascii?Q?gkeNcjoBIVNbK7DDyR6PGGawN7ZhDELstrz6m4+t490ykRWo5zgHlZSEw7J6?=
 =?us-ascii?Q?oSldonJOCof5CxRMfbvZlwOWgbwrQF94QwUKUjVIvyYTKiumCPppio8423L6?=
 =?us-ascii?Q?wrqUBJSqGdUL1wwtwcjRtc7WglGdeMzOn2q7TJbPxJJbh+juXxreLn3941hh?=
 =?us-ascii?Q?7JUj6Bu8bTNhCT7NC19heQPWRigj2ldv8z9Pc7UUG5bh55UTjNhWTSOihSzM?=
 =?us-ascii?Q?4KbLo8XhfGdENNhwdmRdjvYrC9710R4xxcg44Jmou7r+A+MFxL2lkawOM9Ah?=
 =?us-ascii?Q?kMDjXc35c3loUVG88CPFSxgwF+/VpbTufSx2jmnKijvpErdFHnNfZ1uwbU4q?=
 =?us-ascii?Q?09fuca4NJ13HnBkvyHd36kBp6GBsMiaql5/AiFIye+56tXXAT9pCsoyPi729?=
 =?us-ascii?Q?WCPXzBPHVOsFpDnwCkNviQFlA6rPnXWQb8qSqNKJAQRTrTpqLZTjDz4Q2BIu?=
 =?us-ascii?Q?LXZNmxJCr+jjwCew8UkmTn9bbjQhXs7fdXnHCMzt5zftUgx9GT/qb5jI6ssd?=
 =?us-ascii?Q?HacDbhr49rr64628vAORud6wh14nfDuH2ckSVwhVSZQkpJ+LY0vYeVb8D4oZ?=
 =?us-ascii?Q?nzLrFDAQZgYEbHpdTmwNm+r4VuIPbiSkErRw9+inl8XYYS+auhKjAFV9V9hG?=
 =?us-ascii?Q?9vwVeaafKTql8XuxOqINClP4jF0Rc3t4zPDk2tI/TE6VvuH65MyTiBrEsTsy?=
 =?us-ascii?Q?+ZKEoRlDduSuQAi9IC/Sp01M4TRsYfjcOFonOfuIqU5NOJHBKMRbHBV8bfUS?=
 =?us-ascii?Q?OseoEmzKxhryZKz5g6UDdKRLedo7sr8Sq1Sd4wirSYVdrRXAiGekZu6mSAIY?=
 =?us-ascii?Q?XIe5C8CyOgAPTDwDIUjsWrqmeONJu6cYE8wX9vFFVjtAt+YtAtY/g8WE2UIX?=
 =?us-ascii?Q?TuwqhB1O/nbwn4IQS55cIfbkl3Woqw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FDE1E7EE54358C4989F6A2783DA5CE04@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f21e205-0b0b-43c7-7503-08d8c3ddfd85
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 22:42:27.9534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MzxTxu14pxfy9YKKxwkcKO/kagCT5tdV4xyOt1WIfyXqdcuy/lA5ovBhMXUKBdCzE0bMFIOzo+30tFD9Y8fbSPZl1e5h2TROFhXBnJIbE/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5718
X-OriginatorOrg: citrix.com



> On Jan 28, 2021, at 6:26 PM, Elliott Mitchell <ehem+xen@m5p.com> wrote:
>=20
> On Thu, Jan 28, 2021 at 11:19:41AM +0100, Jan Beulich wrote:
>> On 27.01.2021 23:28, Elliott Mitchell wrote:
>>> On Wed, Jan 27, 2021 at 09:03:32PM +0000, Andrew Cooper wrote:
>>>> So.?? What *should* happen is that if QEMU/OVMF dirties more memory th=
an
>>>> exists in the PoD cache, the domain gets terminated.
>>>>=20
>>>> Irrespective, Xen/dom0 dying isn't an expected consequence of any norm=
al
>>>> action like this.
>>>>=20
>>>> Do you have a serial log of the crash??? If not, can you set up a cras=
h
>>>> kernel environment to capture the logs, or alternatively reproduce the
>>>> issue on a different box which does have serial?
>>>=20
>>> No, I don't.  I'm setup to debug ARM failures, not x86 ones.
>>=20
>> Then alternatively can you at least give conditions that need to
>> be met to observe the problem, for someone to repro and then
>> debug? (The less complex the better, of course.)
>=20
> Multiple prior messages have included statements of what I believed to be
> the minimal case to reproduce.  Presently I believe the minimal
> constraints are, maxmem >=3D host memory, memory < free Xen memory, type
> HVM.  A minimal kr45hme.cfg file:
>=20
> type =3D "hvm"
> memory =3D 1024
> maxmem =3D 1073741824
>=20
> I suspect maxmem > free Xen memory may be sufficient.  The instances I
> can be certain of have been maxmem =3D total host memory *7.

Can you include your Xen version and dom0 command-line?

For me, domain creation fails with an error like this:

root@immortal:/images# xl create c6-01.cfg maxmem=3D1073741824
Parsing config from c6-01.cfg
xc: error: panic: xc_dom_boot.c:120: xc_dom_boot_mem_init: can't allocate l=
ow memory for domain: Out of memory
libxl: error: libxl_dom.c:593:libxl__build_dom: xc_dom_boot_mem_init failed=
: Cannot allocate memory
libxl: error: libxl_create.c:1576:domcreate_rebuild_done: Domain 9:cannot (=
re-)build domain: -3
libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 9:Non-exista=
nt domain
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 9:Unable =
to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 9:Destruction o=
f domain failed

This is on staging-4.14 from a month or two ago (i.e., what I happened to h=
ave on a random test  box), and `dom0_mem=3D1024M,max:1024M` in my command-=
line.  That rune will give dom0 only 1GiB of RAM, but also prevent it from =
auto-ballooning down to free up memory for the guest.

 -George=

