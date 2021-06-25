Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44B3B4624
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 16:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147284.271367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwnBc-0001nz-HT; Fri, 25 Jun 2021 14:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147284.271367; Fri, 25 Jun 2021 14:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwnBc-0001lb-EB; Fri, 25 Jun 2021 14:52:04 +0000
Received: by outflank-mailman (input) for mailman id 147284;
 Fri, 25 Jun 2021 14:52:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=76aW=LT=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1lwnBb-0001lV-7e
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 14:52:03 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e473c7a2-11c7-4238-bc98-be7cb8155478;
 Fri, 25 Jun 2021 14:52:00 +0000 (UTC)
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
X-Inumbo-ID: e473c7a2-11c7-4238-bc98-be7cb8155478
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624632720;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=Ko0+7VnaVleRu+JXalSXPMrJKNgoxY9ne9wxTtzK8yA=;
  b=JC3IJFO+vQvptz0xAWObUYP3Ht1tumzZPJRKYNl87Sepy+FlsT0y3SHH
   7FrsHsIm0V7V4AZ80bUci9U+NIA+59igXHJYll4NPTDgs50OW1zJMPMDL
   VoNPOyMJgfbCPQ7gxWEcI/vkPzutfstcKmphk20Wc7cDDtulOddBe+WI8
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FjnDES62Io+LH5/qcoX61Ji7Na8Pd8JB6M90rDyFLzHBnGqMmPy1YhfnJK1HQk+KGAGczAud2t
 MIBiHWM0kbM3EGhBX1Gmydx4eRyaDtllqpczj5wWgNJQYnReqkYHsy+Tg48AARUvLnPdNZKmT3
 YpDQG8k2sYSSQmDoloITxs698XCuXX4YvX987NoLpIpEs/Wv06iTlMvG0CGDjEJ/9tJXlZtR4A
 PCTCYRNzQnHV6aroH46EI6UwtzGRBxypmnHuHG1WiFug8S6Dq5m3qPoI8K8zt+5Qjti6Vyos9v
 +k0=
X-SBRS: 5.1
X-MesageID: 48591494
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IyjVi6jf049qx+4v+bvQoPkkZ3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208,217";a="48591494"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TY9siNXczNZIcXqEwei9C+fba1cM6yQVqVtU6JQTH3P4lhN7VHMQJwQIdU4DT0diuw8xoDNi53ctuIUQDGx+s8Q1tAVZZnPj8Fz24CPSEJbfalmhv8QXsNM0YjQwNizzSHTHHFjKR3YNzYSUAzEeqrocTLIgEkOP2FLxZgsBr/juT2coLWqJl2zY67JsgY3tF0CgbeqBdZ/TW9G9FsGui9KnGJ5puEcW7H1A0eBIpZx4ko9vv6et7L1w8ZEk4oslDhecHq5lyrESwMbxYfB+Gtu5H/ViE0DGSRoppRBCGPg19nNIUkPfDyUOhiRkjJCw7vGetnbDV+EJyH61XM/SeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4B+9aJCGZpw9Tz4VE8Y7JBuzhEdpG6r3fQWa8Gczhw=;
 b=UbBqW6Ovi+TUfadmj8SLv4CjtEOywnkFohEPkEQlvRhTdkSPoMmyJJmfhdBIRNVVOevJRC4UWCa/OJ7VsoNrDel+A73YhFrdjqY8+uA/kAyc7dTzIOCGUAkoJJtVyuzSRlM4kRMhWTOHv3dJQjUAkGRjYoswJnh7nWfDwos63nC5JJ6aGJDl7vMUe2fCIf05pV/JiP7WcS0WBpbeqKMcuYfXq1pa9Ra+QdDlYBCaU1seIuKtlH6YkbrYYqNc2aihNJ9PuIjXS3KLmSxub4n2c4JenvWCa/HeqnxI6TiSqQ89uXjK41/WChjqPFr/B60sj6RU+WJt1wA/EOhtMpaG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4B+9aJCGZpw9Tz4VE8Y7JBuzhEdpG6r3fQWa8Gczhw=;
 b=KTA1dDnQf4D3gamOi84nqFj1toAbVf5ZWaA5jzFd6YzagUFurg8WD9KdqYmJiN6oj8jY7Cg8t7Z0h+RpH+pss+LgahYTk4D1qMfmD3FP74Jg5jQNll4XqyPGhzvsR7INJyAvMja8FB5OhMgejWDdiF8G36FgBvWQCGyXLvR+ghM=
From: Christian Lindig <christian.lindig@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<George.Dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Marek
 Marczykowski" <marmarek@invisiblethingslab.com>, David Scott
	<dave@recoil.org>
Subject: Re: [PATCH 01/12] libxc: split xc_logdirty_control() from
 xc_shadow_control()
Thread-Topic: [PATCH 01/12] libxc: split xc_logdirty_control() from
 xc_shadow_control()
