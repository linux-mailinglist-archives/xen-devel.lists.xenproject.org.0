Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28772826705
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 02:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663115.1032954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMe27-0000Cd-Ic; Mon, 08 Jan 2024 01:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663115.1032954; Mon, 08 Jan 2024 01:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMe27-0000AW-El; Mon, 08 Jan 2024 01:02:27 +0000
Received: by outflank-mailman (input) for mailman id 663115;
 Mon, 08 Jan 2024 01:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wRqL=IS=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rMe25-0000AQ-A2
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 01:02:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 941cf4b3-adc1-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 02:02:22 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB8PR04MB6809.eurprd04.prod.outlook.com (2603:10a6:10:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 01:01:52 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::c499:8cef:9bb1:ced6%3]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 01:01:51 +0000
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
X-Inumbo-ID: 941cf4b3-adc1-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFWh3F16Bx7Cn1IDSZxeLvoCo3250GVxuE8RfaNFgj5ijp9fSZf21GvVJ+GEzlrasQGTLbNgrRiYBiuBUC/L4JNhvSPn4ufxUrm+6RtfGzRRTV9oHd8vCooa7kDEGHx6TPYKPkkVCMujDYK5jVKORFdvo3qspYQxQRt+HDCvMSRWWrQhMh8X9d20Ap8XR8TYvQphDzrFHwMATcs+fx2NGeFyJWQv8+nWUtJCv2n39KWWJ8FV1F1m5SyQw+8/FrRayaSpShajqqCDZqtpJhubBEFR6LhOOtgtwa8RYFDOYfPIMMxWP2dxsZBztcDJ0silgJZTQXpZWwyK1SJQtqSy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1ZLikcbaNxmXdoyeTDoUbUT9SAxTTZJDsm26mt/e+Y=;
 b=WfCM4THPKcmj2xtcuawpX9PHRmdQUcs1fbuCPdiRvrR+Ao0eXwm8/+NivN6FyDKWPGLzSfEUUts+SUYOkZt8PiOq4IFVm9nbw1diDxLtQwLt9QWsHWKw6/oB94psCWBlzhuSOyJEKQFHZeHAWBm56bg7gKYsPBWc40Xrs+IGPAwAYAjzjvU5de42ufTKY33OxsWLa5IE8L93hSl9Xh48SF0qjNRPaqA1VKRLgrpuc78JsLj9eASHY0HoaHwZR/GvbMsFioKuxZxs6ZGOmJdef2tyMbHBasXpQt49hyE5/w4Rz0vxlsq556y8CUFSCw46+nH6568vbsJlHG20Wj8JOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1ZLikcbaNxmXdoyeTDoUbUT9SAxTTZJDsm26mt/e+Y=;
 b=fX189zKEAa3qrxZYLnkBYHYSqflI2GY9H9Dd3yvyM26P+ZV+pnEvUCqYY1abs9wHp7d1gogrzF1UvAcGq4DqQZ5kshVbITukICX6LI9p7YFCrouXokhs3XmOnZG4eIKGj476McUVkO9KAvwCW4rxa64/aO5bHJgAwkysWOq3npA=
From: Peng Fan <peng.fan@nxp.com>
To: "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>, Julien Grall
	<julien@xen.org>, "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>, Viresh
 Kumar <viresh.kumar@linaro.org>, "stefanha@redhat.com" <stefanha@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peng Fan <peng.fan@nxp.com>
Subject: !qemu_in_coroutine() assert on ARM64 XEN
Thread-Topic: !qemu_in_coroutine() assert on ARM64 XEN
Thread-Index: AdpBzJr/mAIZVbpOTKm49WBDDTXwJg==
Date: Mon, 8 Jan 2024 01:01:51 +0000
Message-ID:
 <DU0PR04MB9417777F713CB9AE4475FFC7886B2@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DB8PR04MB6809:EE_