Thread-Index: AQHXacSXhkB1fy1iEUKbQj9aZj8qr6skz76A
Date: Fri, 25 Jun 2021 14:51:56 +0000
Message-ID: <71F58ADC-945E-4ED3-9CB9-17889DE22641@citrix.com>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <e928490c-d13c-8041-0ff7-e8b69ee73d6e@suse.com>
In-Reply-To: <e928490c-d13c-8041-0ff7-e8b69ee73d6e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 069cb178-f882-46cd-2c44-08d937e8c77c
x-ms-traffictypediagnostic: CO1PR03MB5730:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR03MB5730333F8638B85B8772ACE0F6069@CO1PR03MB5730.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PrifGTVTJ+hgmnMH2MYGtPKnm6D1wONJNDLUpTXI6vM1lP+TINzXDOf2dpOhb7foNrFkKZc/yAjXKGQGMSm3cgKjCvEEQtw9oTdGyK8mIdplhowYpD2XkyF6mGzTGgHiy3TrzI1tfj840RZDPGey58lllmAC3mZrhO8gRF+WUrrzf1+7VFY9VNEwt/hXDv6zaA1amQap/OIwjjX4Nic1TKrBjBHXd9jaufJDuvtIU6gJMoaszwelNQ+FYZwO+/b3/k3xVpx2su2Grl4CrxFz2wucikvV07gzWVG7VYtjrDaE+t5/Q8PRxF0wpXqXYiGKnJ0oWcnpAPS74H9P0v41CBHZRCYVvoSTytDoHE16SWbBB9jCoocKTzJyFn+xMkSpvOsyZ1v8TZYWSiS6oOWOTn89TNFoUTMtdMdCHVh1ykc4DKsPDx5VlecozI99o5iaM/apHRany0hwn8WDmBPCkThabvMvkUzbalQBUyzDO5IACx1d06L9/LmPOqATPbmFDMBFNhJzBXTlSktqDUYszP34byxHS88ACUpNhp4vNqQuJbiQ3lTBCqU6fiW/VDuVCo/Ich30G67aTf83LWiVvMs04UIwflVjg+3p9TImZ7ecbzsQPRh86J5DOUozEfNtg19+tqzeLj/ywdfk0xXrDGqqASI2YTLiyMNDZD854CgfzgDBAFvaUMqqfvWa+6Ng3g9zEj1u4RUCycg2J6fltg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(316002)(66476007)(66556008)(6512007)(91956017)(66946007)(6486002)(76116006)(26005)(64756008)(66446008)(4326008)(8676002)(8936002)(54906003)(6916009)(122000001)(186003)(71200400001)(83380400001)(6506007)(478600001)(5660300002)(2616005)(38100700002)(53546011)(2906002)(44832011)(33656002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j0MGPIQC/B7wQg56Q7hC4sD3MjMepvmDwZUM+gGu/FgHz3tgvtmeHVRGrO2O?=
 =?us-ascii?Q?gHscXEznXmhOY32TnNmGVteIXbsXJp86QL+EZZCUpM3khPuZRfaylsEKLDIu?=
 =?us-ascii?Q?zEdmPVkpkJIhHl1+InUKuwATxELrRKDCsaYWjAV5u5mGAKGfw2bNDSNUx1g3?=
 =?us-ascii?Q?DRJldyOtnH9LN64rD4aXqlmrfZUBqRZ6x4e+hhH940toPag9VzajGtWbdVH4?=
 =?us-ascii?Q?BRy6NvpDbm80PmP+mh4C+hpKYohnz/IcqsVG4DDDGlP2oajRmmqloKeUxFZg?=
 =?us-ascii?Q?GKWbMK35o6ehKvqmr0SaxuDIXt8voPIH6mimipT2tlLc+WIOattRoCawhGi9?=
 =?us-ascii?Q?3TBSFLQkkFjW+3mED0AWB6wkCD51RbXmI30AtpNIJHz336483+A0U2oZkCMi?=
 =?us-ascii?Q?6E5gBed/u6utBBi5vAu91jWCoXO+wYMj8ZTRe6Vn29/OiE2aMEUCh5iSw1zg?=
 =?us-ascii?Q?ULFnpGWuyX6U4HyGHYQOnpSu7pUvZbzP88Vq66MqHX/5HZFSnsej+tplQFLd?=
 =?us-ascii?Q?AmYLjSMnAd3D/v6jqxCQxXObvqKRaCDzteUrgI9GFCYq4i4BpnCGz4pKsYhB?=
 =?us-ascii?Q?iN2LaJsO+x63aEdEgEc01YeBYhAZHAF9iTpDOwcOnZWYathPQX7W1dDSm/25?=
 =?us-ascii?Q?SXPHFJDZja6u2U4sP0zv0ju8r6JArr4Z32yek8/oE19+G/jFBKIn8mJhY8AT?=
 =?us-ascii?Q?wd8sN/ECs94SwiBGdBcs+KzzkPodO14/bXcjfeLLPvqUwyaxJsEbA4YME3tQ?=
 =?us-ascii?Q?J9uG5yZTYzdLZyqB58DRmSnd7VMhpPxi0vRTbVRm4v+3Jw7IfuYV2UkexDqR?=
 =?us-ascii?Q?PM4Iza0v7oDOki27zeK2B3r53cqXn90+YMLT0Qzxi97HHQcfKEm/JWllUFa8?=
 =?us-ascii?Q?fLTZyGgnE/nGksq+zXboeeNB+ArTEnQWh9t3ey3a7Mbtu2S+yk2WsEk92FQu?=
 =?us-ascii?Q?vCegYY1K4P3oEzQ3urBfgJEGs1H9T+e0AsaqZK8IffpKl7baLXsOrq8NmCWC?=
 =?us-ascii?Q?FggsdXwvH6At4dnm6nqiTyUR57JJyp673HdvaH8Xnf2lBH1Jj7LFCysGfysj?=
 =?us-ascii?Q?7pjEYK1tIeutMvYd/F7S/GesytT4VneP1cuiaIVGsAiKqBFeLkZFwzF74Edu?=
 =?us-ascii?Q?0uVmyulLIxO4l5VVctvIPjeeuoykkrpcHN89mKu90Z2Kg+lmBMko0Xc0b5ha?=
 =?us-ascii?Q?wr3L/tMpioSl05ljPl0yv+sp+bOfl/y+fNoUXFwYj4Bw+m8fMhsWjM5Kd01z?=
 =?us-ascii?Q?eUDwTFZzmXwonhVXL84xyBszI67wS7oaRC9aaZbYPCvYEUyQ8jMyHT2U20of?=
 =?us-ascii?Q?cCefgRIwQQadRT35mpnZDG20?=
Content-Type: multipart/alternative;
	boundary="_000_71F58ADC945E4ED39CB917889DE22641citrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069cb178-f882-46cd-2c44-08d937e8c77c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 14:51:56.6926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9gm3V7qVuR/kz/WWd2/rX/J8bwahd3v0+A8DtS0U9UXaf+Se1qUMqgbSj8bx+qFVxFRzAddXzJphsgT8CX1EX9NqMPKS1WLK+EYmzCMN8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5730
X-OriginatorOrg: citrix.com

--_000_71F58ADC945E4ED39CB917889DE22641citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

For the OCaml part:

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>

On 25 Jun 2021, at 14:17, Jan Beulich <jbeulich@suse.com<mailto:jbeulich@su=
se.com>> wrote:

For log-dirty operations a 64-bit field is being truncated to become an
"int" return value. Seeing the large number of arguments the present
function takes, reduce its set of parameters to that needed for all
operations not involving the log-dirty bitmap, while introducing a new
wrapper for the log-dirty bitmap operations. This new function in turn
doesn't need an "mb" parameter, but has a 64-bit return type. (Using the
return value in favor of a pointer-type parameter is left as is, to
disturb callers as little as possible.)

While altering xc_shadow_control() anyway, also adjust the types of the
last two of the remaining parameters.

Signed-off-by: Jan Beulich <jbeulich@suse.com<mailto:jbeulich@suse.com>>
---
I wonder whether we shouldn't take the opportunity and also rename
xc_shadow_control() to, say, xc_paging_control(), matching the layer
above the HAP/shadow distinction in the hypervisor.

--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -885,11 +885,15 @@ typedef struct xen_domctl_shadow_op_stat
int xc_shadow_control(xc_interface *xch,
                      uint32_t domid,
                      unsigned int sop,
-                      xc_hypercall_buffer_t *dirty_bitmap,
-                      unsigned long pages,
-                      unsigned long *mb,
-                      uint32_t mode,
-                      xc_shadow_op_stats_t *stats);
+                      unsigned int *mb,
+                      unsigned int mode);
+long long xc_logdirty_control(xc_interface *xch,
+                              uint32_t domid,
+                              unsigned int sop,
+                              xc_hypercall_buffer_t *dirty_bitmap,
+                              unsigned long pages,
+                              unsigned int mode,
+                              xc_shadow_op_stats_t *stats);

int xc_sched_credit_domain_set(xc_interface *xch,
                               uint32_t domid,
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -650,25 +650,48 @@ int xc_watchdog(xc_interface *xch,
int xc_shadow_control(xc_interface *xch,
                      uint32_t domid,
                      unsigned int sop,
-                      xc_hypercall_buffer_t *dirty_bitmap,
-                      unsigned long pages,
-                      unsigned long *mb,
-                      uint32_t mode,
-                      xc_shadow_op_stats_t *stats)
+                      unsigned int *mb,
+                      unsigned int mode)
{
    int rc;
    DECLARE_DOMCTL;
-    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);

    memset(&domctl, 0, sizeof(domctl));

    domctl.cmd =3D XEN_DOMCTL_shadow_op;
    domctl.domain =3D domid;
    domctl.u.shadow_op.op     =3D sop;
-    domctl.u.shadow_op.pages  =3D pages;
    domctl.u.shadow_op.mb     =3D mb ? *mb : 0;
    domctl.u.shadow_op.mode   =3D mode;
-    if (dirty_bitmap !=3D NULL)
+
+    rc =3D do_domctl(xch, &domctl);
+
+    if ( mb )
+        *mb =3D domctl.u.shadow_op.mb;
+
+    return rc;
+}
+
+long long xc_logdirty_control(xc_interface *xch,
+                              uint32_t domid,
+                              unsigned int sop,
+                              xc_hypercall_buffer_t *dirty_bitmap,
+                              unsigned long pages,
+                              unsigned int mode,
+                              xc_shadow_op_stats_t *stats)
+{
+    int rc;
+    DECLARE_DOMCTL;
+    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
+
+    memset(&domctl, 0, sizeof(domctl));
+
+    domctl.cmd =3D XEN_DOMCTL_shadow_op;
+    domctl.domain =3D domid;
+    domctl.u.shadow_op.op    =3D sop;
+    domctl.u.shadow_op.pages =3D pages;
+    domctl.u.shadow_op.mode  =3D mode;
+    if ( dirty_bitmap )
        set_xen_guest_handle(domctl.u.shadow_op.dirty_bitmap,
                                dirty_bitmap);

@@ -678,9 +701,6 @@ int xc_shadow_control(xc_interface *xch,
        memcpy(stats, &domctl.u.shadow_op.stats,
               sizeof(xc_shadow_op_stats_t));

-    if ( mb )
-        *mb =3D domctl.u.shadow_op.mb;
-
    return (rc =3D=3D 0) ? domctl.u.shadow_op.pages : rc;
}

--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -459,10 +459,10 @@ static int send_checkpoint_dirty_pfn_lis
    DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                    &ctx->restore.dirty_bitmap_hbuf);