x-ms-office365-filtering-correlation-id: 4117de52-cdde-45fe-7927-08dc0fe56662
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8p6dMXh0wim0UFl2HmpE1g0lnHqyNDT8T+rJpMLBsNtCMGycs1DRtybl9Ht2L9nZd3bt5KplC6oRzcPgw3UjOfvDOEfq+J3u+0D1ZmTfvyO+rb69Pj5pmXC+kY7mWmoku8a5dOVH/vqx5HocHLs0RCIeiq8fhB+X22r2ciXarF2jsaaEkuFO55sENCs2BthEx67kcRe+TO9yjY0GcoDGM0oUxhXi9WebaMYZAqTM0hpS4vBqCtMqUgvIUyGgHEkSm5wKhODg9UuiH3jOtoTnYO2C0MovSrNwfNW6VXHXrnmhHM7U8kXZtnMCNL9ksRdNsnJ6E59PjbVBRZNcdLwlDuyaZY+JxtsO5KPfhDf5f4KBj89kw6Fd8YGsujOfzJko5YC6tm3IW3TVkigT2k3M7fxuKlL1C/mUlDQ5ne14hO/pOwYoQ3zGPqjKFJ2+EAq7RdLel55mNgNwvxvnX3Ly9wKkngP2UFe0es59Vlf/9tqH2LZQzsmM8HzEZuOrqQPedwYtEL72N9/a7IUnqeyfuI/LZZAajc5cOXeuB/2LgiMM+HXyJAZC8mK4Z/+v7KpBHQ1GjB/pEaFLpV93ywO+hJ8bU9sEfZyOPV5Cpki1x0zbdX6XV+dYk5pd/Q2mjErX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(110136005)(54906003)(122000001)(316002)(86362001)(966005)(52536014)(4326008)(71200400001)(64756008)(66556008)(76116006)(66446008)(66946007)(66476007)(478600001)(7696005)(38100700002)(26005)(6506007)(9686003)(55016003)(44832011)(8936002)(8676002)(33656002)(83380400001)(5660300002)(2906002)(30864003)(41300700001)(38070700009)(176633001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SMezuctWWG7E149HvfkntTb7NbsxS5EGXQuzIualmk0d1RwGok04xM++yzsf?=
 =?us-ascii?Q?q/tEcOY3yGok5K9J2JdIT9tzh0Ii4vqeP94IKffok3/wIEJ2MnIURYZ9rkQ/?=
 =?us-ascii?Q?RsYH6MW1qM6eb0JGVIrI141RFID/fmwKpz2aRntT0eoo2GhfdRSkKSEYg6jD?=
 =?us-ascii?Q?9EjdP6pIvEqpSbKjn4Ugl1XnyfD/xXtj5eKz+LLjfHVtEZvLhuQCQqiL70ct?=
 =?us-ascii?Q?796R6P/pwanMohdpN1TFJIUpcAF7Pi9/UtOGqbwNaoUI5u805hyvIqW+Hwd/?=
 =?us-ascii?Q?+sENKPZUqhwH0qDzgOaUdQ4rzq/IUv+AA61YFOO3w8iaQu9eokT2OzBnjRLd?=
 =?us-ascii?Q?cx/CP/dwM3dF3+NSHLLZKXBocQ71AmalXzQFcvLYSSolAXtRP8DdayFj9cRT?=
 =?us-ascii?Q?BUJj+37aVNba2yQiIo4PsxuEGYoxnW9O5KeUODUR6Clz3nG7BAAVJs/aNulV?=
 =?us-ascii?Q?dHQfmA5glt7TCs3ncITrK9Ws67HPgLRZH8wqFYHvso22tOB6dfzRpHRtBQUt?=
 =?us-ascii?Q?NmkDJ9Fe9blGvrMNwB5IuIVVVX+tDn/aMdq/+nryQwRgnpTdIaGXTiRK81j/?=
 =?us-ascii?Q?60Mk0fAR4X3x7seX61E2MqznAO5SM5IuYaAs3dYK3AezoX5IejwCTqDk77w7?=
 =?us-ascii?Q?4J7m1waJuCDmgbS7+yVxzaDsHenkSzm0seq3FUGFCRxtq8DaEj9Qf5xIsmPs?=
 =?us-ascii?Q?eb6esR2GK0q1eHwCRVJU1o+Cwj/FT9uhTFpyRNQkK00iSDU3qD6TvP3S7U80?=
 =?us-ascii?Q?raPZD3XAIImk9HE5SDf4KOZAGCUPKAmIEbmqv6GHRQ7g4u/PW0fDiJvHJ7aa?=
 =?us-ascii?Q?ROl7mCn0iSVByYnhO/wZ3GLt+2SgigJGvpj/xZ7jIzFgt2DjJkz980otfHsn?=
 =?us-ascii?Q?wRQrTCWF74CkVm10AEBQ5JsIeeomCVbOxgnORdFaP4+jRRL5PiDOABQuydJK?=
 =?us-ascii?Q?80wHyLAIYtlwr+kOtAtI5ZeEyCQ9uZ04iIW1UsBnCZauCA4LcX7xVsSayT9F?=
 =?us-ascii?Q?gCBCIaeXA/g0T4VW9t1jJWAa0gMFXm89WBt/iCbTIAr4tJP7XAsGyZFwRsNr?=
 =?us-ascii?Q?+X+5UVzwt6eJ/xzb/Tvz0ERqg+5kJ06SWxw9narBEXxUWW/y6vBgdf1bF7O6?=
 =?us-ascii?Q?RETKLk0U2/4gbnqrkTQGH6Ny7wUuv1i7YcwKYFVW3wnizTBJfomHFiBItOTU?=
 =?us-ascii?Q?v6i8yp5KY5LnRxIMOhh4tjP2vXTLfHsG0LAevR4Dh6npv0JoVHqrVngXvwVd?=
 =?us-ascii?Q?+YSpUpLNMWvNMloQDzfAqxGzH8m6ExZNoQ+Tx7NFI7fwu7j+BSuoYfG6bgz5?=
 =?us-ascii?Q?bz9cxvMvRvrwt3yTcipprSifK4gWGuIF5ORZdLHqPTWhJcq2yWC01ZCt0D/S?=
 =?us-ascii?Q?nYC8/ITyWc7A9IWWEAhDUejR78CoybwqVrwHcOWEwHI8OcCwknWGf2L1W0iT?=
 =?us-ascii?Q?iM5Gla1DBkrzWnotQ3emrnITUODVx+WS0AWdPs6cJvABR4FqCanAQw3A6n7s?=
 =?us-ascii?Q?wYcjbYk/gWE+bhAEwAKikzJNzyJo4lW1hIR0MEQFJdtLGSw1ueZv9XBpzx3w?=
 =?us-ascii?Q?rX/ZbPX3bxY0FmLT2GQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4117de52-cdde-45fe-7927-08dc0fe56662
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 01:01:51.9283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYl85FCRiFuAiSfUYwCOGmxoRZ3OiN1LWrf9hm9BTdl2u1mqmAuidnMDDy2/OVaMlwLYFdQB9nL/uRgh8dYl9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6809

Hi All,

When enabling virtio disk and virtio net on Xen, I could see qemu blk asser=
t
and being killed sometimes,  This is not 100% reproducible. I am using
qemu master branch

7425b6277f12e82952cede1f531bfc689bf77fb1 (HEAD -> dummy, origin/staging,=20
origin/master, origin/HEAD, master) Merge tag 'tracing-pull-request'=20
of https://gitlab.com/stefanha/qemu into staging

The qemu built option is the one in xen tool/Makefile, I just
change to qemu-system-aarch64.

Anyone has suggestions?

The coredump stack:

Symbols already loaded for /usr/lib/libc.so.6
(gdb) bt
#0  __pthread_kill_implementation (threadid=3D<optimized out>,
    signo=3Dsigno@entry=3D6, no_tid=3Dno_tid@entry=3D0) at pthread_kill.c:4=
4
#1  0x0000ffff9e100568 in __pthread_kill_internal (signo=3D6,
    threadid=3D<optimized out>) at pthread_kill.c:78
#2  0x0000ffff9e0bacd0 in __GI_raise (sig=3Dsig@entry=3D6)
    at /usr/src/debug/glibc/2.38+git-r0/sysdeps/posix/raise.c:26
#3  0x0000ffff9e0a6ef0 in __GI_abort () at abort.c:79
#4  0x0000ffff9e0b43f8 in __assert_fail_base (
    fmt=3D0xffff9e1ca8a8 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
    assertion=3Dassertion@entry=3D0xaaaae0d25740 "!qemu_in_coroutine()",
    file=3Dfile@entry=3D0xaaaae0d301a8 "../qemu-xen-dir-remote/block/graph-=
lock.c", line=3Dline@entry=3D260,
    function=3Dfunction@entry=3D0xaaaae0e522c0 <__PRETTY_FUNCTION__.3> "bdr=
v_graph_rdlock_main_loop") at assert.c:92
#5  0x0000ffff9e0b4470 in __assert_fail (
    assertion=3Dassertion@entry=3D0xaaaae0d25740 "!qemu_in_coroutine()",
    file=3Dfile@entry=3D0xaaaae0d301a8 "../qemu-xen-dir-remote/block/graph-=
lock.c", line=3Dline@entry=3D260,
    function=3Dfunction@entry=3D0xaaaae0e522c0 <__PRETTY_FUNCTION__.3> "bdr=
v_graph_rdlock_main_loop") at assert.c:101
#6  0x0000aaaae0a66a60 in bdrv_graph_rdlock_main_loop ()
    at ../qemu-xen-dir-remote/block/graph-lock.c:260
#7  0x0000aaaae0a6d9e0 in graph_lockable_auto_lock_mainloop (x=3D<optimized=
 out>)
--Type <RET> for more, q to quit, c to continue without paging--
    at /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-remote/i=
nclude/block/graph-lock.h:259
#8  bdrv_unregister_buf (bs=3Dbs@entry=3D0xaaaaf619d5a0,
    host=3Dhost@entry=3D0xffff742c8000, size=3Dsize@entry=3D2097152)
    at ../qemu-xen-dir-remote/block/io.c:3362
#9  0x0000aaaae0a5ddd4 in blk_unregister_buf (blk=3D<optimized out>,
    host=3D0xffff742c8000, size=3D2097152)
    at ../qemu-xen-dir-remote/block/block-backend.c:2859
#10 0x0000aaaae060aab4 in ram_block_removed (n=3D<optimized out>,
    host=3D<optimized out>, size=3D<optimized out>, max_size=3D<optimized o=
ut>)
    at ../qemu-xen-dir-remote/block/block-ram-registrar.c:33
#11 0x0000aaaae0399318 in ram_block_notify_remove (host=3D0xffff742c8000,
    size=3D2097152, max_size=3D2097152)
    at ../qemu-xen-dir-remote/hw/core/numa.c:883
#12 0x0000aaaae097cf84 in xen_invalidate_map_cache_entry_unlocked (
    buffer=3Dbuffer@entry=3D0xffff743c5000 "")
    at ../qemu-xen-dir-remote/hw/xen/xen-mapcache.c:475
#13 0x0000aaaae097dad0 in xen_invalidate_map_cache_entry (
    buffer=3Dbuffer@entry=3D0xffff743c5000 "")
    at ../qemu-xen-dir-remote/hw/xen/xen-mapcache.c:487
#14 0x0000aaaae0993e18 in address_space_unmap (
    as=3Das@entry=3D0xaaaae1ca3ae8 <address_space_memory>, buffer=3D0xffff7=
43c5000,
    len=3D<optimized out>, is_write=3Dis_write@entry=3Dtrue,
--Type <RET> for more, q to quit, c to continue without paging--
    access_len=3Daccess_len@entry=3D32768)
    at ../qemu-xen-dir-remote/system/physmem.c:3199
#15 0x0000aaaae095cc9c in dma_memory_unmap (access_len=3D32768,
    dir=3DDMA_DIRECTION_FROM_DEVICE, len=3D<optimized out>,
    buffer=3D<optimized out>, as=3D0xaaaae1ca3ae8 <address_space_memory>)

    at /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-remote/i=
nclude/sysemu/dma.h:236
#16 virtqueue_unmap_sg (vq=3Dvq@entry=3D0xffff965cc010,
    elem=3Delem@entry=3D0xaaaaf620aa30, len=3Dlen@entry=3D32769)

    at ../qemu-xen-dir-remote/hw/virtio/virtio.c:758
#17 0x0000aaaae095efa4 in virtqueue_fill (vq=3Dvq@entry=3D0xffff965cc010,
    elem=3Delem@entry=3D0xaaaaf620aa30, len=3Dlen@entry=3D32769, idx=3Didx@=
entry=3D0)
    at ../qemu-xen-dir-remote/hw/virtio/virtio.c:919