-    if ( xc_shadow_control(
+    if ( xc_logdirty_control(
             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
             HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
-             NULL, 0, &stats) !=3D ctx->restore.p2m_size )
+             0, &stats) !=3D ctx->restore.p2m_size )
    {
        PERROR("Failed to retrieve logdirty bitmap");
        goto err;
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -428,18 +428,18 @@ static int enable_logdirty(struct xc_sr_
    /* This juggling is required if logdirty is enabled for VRAM tracking. =
*/
    rc =3D xc_shadow_control(xch, ctx->domid,
                           XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,
-                           NULL, 0, NULL, 0, NULL);
+                           NULL, 0);
    if ( rc < 0 )
    {
        on1 =3D errno;
        rc =3D xc_shadow_control(xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_OFF,
-                               NULL, 0, NULL, 0, NULL);
+                               NULL, 0);
        if ( rc < 0 )
            off =3D errno;
        else {
            rc =3D xc_shadow_control(xch, ctx->domid,
                                   XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,
-                                   NULL, 0, NULL, 0, NULL);
+                                   NULL, 0);
            if ( rc < 0 )
                on2 =3D errno;
        }
@@ -556,10 +556,10 @@ static int send_memory_live(struct xc_sr
        if ( policy_decision !=3D XGS_POLICY_CONTINUE_PRECOPY )
            break;

-        if ( xc_shadow_control(
+        if ( xc_logdirty_control(
                 xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
                 &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-                 NULL, 0, &stats) !=3D ctx->save.p2m_size )
+                 0, &stats) !=3D ctx->save.p2m_size )
        {
            PERROR("Failed to retrieve logdirty bitmap");
            rc =3D -1;
@@ -653,10 +653,10 @@ static int suspend_and_send_dirty(struct
    if ( rc )
        goto out;

-    if ( xc_shadow_control(
+    if ( xc_logdirty_control(
             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
             HYPERCALL_BUFFER(dirty_bitmap), ctx->save.p2m_size,
-             NULL, XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats) !=3D
+             XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats) !=3D
         ctx->save.p2m_size )
    {
        PERROR("Failed to retrieve logdirty bitmap");
@@ -716,10 +716,10 @@ static int verify_frames(struct xc_sr_co
    if ( rc )
        goto out;

-    if ( xc_shadow_control(
+    if ( xc_logdirty_control(
             xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_PEEK,
             &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-             NULL, 0, &stats) !=3D ctx->save.p2m_size )
+             0, &stats) !=3D ctx->save.p2m_size )
    {
        PERROR("Failed to retrieve logdirty bitmap");
        rc =3D -1;
@@ -834,7 +834,7 @@ static void cleanup(struct xc_sr_context


    xc_shadow_control(xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_OFF,
-                      NULL, 0, NULL, 0, NULL);
+                      NULL, 0);

    if ( ctx->save.ops.cleanup(ctx) )
        PERROR("Failed to clean up");
--- a/tools/libs/light/libxl_colo_restore.c
+++ b/tools/libs/light/libxl_colo_restore.c
@@ -62,7 +62,7 @@ static void colo_enable_logdirty(libxl__
    /* we need to know which pages are dirty to restore the guest */
    if (xc_shadow_control(CTX->xch, domid,
                          XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,
-                          NULL, 0, NULL, 0, NULL) < 0) {
+                          NULL, 0) < 0) {
        LOGD(ERROR, domid, "cannot enable secondary vm's logdirty");
        lds->callback(egc, lds, ERROR_FAIL);
        return;
@@ -90,7 +90,7 @@ static void colo_disable_logdirty(libxl_

    /* we need to know which pages are dirty to restore the guest */
    if (xc_shadow_control(CTX->xch, domid, XEN_DOMCTL_SHADOW_OP_OFF,
-                          NULL, 0, NULL, 0, NULL) < 0)
+                          NULL, 0) < 0)
        LOGD(WARN, domid, "cannot disable secondary vm's logdirty");

    if (crs->hvm) {
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -529,10 +529,10 @@ int libxl__arch_domain_create(libxl__gc
        xc_domain_set_time_offset(ctx->xch, domid, rtc_timeoffset);

    if (d_config->b_info.type !=3D LIBXL_DOMAIN_TYPE_PV) {
-        unsigned long shadow =3D DIV_ROUNDUP(d_config->b_info.shadow_memkb=
,
-                                           1024);
+        unsigned int shadow =3D DIV_ROUNDUP(d_config->b_info.shadow_memkb,
+                                          1024);
        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCAT=
ION,
-                          NULL, 0, &shadow, 0, NULL);
+                          &shadow, 0);
    }

    if (d_config->c_info.type =3D=3D LIBXL_DOMAIN_TYPE_PV &&
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -997,13 +997,13 @@ CAMLprim value stub_shadow_allocation_ge
{
CAMLparam2(xch, domid);
CAMLlocal1(mb);
- unsigned long c_mb;
+ unsigned int c_mb;
int ret;

caml_enter_blocking_section();
ret =3D xc_shadow_control(_H(xch), _D(domid),
XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION,
- NULL, 0, &c_mb, 0, NULL);
+ &c_mb, 0);
caml_leave_blocking_section();
if (ret !=3D 0)
failwith_xc(_H(xch));
@@ -1016,14 +1016,14 @@ CAMLprim value stub_shadow_allocation_se
 value mb)
{
CAMLparam3(xch, domid, mb);
- unsigned long c_mb;
+ unsigned int c_mb;
int ret;

c_mb =3D Int_val(mb);
caml_enter_blocking_section();
ret =3D xc_shadow_control(_H(xch), _D(domid),
XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
- NULL, 0, &c_mb, 0, NULL);
+ &c_mb, 0);
caml_leave_blocking_section();
if (ret !=3D 0)
failwith_xc(_H(xch));
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -1192,8 +1192,7 @@ static PyObject *pyxc_shadow_control(PyO
                                      &dom, &op) )
        return NULL;

-    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0, NULL, 0, NULL)
-         < 0 )
+    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0) < 0 )
        return pyxc_error_to_exception(xc->xc_handle);

    Py_INCREF(zero);
@@ -1208,7 +1207,7 @@ static PyObject *pyxc_shadow_mem_control
    int op;
    uint32_t dom;
    int mbarg =3D -1;
-    unsigned long mb;
+    unsigned int mb;

    static char *kwd_list[] =3D { "dom", "mb", NULL };

@@ -1223,7 +1222,7 @@ static PyObject *pyxc_shadow_mem_control
        mb =3D mbarg;
        op =3D XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION;
    }
-    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0, &mb, 0, NULL) =
< 0 )
+    if ( xc_shadow_control(xc->xc_handle, dom, op, &mb, 0) < 0 )
        return pyxc_error_to_exception(xc->xc_handle);

    mbarg =3D mb;