#18 0x0000aaaae095f0b8 in virtqueue_push (vq=3D0xffff965cc010,

    elem=3Delem@entry=3D0xaaaaf620aa30, len=3D32769)
    at ../qemu-xen-dir-remote/hw/virtio/virtio.c:994
#19 0x0000aaaae091a608 in virtio_blk_req_complete (
    req=3Dreq@entry=3D0xaaaaf620aa30, status=3Dstatus@entry=3D0 '\000')

    at ../qemu-xen-dir-remote/hw/block/virtio-blk.c:67
#20 0x0000aaaae091bdc8 in virtio_blk_rw_complete (opaque=3D<optimized out>,
    ret=3D0) at ../qemu-xen-dir-remote/hw/block/virtio-blk.c:136
#21 0x0000aaaae0a5a938 in blk_aio_complete (acb=3Dacb@entry=3D0xffff880015f=
0)

    at ../qemu-xen-dir-remote/block/block-backend.c:1559
--Type <RET> for more, q to quit, c to continue without paging--
#22 0x0000aaaae0a5b58c in blk_aio_read_entry (opaque=3D0xffff880015f0)
    at ../qemu-xen-dir-remote/block/block-backend.c:1614

#23 0x0000aaaae0b96c2c in coroutine_trampoline (i0=3D<optimized out>,
    i1=3D<optimized out>) at ../qemu-xen-dir-remote/util/coroutine-ucontext=
.c:177
#24 0x0000ffff9e0bfb40 in ?? ()
    at ../sysdeps/unix/sysv/linux/aarch64/setcontext.S:123

   from /usr/lib/libc.so.6

(gdb) thread apply all bt

Thread 10 (Thread 0xffff951348c0 (LWP 5460)):
#0  0x0000ffff9e15d8c4 in __GI___libc_read (nbytes=3D16, buf=3D0xffff7c000c=
f0, fd=3D38) at /usr/src/debug/glibc/2.38+git-r0/sysdeps/unix/sysv/linux/re=
ad.c:26
#1  __GI___libc_read (fd=3Dfd@entry=3D38, buf=3Dbuf@entry=3D0xffff7c000cf0,=
 nbytes=3Dnbytes@entry=3D16) at /usr/src/debug/glibc/2.38+git-r0/sysdeps/un=
ix/sysv/linux/read.c:24
#2  0x0000ffff9f3828d8 in read (__nbytes=3D16, __buf=3D0xffff7c000cf0, __fd=
=3D38) at /home/Freenix/tools/fsl-imx-internal-xwayland/sysroots/armv8a-pok=
y-linux/usr/include/bits/unistd.h:28
#3  read_all (fd=3D38, data=3Ddata@entry=3D0xffff7c000cf0, len=3Dlen@entry=
=3D16, nonblocking=3Dnonblocking@entry=3D0) at xs.c:422
#4  0x0000ffff9f382a08 in read_message (h=3Dh@entry=3D0xaaaaf6352030, nonbl=
ocking=3Dnonblocking@entry=3D0) at xs.c:1303
#5  0x0000ffff9f383390 in read_thread (arg=3D0xaaaaf6352030) at xs.c:1396
#6  0x0000ffff9e0fe978 in start_thread (arg=3D0x19) at pthread_create.c:444
#7  0x0000ffff9e16708c in thread_start () at ../sysdeps/unix/sysv/linux/aar=
ch64/clone3.S:76

Thread 9 (Thread 0xffff96f02920 (LWP 5457)):
#0  0x0000ffff9e0fb1e4 in __futex_abstimed_wait_common64 (private=3D0, canc=
el=3Dtrue, abstime=3D0xffff96f01f18, op=3D393, expected=3D0, futex_word=3D0=
xaaaaf5e5a3a0) at futex-internal.c:57
--Type <RET> for more, q to quit, c to continue without paging--
#1  __futex_abstimed_wait_common (cancel=3Dtrue, private=3D0, abstime=3D0xf=
fff96f01f18, clockid=3D-169499744, expected=3D0, futex_word=3D0xaaaaf5e5a3a=
0) at futex-internal.c:87
#2  __GI___futex_abstimed_wait_cancelable64 (futex_word=3Dfutex_word@entry=
=3D0xaaaaf5e5a3a0, expected=3Dexpected@entry=3D0, clockid=3Dclockid@entry=
=3D0, abstime=3Dabstime@entry=3D0xffff96f01f18, private=3Dprivate@entry=3D0=
) at futex-internal.c:139
#3  0x0000ffff9e0fe038 in __pthread_cond_wait_common (abstime=3D0xffff96f01=
f18, clockid=3D0, mutex=3D0xaaaaf5e5a300, cond=3D0xaaaaf5e5a378) at pthread=
_cond_wait.c:503
#4  ___pthread_cond_timedwait64 (cond=3Dcond@entry=3D0xaaaaf5e5a378, mutex=
=3Dmutex@entry=3D0xaaaaf5e5a300, abstime=3Dabstime@entry=3D0xffff96f01f18) =
at pthread_cond_wait.c:643
#5  0x0000aaaae0b80938 in qemu_cond_timedwait_ts (cond=3Dcond@entry=3D0xaaa=
af5e5a378, mutex=3Dmutex@entry=3D0xaaaaf5e5a300, ts=3Dts@entry=3D0xffff96f0=
1f18, file=3Dfile@entry=3D0xaaaae0d72a30 "../qemu-xen-dir-remote/util/threa=
d-pool.c", line=3Dline@entry=3D91) at ../qemu-xen-dir-remote/util/qemu-thre=
ad-posix.c:239
#6  0x0000aaaae0b8125c in qemu_cond_timedwait_impl (cond=3D0xaaaaf5e5a378, =
mutex=3D0xaaaaf5e5a300, ms=3D<optimized out>, file=3D0xaaaae0d72a30 "../qem=
u-xen-dir-remote/util/thread-pool.c", line=3D91) at ../qemu-xen-dir-remote/=
util/qemu-thread-posix.c:253
#7  0x0000aaaae0b97368 in worker_thread (opaque=3Dopaque@entry=3D0xaaaaf5e5=
a2f0) at ../qemu-xen-dir-remote/util/thread-pool.c:91
#8  0x0000aaaae0b80af4 in qemu_thread_start (args=3D0xaaaaf6344f60) at ../q=
emu-xen-dir-remote/util/qemu-thread-posix.c:541
--Type <RET> for more, q to quit, c to continue without paging--
#9  0x0000ffff9e0fe978 in start_thread (arg=3D0x0) at pthread_create.c:444
#10 0x0000ffff9e16708c in thread_start () at ../sysdeps/unix/sysv/linux/aar=
ch64/clone3.S:76

Thread 8 (Thread 0xffff972378c0 (LWP 5455)):
#0  0x0000ffff9e15d8c4 in __GI___libc_read (nbytes=3D16, buf=3D0xffff8c000e=
40, fd=3D31) at /usr/src/debug/glibc/2.38+git-r0/sysdeps/unix/sysv/linux/re=
ad.c:26
#1  __GI___libc_read (fd=3Dfd@entry=3D31, buf=3Dbuf@entry=3D0xffff8c000e40,=
 nbytes=3Dnbytes@entry=3D16) at /usr/src/debug/glibc/2.38+git-r0/sysdeps/un=
ix/sysv/linux/read.c:24
#2  0x0000ffff9f3828d8 in read (__nbytes=3D16, __buf=3D0xffff8c000e40, __fd=
=3D31) at /home/Freenix/tools/fsl-imx-internal-xwayland/sysroots/armv8a-pok=
y-linux/usr/include/bits/unistd.h:28
#3  read_all (fd=3D31, data=3Ddata@entry=3D0xffff8c000e40, len=3Dlen@entry=
=3D16, nonblocking=3Dnonblocking@entry=3D0) at xs.c:422
#4  0x0000ffff9f382a08 in read_message (h=3Dh@entry=3D0xaaaaf61d1970, nonbl=
ocking=3Dnonblocking@entry=3D0) at xs.c:1303
#5  0x0000ffff9f383390 in read_thread (arg=3D0xaaaaf61d1970) at xs.c:1396
#6  0x0000ffff9e0fe978 in start_thread (arg=3D0x0) at pthread_create.c:444
#7  0x0000ffff9e16708c in thread_start () at ../sysdeps/unix/sysv/linux/aar=
ch64/clone3.S:76

Thread 7 (Thread 0xffff972698c0 (LWP 5454)):
--Type <RET> for more, q to quit, c to continue without paging--
#0  0x0000ffff9e15d8c4 in __GI___libc_read (nbytes=3D16, buf=3D0xffff880015=
40, fd=3D28) at /usr/src/debug/glibc/2.38+git-r0/sysdeps/unix/sysv/linux/re=
ad.c:26
#1  __GI___libc_read (fd=3Dfd@entry=3D28, buf=3Dbuf@entry=3D0xffff88001540,=
 nbytes=3Dnbytes@entry=3D16) at /usr/src/debug/glibc/2.38+git-r0/sysdeps/un=
ix/sysv/linux/read.c:24
#2  0x0000ffff9f3828d8 in read (__nbytes=3D16, __buf=3D0xffff88001540, __fd=
=3D28) at /home/Freenix/tools/fsl-imx-internal-xwayland/sysroots/armv8a-pok=
y-linux/usr/include/bits/unistd.h:28
#3  read_all (fd=3D28, data=3Ddata@entry=3D0xffff88001540, len=3Dlen@entry=
=3D16, nonblocking=3Dnonblocking@entry=3D0) at xs.c:422
#4  0x0000ffff9f382a08 in read_message (h=3Dh@entry=3D0xaaaaf61d1240, nonbl=
ocking=3Dnonblocking@entry=3D0) at xs.c:1303
#5  0x0000ffff9f383390 in read_thread (arg=3D0xaaaaf61d1240) at xs.c:1396
#6  0x0000ffff9e0fe978 in start_thread (arg=3D0x0) at pthread_create.c:444
#7  0x0000ffff9e16708c in thread_start () at ../sysdeps/unix/sysv/linux/aar=
ch64/clone3.S:76

Thread 6 (Thread 0xffff97bfa920 (LWP 5453)):
#0  0x0000ffff9e15d2ec in __GI___poll (fds=3D0xffff90000d50, nfds=3D4, time=
out=3D<optimized out>) at /usr/src/debug/glibc/2.38+git-r0/sysdeps/unix/sys=
v/linux/poll.c:41
#1  0x0000ffff9e92d2e0 in ?? () from /usr/lib/libglib-2.0.so.0
#2  0x0000ffff9e92ddf4 in g_main_loop_run () from /usr/lib/libglib-2.0.so.0
--Type <RET> for more, q to quit, c to continue without paging--
#3  0x0000aaaae0a2c004 in iothread_run (opaque=3Dopaque@entry=3D0xaaaaf5ea8=
410) at ../qemu-xen-dir-remote/iothread.c:70
#4  0x0000aaaae0b80af4 in qemu_thread_start (args=3D0xaaaaf5e5f2f0) at ../q=
emu-xen-dir-remote/util/qemu-thread-posix.c:541
#5  0x0000ffff9e0fe978 in start_thread (arg=3D0x4d) at pthread_create.c:444
#6  0x0000ffff9e16708c in thread_start () at ../sysdeps/unix/sysv/linux/aar=
ch64/clone3.S:76