--_000_71F58ADC945E4ED39CB917889DE22641citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <3573AAB75EBF964E8193470316F3C2AF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
For the OCaml part:
<div class=3D""><br class=3D"">
</div>
<div class=3D"">
<div style=3D"margin: 0px; font-stretch: normal; font-size: 11px; line-heig=
ht: normal; font-family: Menlo;" class=3D"">
<span style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Acke=
d-by: Christian Lindig &lt;<a href=3D"mailto:christian.lindig@citrix.com" c=
lass=3D"">christian.lindig@citrix.com</a>&gt;</span></div>
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 25 Jun 2021, at 14:17, Jan Beulich &lt;<a href=3D"mailto=
:jbeulich@suse.com" class=3D"">jbeulich@suse.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div class=3D"">For log-dirty operations a 64-bit field is being truncated =
to become an<br class=3D"">
&quot;int&quot; return value. Seeing the large number of arguments the pres=
ent<br class=3D"">
function takes, reduce its set of parameters to that needed for all<br clas=
s=3D"">
operations not involving the log-dirty bitmap, while introducing a new<br c=
lass=3D"">
wrapper for the log-dirty bitmap operations. This new function in turn<br c=
lass=3D"">
doesn't need an &quot;mb&quot; parameter, but has a 64-bit return type. (Us=
ing the<br class=3D"">
return value in favor of a pointer-type parameter is left as is, to<br clas=
s=3D"">
disturb callers as little as possible.)<br class=3D"">
<br class=3D"">
While altering xc_shadow_control() anyway, also adjust the types of the<br =
class=3D"">
last two of the remaining parameters.<br class=3D"">
<br class=3D"">
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" class=
=3D"">jbeulich@suse.com</a>&gt;<br class=3D"">
---<br class=3D"">
I wonder whether we shouldn't take the opportunity and also rename<br class=
=3D"">
xc_shadow_control() to, say, xc_paging_control(), matching the layer<br cla=
ss=3D"">
above the HAP/shadow distinction in the hypervisor.<br class=3D"">
<br class=3D"">
--- a/tools/include/xenctrl.h<br class=3D"">
+++ b/tools/include/xenctrl.h<br class=3D"">
@@ -885,11 +885,15 @@ typedef struct xen_domctl_shadow_op_stat<br class=3D"=
">
int xc_shadow_control(xc_interface *xch,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t domid,<br=
 class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int sop,<=
br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xc_hypercall_buffer_t =
*dirty_bitmap,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long pages,<b=
r class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long *mb,<br =
class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t mode,<br clas=
s=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xc_shadow_op_stats_t *=
stats);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int *mb,<br c=
lass=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int mode);<br=
 class=3D"">