Thread 5 (Thread 0xffff75bdc920 (LWP 5562)):
#0  0x0000ffff9e0fb1e4 in __futex_abstimed_wait_common64 (private=3D0, canc=
el=3Dtrue, abstime=3D0xffff75bdbf18, op=3D393, expected=3D0, futex_word=3D0=
xffff7800c270) at futex-internal.c:57
#1  __futex_abstimed_wait_common (cancel=3Dtrue, private=3D0, abstime=3D0xf=
fff75bdbf18, clockid=3D2013315696, expected=3D0, futex_word=3D0xffff7800c27=
0) at futex-internal.c:87
#2  __GI___futex_abstimed_wait_cancelable64 (futex_word=3Dfutex_word@entry=
=3D0xffff7800c270, expected=3Dexpected@entry=3D0, clockid=3Dclockid@entry=
=3D0, abstime=3Dabstime@entry=3D0xffff75bdbf18, private=3Dprivate@entry=3D0=
) at futex-internal.c:139
#3  0x0000ffff9e0fe038 in __pthread_cond_wait_common (abstime=3D0xffff75bdb=
f18, clockid=3D0, mutex=3D0xffff7800c1d0, cond=3D0xffff7800c248) at pthread=
_cond_wait.c:503
#4  ___pthread_cond_timedwait64 (cond=3Dcond@entry=3D0xffff7800c248, mutex=
=3Dmutex@entry=3D0xffff7800c1d0, abstime=3Dabstime@entry=3D0xffff75bdbf18) =
at pthread_cond_wait.c:643
--Type <RET> for more, q to quit, c to continue without paging--
#5  0x0000aaaae0b80938 in qemu_cond_timedwait_ts (cond=3Dcond@entry=3D0xfff=
f7800c248, mutex=3Dmutex@entry=3D0xffff7800c1d0, ts=3Dts@entry=3D0xffff75bd=
bf18, file=3Dfile@entry=3D0xaaaae0d72a30 "../qemu-xen-dir-remote/util/threa=
d-pool.c", line=3Dline@entry=3D91) at ../qemu-xen-dir-remote/util/qemu-thre=
ad-posix.c:239
#6  0x0000aaaae0b8125c in qemu_cond_timedwait_impl (cond=3D0xffff7800c248, =
mutex=3D0xffff7800c1d0, ms=3D<optimized out>, file=3D0xaaaae0d72a30 "../qem=
u-xen-dir-remote/util/thread-pool.c", line=3D91) at ../qemu-xen-dir-remote/=
util/qemu-thread-posix.c:253
#7  0x0000aaaae0b97368 in worker_thread (opaque=3Dopaque@entry=3D0xffff7800=
c1c0) at ../qemu-xen-dir-remote/util/thread-pool.c:91
#8  0x0000aaaae0b80af4 in qemu_thread_start (args=3D0xffff7800c330) at ../q=
emu-xen-dir-remote/util/qemu-thread-posix.c:541
#9  0x0000ffff9e0fe978 in start_thread (arg=3D0x0) at pthread_create.c:444
#10 0x0000ffff9e16708c in thread_start () at ../sysdeps/unix/sysv/linux/aar=
ch64/clone3.S:76

Thread 4 (Thread 0xffff95944920 (LWP 5459)):
#0  0x0000ffff9e15d7e8 in __GI_ppoll (fds=3D0xffff78000bb0, nfds=3D2, timeo=
ut=3D<optimized out>, timeout@entry=3D0x0, sigmask=3Dsigmask@entry=3D0x0) a=
t /usr/src/debug/glibc/2.38+git-r0/sysdeps/unix/sysv/linux/ppoll.c:42
#1  0x0000aaaae0b981cc in ppoll (__ss=3D0x0, __timeout=3D0x0, __nfds=3D<opt=
imized out>, __fds=3D<optimized out>) at /home/Freenix/tools/fsl-imx-intern=
al-xwayland/sysroots/armv8a-poky-linux/usr/include/bits/poll2.h:88
--Type <RET> for more, q to quit, c to continue without paging--
#2  qemu_poll_ns (fds=3D<optimized out>, nfds=3D<optimized out>, timeout=3D=
timeout@entry=3D-1) at ../qemu-xen-dir-remote/util/qemu-timer.c:339
#3  0x0000aaaae0b7e134 in fdmon_poll_wait (ctx=3D0xaaaaf6351e20, ready_list=
=3D0xffff95943f28, timeout=3D-1) at ../qemu-xen-dir-remote/util/fdmon-poll.=
c:79
#4  0x0000aaaae0b7dc50 in aio_poll (ctx=3D0xaaaaf6351e20, blocking=3Dblocki=
ng@entry=3Dtrue) at ../qemu-xen-dir-remote/util/aio-posix.c:670
#5  0x0000aaaae0a2bfe4 in iothread_run (opaque=3Dopaque@entry=3D0xaaaaf5df5=
dc0) at ../qemu-xen-dir-remote/iothread.c:63
#6  0x0000aaaae0b80af4 in qemu_thread_start (args=3D0xaaaaf634a6b0) at ../q=
emu-xen-dir-remote/util/qemu-thread-posix.c:541
#7  0x0000ffff9e0fe978 in start_thread (arg=3D0x0) at pthread_create.c:444
#8  0x0000ffff9e16708c in thread_start () at ../sysdeps/unix/sysv/linux/aar=
ch64/clone3.S:76

Thread 3 (Thread 0xffff96584920 (LWP 5458)):
#0  0x0000ffff9e0fb1e4 in __futex_abstimed_wait_common64 (private=3D0, canc=
el=3Dtrue, abstime=3D0x0, op=3D393, expected=3D0, futex_word=3D0xaaaaf63497=
18) at futex-internal.c:57
#1  __futex_abstimed_wait_common (cancel=3Dtrue, private=3D0, abstime=3D0x0=
, clockid=3D0, expected=3D0, futex_word=3D0xaaaaf6349718) at futex-internal=
.c:87
#2  __GI___futex_abstimed_wait_cancelable64 (futex_word=3Dfutex_word@entry=
=3D0xaaaaf6349718, expected=3Dexpected@entry=3D0, clockid=3Dclockid@entry=
=3D0, abstime=3Dabstime@entry=3D0x0, private=3Dprivate@entry=3D0) at futex-=
internal.c:139
--Type <RET> for more, q to quit, c to continue without paging--
#3  0x0000ffff9e0fdd58 in __pthread_cond_wait_common (abstime=3D0x0, clocki=
d=3D0, mutex=3D0xaaaaf6349728, cond=3D0xaaaaf63496f0) at pthread_cond_wait.=
c:503
#4  ___pthread_cond_wait (cond=3Dcond@entry=3D0xaaaaf63496f0, mutex=3Dmutex=
@entry=3D0xaaaaf6349728) at pthread_cond_wait.c:618
#5  0x0000aaaae0b81188 in qemu_cond_wait_impl (cond=3D0xaaaaf63496f0, mutex=
=3D0xaaaaf6349728, file=3D0xaaaae0c13b08 "../qemu-xen-dir-remote/ui/vnc-job=
s.c", line=3D248) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:225
#6  0x0000aaaae032dda0 in vnc_worker_thread_loop (queue=3Dqueue@entry=3D0xa=
aaaf63496f0) at ../qemu-xen-dir-remote/ui/vnc-jobs.c:248
#7  0x0000aaaae032e14c in vnc_worker_thread (arg=3Darg@entry=3D0xaaaaf63496=
f0) at ../qemu-xen-dir-remote/ui/vnc-jobs.c:362
#8  0x0000aaaae0b80af4 in qemu_thread_start (args=3D0xaaaaf6349790) at ../q=
emu-xen-dir-remote/util/qemu-thread-posix.c:541
#9  0x0000ffff9e0fe978 in start_thread (arg=3D0x2) at pthread_create.c:444
#10 0x0000ffff9e16708c in thread_start () at ../sysdeps/unix/sysv/linux/aar=
ch64/clone3.S:76

Thread 2 (Thread 0xffff9c8fe920 (LWP 5452)):
#0  syscall () at ../sysdeps/unix/sysv/linux/aarch64/syscall.S:38
#1  0x0000aaaae0b80a20 in qemu_futex_wait (f=3Df@entry=3D0xaaaae1cb7e00 <rc=
u_call_ready_event>, val=3Dval@entry=3D4294967295) at /home/Freenix/work/sw=
-stash/xen/upstream/tools/qemu-xen-dir-remote/include/qemu/futex.h:29
#2  0x0000aaaae0b816b4 in qemu_event_wait (ev=3Dev@entry=3D0xaaaae1cb7e00 <=
rcu_call_--Type <RET> for more, q to quit, c to continue without paging--
ready_event>) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:464
#3  0x0000aaaae0b8aa94 in call_rcu_thread (opaque=3Dopaque@entry=3D0x0) at =
../qemu-xen-dir-remote/util/rcu.c:278
#4  0x0000aaaae0b80af4 in qemu_thread_start (args=3D0xaaaaf5da9a10) at ../q=
emu-xen-dir-remote/util/qemu-thread-posix.c:541
#5  0x0000ffff9e0fe978 in start_thread (arg=3D0x2) at pthread_create.c:444
#6  0x0000ffff9e16708c in thread_start () at ../sysdeps/unix/sysv/linux/aar=
ch64/clone3.S:76