+long long xc_logdirty_control(xc_interface *xch,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t domid,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int sop,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;xc_hypercall_buffer_t *dirty_bitmap,<br class=3D"=
">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long pages,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int mode,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;xc_shadow_op_stats_t *stats);<br class=3D"">
<br class=3D"">
int xc_sched_credit_domain_set(xc_interface *xch,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t domid,<br class=3D"">
--- a/tools/libs/ctrl/xc_domain.c<br class=3D"">
+++ b/tools/libs/ctrl/xc_domain.c<br class=3D"">
@@ -650,25 +650,48 @@ int xc_watchdog(xc_interface *xch,<br class=3D"">
int xc_shadow_control(xc_interface *xch,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t domid,<br=
 class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int sop,<=
br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xc_hypercall_buffer_t =
*dirty_bitmap,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long pages,<b=
r class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long *mb,<br =
class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t mode,<br clas=
s=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xc_shadow_op_stats_t *=
stats)<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int *mb,<br c=
lass=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int mode)<br =
class=3D"">
{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;int rc;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;DECLARE_DOMCTL;<br class=3D"">
- &nbsp;&nbsp;&nbsp;DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);<br cla=
ss=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;memset(&amp;domctl, 0, sizeof(domctl));<br class=3D=
"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;domctl.cmd =3D XEN_DOMCTL_shadow_op;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;domctl.domain =3D domid;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;domctl.u.shadow_op.op &nbsp;&nbsp;&nbsp;&nbsp;=3D s=
op;<br class=3D"">
- &nbsp;&nbsp;&nbsp;domctl.u.shadow_op.pages &nbsp;=3D pages;<br class=3D""=
>
&nbsp;&nbsp;&nbsp;&nbsp;domctl.u.shadow_op.mb &nbsp;&nbsp;&nbsp;&nbsp;=3D m=
b ? *mb : 0;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;domctl.u.shadow_op.mode &nbsp;&nbsp;=3D mode;<br cl=
ass=3D"">
- &nbsp;&nbsp;&nbsp;if (dirty_bitmap !=3D NULL)<br class=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;rc =3D do_domctl(xch, &amp;domctl);<br class=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;if ( mb )<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*mb =3D domctl.u.shadow_op.mb;<=
br class=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;return rc;<br class=3D"">
+}<br class=3D"">
+<br class=3D"">
+long long xc_logdirty_control(xc_interface *xch,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;uint32_t domid,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int sop,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;xc_hypercall_buffer_t *dirty_bitmap,<br class=3D"=
">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long pages,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int mode,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;xc_shadow_op_stats_t *stats)<br class=3D"">
+{<br class=3D"">
+ &nbsp;&nbsp;&nbsp;int rc;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;DECLARE_DOMCTL;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);<br cla=
ss=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;memset(&amp;domctl, 0, sizeof(domctl));<br class=3D"">
+<br class=3D"">
+ &nbsp;&nbsp;&nbsp;domctl.cmd =3D XEN_DOMCTL_shadow_op;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;domctl.domain =3D domid;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;domctl.u.shadow_op.op &nbsp;&nbsp;&nbsp;=3D sop;<br cla=
ss=3D"">
+ &nbsp;&nbsp;&nbsp;domctl.u.shadow_op.pages =3D pages;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;domctl.u.shadow_op.mode &nbsp;=3D mode;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;if ( dirty_bitmap )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;set_xen_guest_handle(domctl=
.u.shadow_op.dirty_bitmap,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dirty_bitmap);<br class=3D"">
<br class=3D"">
@@ -678,9 +701,6 @@ int xc_shadow_control(xc_interface *xch,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memcpy(stats, &amp;domctl.u=
.shadow_op.stats,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;sizeof(xc_shadow_op_stats_t));<br class=3D"">
<br class=3D"">
- &nbsp;&nbsp;&nbsp;if ( mb ) <br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*mb =3D domctl.u.shadow_op.mb;<=
br class=3D"">
-<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;return (rc =3D=3D 0) ? domctl.u.shadow_op.pages : r=
c;<br class=3D"">
}<br class=3D"">
<br class=3D"">
--- a/tools/libs/guest/xg_sr_restore.c<br class=3D"">
+++ b/tools/libs/guest/xg_sr_restore.c<br class=3D"">
@@ -459,10 +459,10 @@ static int send_checkpoint_dirty_pfn_lis<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirt=
y_bitmap,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;ctx-=
&gt;restore.dirty_bitmap_hbuf);<br class=3D"">
<br class=3D"">
- &nbsp;&nbsp;&nbsp;if ( xc_shadow_control(<br class=3D"">
+ &nbsp;&nbsp;&nbsp;if ( xc_logdirty_control(<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;xch, ctx-&gt;domid, XEN_DOMCTL_SHADOW_OP_CLEAN,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;HYPERCALL_BUFFER(dirty_bitmap), ctx-&gt;restore.p2m_size,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;N=
ULL, 0, &amp;stats) !=3D ctx-&gt;restore.p2m_size )<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0=
, &amp;stats) !=3D ctx-&gt;restore.p2m_size )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PERROR(&quot;Failed to retr=
ieve logdirty bitmap&quot;);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto err;<br class=3D"">
--- a/tools/libs/guest/xg_sr_save.c<br class=3D"">
+++ b/tools/libs/guest/xg_sr_save.c<br class=3D"">
@@ -428,18 +428,18 @@ static int enable_logdirty(struct xc_sr_<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;/* This juggling is required if logdirty is enabled=
 for VRAM tracking. */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;rc =3D xc_shadow_control(xch, ctx-&gt;domid,<br cla=
ss=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;NULL, 0, NULL, 0, NULL);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;NULL, 0);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if ( rc &lt; 0 )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;on1 =3D errno;<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rc =3D xc_shadow_control(xc=
h, ctx-&gt;domid, XEN_DOMCTL_SHADOW_OP_OFF,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NULL, 0, NULL, 0, NULL);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NULL, 0);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( rc &lt; 0 )<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;off=
 =3D errno;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rc =
=3D xc_shadow_control(xch, ctx-&gt;domid,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XEN_DOMCTL_SHAD=
OW_OP_ENABLE_LOGDIRTY,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NULL, 0, NULL, 0, N=
ULL);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NULL, 0);<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
( rc &lt; 0 )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;on2 =3D errno;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
@@ -556,10 +556,10 @@ static int send_memory_live(struct xc_sr<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( policy_decision !=3D X=
GS_POLICY_CONTINUE_PRECOPY )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bre=
ak;<br class=3D"">
<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( xc_shadow_control(<br clas=
s=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( xc_logdirty_control(<br cl=
ass=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;xch, ctx-&gt;domid, XEN_DOMCTL_SHADOW_OP_CLEAN,<=
br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&amp;ctx-&gt;save.dirty_bitmap_hbuf, ctx-&gt;sav=
e.p2m_size,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;NULL, 0, &amp;stats) !=3D ctx-&gt;save.p2m_size )<br=
 class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;0, &amp;stats) !=3D ctx-&gt;save.p2m_size )<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PER=
ROR(&quot;Failed to retrieve logdirty bitmap&quot;);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rc =
=3D -1;<br class=3D"">
@@ -653,10 +653,10 @@ static int suspend_and_send_dirty(struct<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;if ( rc )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto out;<br class=3D"">
<br class=3D"">
- &nbsp;&nbsp;&nbsp;if ( xc_shadow_control(<br class=3D"">
+ &nbsp;&nbsp;&nbsp;if ( xc_logdirty_control(<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;xch, ctx-&gt;domid, XEN_DOMCTL_SHADOW_OP_CLEAN,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;HYPERCALL_BUFFER(dirty_bitmap), ctx-&gt;save.p2m_size,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;N=
ULL, XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &amp;stats) !=3D<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X=
EN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &amp;stats) !=3D<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ctx-&gt;save.p2m_size=
 )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PERROR(&quot;Failed to retr=
ieve logdirty bitmap&quot;);<br class=3D"">
@@ -716,10 +716,10 @@ static int verify_frames(struct xc_sr_co<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;if ( rc )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto out;<br class=3D"">
<br class=3D"">
- &nbsp;&nbsp;&nbsp;if ( xc_shadow_control(<br class=3D"">
+ &nbsp;&nbsp;&nbsp;if ( xc_logdirty_control(<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;xch, ctx-&gt;domid, XEN_DOMCTL_SHADOW_OP_PEEK,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&amp;ctx-&gt;save.dirty_bitmap_hbuf, ctx-&gt;save.p2m_size,<br class=3D"=
">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;N=
ULL, 0, &amp;stats) !=3D ctx-&gt;save.p2m_size )<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0=
, &amp;stats) !=3D ctx-&gt;save.p2m_size )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;{<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PERROR(&quot;Failed to retr=
ieve logdirty bitmap&quot;);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rc =3D -1;<br class=3D"">
@@ -834,7 +834,7 @@ static void cleanup(struct xc_sr_context<br class=3D"">
<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;xc_shadow_control(xch, ctx-&gt;domid, XEN_DOMCTL_SH=
ADOW_OP_OFF,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NULL, 0, NULL, 0, NULL=
);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NULL, 0);<br class=3D"=
">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if ( ctx-&gt;save.ops.cleanup(ctx) )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PERROR(&quot;Failed to clea=
n up&quot;);<br class=3D"">
--- a/tools/libs/light/libxl_colo_restore.c<br class=3D"">
+++ b/tools/libs/light/libxl_colo_restore.c<br class=3D"">
@@ -62,7 +62,7 @@ static void colo_enable_logdirty(libxl__<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;/* we need to know which pages are dirty to restore=
 the guest */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if (xc_shadow_control(CTX-&gt;xch, domid,<br class=
=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;NULL, 0, NULL, 0, NULL) &lt; 0) {<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;NULL, 0) &lt; 0) {<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOGD(ERROR, domid, &quot;ca=
nnot enable secondary vm's logdirty&quot;);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lds-&gt;callback(egc, lds, =
ERROR_FAIL);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return;<br class=3D"">
@@ -90,7 +90,7 @@ static void colo_disable_logdirty(libxl_<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;/* we need to know which pages are dirty to restore=
 the guest */<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if (xc_shadow_control(CTX-&gt;xch, domid, XEN_DOMCT=
L_SHADOW_OP_OFF,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;NULL, 0, NULL, 0, NULL) &lt; 0)<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;NULL, 0) &lt; 0)<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOGD(WARN, domid, &quot;can=
not disable secondary vm's logdirty&quot;);<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if (crs-&gt;hvm) {<br class=3D"">
--- a/tools/libs/light/libxl_x86.c<br class=3D"">
+++ b/tools/libs/light/libxl_x86.c<br class=3D"">
@@ -529,10 +529,10 @@ int libxl__arch_domain_create(libxl__gc<br class=3D""=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xc_domain_set_time_offset(c=
tx-&gt;xch, domid, rtc_timeoffset);<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if (d_config-&gt;b_info.type !=3D LIBXL_DOMAIN_TYPE=
_PV) {<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned long shadow =3D DIV_RO=
UNDUP(d_config-&gt;b_info.shadow_memkb,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1024);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;unsigned int shadow =3D DIV_ROU=
NDUP(d_config-&gt;b_info.shadow_memkb,<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;1024);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xc_shadow_control(ctx-&gt;x=
ch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;NULL, 0, &amp;shadow, 0, NULL);<br class=3D"">
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&amp;shadow, 0);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;if (d_config-&gt;c_info.type =3D=3D LIBXL_DOMAIN_TY=
PE_PV &amp;&amp;<br class=3D"">
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c<br class=3D"">
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c<br class=3D"">
@@ -997,13 +997,13 @@ CAMLprim value stub_shadow_allocation_ge<br class=3D"=
">
{<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>CAMLparam2(=
xch, domid);<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>CAMLlocal1(=
mb);<br class=3D"">
-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>unsigned =
long c_mb;<br class=3D"">
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>unsigned =
int c_mb;<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>int ret;<br=
 class=3D"">
<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>caml_enter_=
blocking_section();<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>ret =3D xc_=
shadow_control(_H(xch), _D(domid),<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-t=
ab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre"></span>XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION,<br clas=
s=3D"">
-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple=
-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre"></span>NULL, 0, &amp;c_mb,
 0, NULL);<br class=3D"">
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple=
-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre"></span>&amp;c_mb, 0);<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>caml_leave_=
blocking_section();<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>if (ret !=
=3D 0)<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span>failwith_xc(_H(xch));<=
br class=3D"">
@@ -1016,14 +1016,14 @@ CAMLprim value stub_shadow_allocation_se<br class=
=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-t=
ab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre"></span><span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre"></span>&nbsp;value
 mb)<br class=3D"">
{<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>CAMLparam3(=
xch, domid, mb);<br class=3D"">
-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>unsigned =
long c_mb;<br class=3D"">
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span>unsigned =
int c_mb;<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>int ret;<br=
 class=3D"">
<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>c_mb =3D In=
t_val(mb);<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>caml_enter_=
blocking_section();<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>ret =3D xc_=
shadow_control(_H(xch), _D(domid),<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-t=
ab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" st=
yle=3D"white-space:pre"></span>XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,<br clas=
s=3D"">
-<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple=
-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre"></span>NULL, 0, &amp;c_mb,
 0, NULL);<br class=3D"">
+<span class=3D"Apple-tab-span" style=3D"white-space:pre"> </span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple=
-tab-span" style=3D"white-space:pre"></span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre"></span>&amp;c_mb, 0);<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>caml_leave_=
blocking_section();<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span>if (ret !=
=3D 0)<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space:pre"></span><span class=
=3D"Apple-tab-span" style=3D"white-space:pre"></span>failwith_xc(_H(xch));<=
br class=3D"">
--- a/tools/python/xen/lowlevel/xc/xc.c<br class=3D"">
+++ b/tools/python/xen/lowlevel/xc/xc.c<br class=3D"">
@@ -1192,8 +1192,7 @@ static PyObject *pyxc_shadow_control(PyO<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&amp;dom, &amp;op) )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return NULL;<br class=3D"">
<br class=3D"">
- &nbsp;&nbsp;&nbsp;if ( xc_shadow_control(xc-&gt;xc_handle, dom, op, NULL,=
 0, NULL, 0, NULL) <br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt; 0 )<br class=3D"">
+ &nbsp;&nbsp;&nbsp;if ( xc_shadow_control(xc-&gt;xc_handle, dom, op, NULL,=
 0) &lt; 0 )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return pyxc_error_to_except=
ion(xc-&gt;xc_handle);<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;Py_INCREF(zero);<br class=3D"">
@@ -1208,7 +1207,7 @@ static PyObject *pyxc_shadow_mem_control<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;int op;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;uint32_t dom;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;int mbarg =3D -1;<br class=3D"">
- &nbsp;&nbsp;&nbsp;unsigned long mb;<br class=3D"">
+ &nbsp;&nbsp;&nbsp;unsigned int mb;<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;static char *kwd_list[] =3D { &quot;dom&quot;, &quo=
t;mb&quot;, NULL };<br class=3D"">
<br class=3D"">
@@ -1223,7 +1222,7 @@ static PyObject *pyxc_shadow_mem_control<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mb =3D mbarg;<br class=3D""=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;op =3D XEN_DOMCTL_SHADOW_OP=
_SET_ALLOCATION;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
- &nbsp;&nbsp;&nbsp;if ( xc_shadow_control(xc-&gt;xc_handle, dom, op, NULL,=
 0, &amp;mb, 0, NULL) &lt; 0 )<br class=3D"">
+ &nbsp;&nbsp;&nbsp;if ( xc_shadow_control(xc-&gt;xc_handle, dom, op, &amp;=
mb, 0) &lt; 0 )<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return pyxc_error_to_except=
ion(xc-&gt;xc_handle);<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;mbarg =3D mb;<br class=3D"">
<br class=3D"">
</div>
</div>
</blockquote>
</div>
<br class=3D"">
</div>
</body>
</html>

--_000_71F58ADC945E4ED39CB917889DE22641citrixcom_--