Thread 1 (Thread 0xffff9f4f5020 (LWP 5449)):
#0  __pthread_kill_implementation (threadid=3D<optimized out>, signo=3Dsign=
o@entry=3D6, no_tid=3Dno_tid@entry=3D0) at pthread_kill.c:44
#1  0x0000ffff9e100568 in __pthread_kill_internal (signo=3D6, threadid=3D<o=
ptimized out>) at pthread_kill.c:78
#2  0x0000ffff9e0bacd0 in __GI_raise (sig=3Dsig@entry=3D6) at /usr/src/debu=
g/glibc/2.38+git-r0/sysdeps/posix/raise.c:26
#3  0x0000ffff9e0a6ef0 in __GI_abort () at abort.c:79
#4  0x0000ffff9e0b43f8 in __assert_fail_base (fmt=3D0xffff9e1ca8a8 "%s%s%s:=
%u: %s%sAssertion `%s' failed.\n%n", assertion=3Dassertion@entry=3D0xaaaae0=
d25740 "!qemu_in_coroutine()", file=3Dfile@entry=3D0xaaaae0d301a8 "../qemu-=
xen-dir-remote/block/graph-lock.c", line=3Dline@entry=3D260, function=3Dfun=
ction@entry=3D0xaaaae0e522c0 <__PRETTY_FUNCTION__.3> "bdrv_graph_rdlock_mai=
n_loop") at assert.c:92
#5  0x0000ffff9e0b4470 in __assert_fail (assertion=3Dassertion@entry=3D0xaa=
aae0d2574--Type <RET> for more, q to quit, c to continue without paging--
0 "!qemu_in_coroutine()", file=3Dfile@entry=3D0xaaaae0d301a8 "../qemu-xen-d=
ir-remote/block/graph-lock.c", line=3Dline@entry=3D260, function=3Dfunction=
@entry=3D0xaaaae0e522c0 <__PRETTY_FUNCTION__.3> "bdrv_graph_rdlock_main_loo=
p") at assert.c:101
#6  0x0000aaaae0a66a60 in bdrv_graph_rdlock_main_loop () at ../qemu-xen-dir=
-remote/block/graph-lock.c:260
#7  0x0000aaaae0a6d9e0 in graph_lockable_auto_lock_mainloop (x=3D<optimized=
 out>) at /home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-remot=
e/include/block/graph-lock.h:259
#8  bdrv_unregister_buf (bs=3Dbs@entry=3D0xaaaaf619d5a0, host=3Dhost@entry=
=3D0xffff742c8000, size=3Dsize@entry=3D2097152) at ../qemu-xen-dir-remote/b=
lock/io.c:3362
#9  0x0000aaaae0a5ddd4 in blk_unregister_buf (blk=3D<optimized out>, host=
=3D0xffff742c8000, size=3D2097152) at ../qemu-xen-dir-remote/block/block-ba=
ckend.c:2859
#10 0x0000aaaae060aab4 in ram_block_removed (n=3D<optimized out>, host=3D<o=
ptimized out>, size=3D<optimized out>, max_size=3D<optimized out>) at ../qe=
mu-xen-dir-remote/block/block-ram-registrar.c:33
#11 0x0000aaaae0399318 in ram_block_notify_remove (host=3D0xffff742c8000, s=
ize=3D2097152, max_size=3D2097152) at ../qemu-xen-dir-remote/hw/core/numa.c=
:883
#12 0x0000aaaae097cf84 in xen_invalidate_map_cache_entry_unlocked (buffer=
=3Dbuffer@entry=3D0xffff743c5000 "") at ../qemu-xen-dir-remote/hw/xen/xen-m=
apcache.c:475
#13 0x0000aaaae097dad0 in xen_invalidate_map_cache_entry (buffer=3Dbuffer@e=
ntry=3D0xffff743c5000 "") at ../qemu-xen-dir-remote/hw/xen/xen-mapcache.c:4=
87
#14 0x0000aaaae0993e18 in address_space_unmap (as=3Das@entry=3D0xaaaae1ca3a=
e8 <address_space_memory>, buffer=3D0xffff743c5000, len=3D<optimized out>, =
is_write=3Dis_write@--Type <RET> for more, q to quit, c to continue without=
 paging--
entry=3Dtrue, access_len=3Daccess_len@entry=3D32768) at ../qemu-xen-dir-rem=
ote/system/physmem.c:3199
#15 0x0000aaaae095cc9c in dma_memory_unmap (access_len=3D32768, dir=3DDMA_D=
IRECTION_FROM_DEVICE, len=3D<optimized out>, buffer=3D<optimized out>, as=
=3D0xaaaae1ca3ae8 <address_space_memory>) at /home/Freenix/work/sw-stash/xe=
n/upstream/tools/qemu-xen-dir-remote/include/sysemu/dma.h:236

#16 virtqueue_unmap_sg (vq=3Dvq@entry=3D0xffff965cc010, elem=3Delem@entry=
=3D0xaaaaf620aa30, len=3Dlen@entry=3D32769) at ../qemu-xen-dir-remote/hw/vi=
rtio/virtio.c:758

#17 0x0000aaaae095efa4 in virtqueue_fill (vq=3Dvq@entry=3D0xffff965cc010, e=
lem=3Delem@entry=3D0xaaaaf620aa30, len=3Dlen@entry=3D32769, idx=3Didx@entry=
=3D0) at ../qemu-xen-dir-remote/hw/virtio/virtio.c:919
#18 0x0000aaaae095f0b8 in virtqueue_push (vq=3D0xffff965cc010, elem=3Delem@=
entry=3D0xaaaaf620aa30, len=3D32769) at ../qemu-xen-dir-remote/hw/virtio/vi=
rtio.c:994

#19 0x0000aaaae091a608 in virtio_blk_req_complete (req=3Dreq@entry=3D0xaaaa=
f620aa30, status=3Dstatus@entry=3D0 '\000') at ../qemu-xen-dir-remote/hw/bl=
ock/virtio-blk.c:67

#20 0x0000aaaae091bdc8 in virtio_blk_rw_complete (opaque=3D<optimized out>,=
 ret=3D0) at ../qemu-xen-dir-remote/hw/block/virtio-blk.c:136
#21 0x0000aaaae0a5a938 in blk_aio_complete (acb=3Dacb@entry=3D0xffff880015f=
0) at ../qemu-xen-dir-remote/block/block-backend.c:1559

#22 0x0000aaaae0a5b58c in blk_aio_read_entry (opaque=3D0xffff880015f0) at .=
./qemu-xen-dir-remote/block/block-backend.c:1614
#23 0x0000aaaae0b96c2c in coroutine_trampoline (i0=3D<optimized out>, i1=3D=
<optimize--Type <RET> for more, q to quit, c to continue without paging--

d out>) at ../qemu-xen-dir-remote/util/coroutine-ucontext.c:177
#24 0x0000ffff9e0bfb40 in ?? () at ../sysdeps/unix/sysv/linux/aarch64/setco=
ntext.S:123 from /usr/lib/libc.so.6
Backtrace stopped: not enough registers or memory available to unwind furth=
er


Thanks,
Peng.

