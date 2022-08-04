Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7758A1AD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 22:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380693.615022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJh2y-0000Yf-I1; Thu, 04 Aug 2022 20:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380693.615022; Thu, 04 Aug 2022 20:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJh2y-0000Vm-EX; Thu, 04 Aug 2022 20:02:20 +0000
Received: by outflank-mailman (input) for mailman id 380693;
 Thu, 04 Aug 2022 20:02:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t48H=YI=citrix.com=prvs=208fa1d4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oJh2w-0000Vg-R4
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 20:02:18 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55f61540-1430-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 22:02:17 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Aug 2022 16:02:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5145.namprd03.prod.outlook.com (2603:10b6:5:1e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 20:02:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 20:02:11 +0000
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
X-Inumbo-ID: 55f61540-1430-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659643337;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=DdiSftAs0A6NBJojnPWBw08jWis86DU+6U1iEsGHZb8=;
  b=C0ynyJ9SQGWCaFt4Z1ov/WTrVFxmz9QLi8RWZ07RB2Wb/rUOrrrPNCOt
   bttMZLjOHQl9IaCyXUUYDhgot3EbsShrFgFjW53O5GkkNMDe6SCfmmGfO
   /wRaQO7XA1AazNfxgjBWLsmHai80sslrtSlfWpd1Dh4e2oklHiLMjgkrT
   M=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 77405099
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AlD1EHKg9xEHN3WVKvSGkLOCoX17brhtdoGDDu?=
 =?us-ascii?q?qucmGfUl6Eq9fh2raMqaBAW4JmfHDDZJAv/Lq82MJgkwZfX7JaqyL8jYAfkX?=
 =?us-ascii?q?/TOL85gU1Cy7A0xgjY0r8sSxWRf0ITB7zEdaeNvC50Cn53/Ehtrln/tyAkFe?=
 =?us-ascii?q?OY5i4AgjpQLuro2F9DWD/fkLKDTtfWHUC9Opwx5KpUtM8JTWOiEO0XU0D9nR?=
 =?us-ascii?q?T1Z6ZB5Bzg2CG+C8pA7tC/9GYKWCcg51xkxxm+4HGKmCndDFf2WF/jLaqcwT?=
 =?us-ascii?q?H8E/UnQypQ7aKYRYqY3eCREaq+LKQCelXemWWdf7Y+4gH6OTYstf48ENhfiv?=
 =?us-ascii?q?HrfrRefOakCT1HYwG8b+ci2lSPhmz/VvkgGyHWr3qZWBDCu8RN2wNnG94G95?=
 =?us-ascii?q?R6sSD7LDqTJ3RLvkIky7AOus2SKtMuNmWeaERDi/Mes+A9JEl0F/b0Hjb0Ns?=
 =?us-ascii?q?uoDDCp9qz4hK5rjuFE9VMG+2wryZ+mJQFlbgXXLDoNKUsVkNWwvo+KaR1ROr?=
 =?us-ascii?q?ofGzEWOnUk1SMBjstTFL0/NVW3NGhT6QcaFDfQeFBjoabypacz/YtLeL/sHl?=
 =?us-ascii?q?sOC10buo6n16DTMdrFYq7r8gw9E0uzpq7qA1r2ud8JaqThKnI+/9qxf/e0bV?=
 =?us-ascii?q?gKxM8mAC+qkkywuec2KYxaZJObTeWY5d/7Cefci5e2yPKNADb8JFxhEYtql+?=
 =?us-ascii?q?76oZXJAo/JZ4s41FUQ3olJzQ4Al8tMLSMW0CV4a1bs2SNXwb3WG7oasn5kLk?=
 =?us-ascii?q?bX5g6dAOsbihg3nt+adQ64KHVBXN/RAPj1/zTdrhcrNm0r/FtkiO8AU4ZKRE?=
 =?us-ascii?q?+IJLZuE1vG8BfrfSo/k2qcBLi/hbhceUjuwakWulr9NieC/HhausfhKFddYo?=
 =?us-ascii?q?fnVBjPwcnbNPNt315nzYkFU4yAi8rNBEYADfwtKu1uk84Jf95ZIKO8qYkyIx?=
 =?us-ascii?q?E8iuMOs0PP72nVw1XpH8VmGpkexIB7aMP9sSeEzHES1dl4UuX/tK7zuRoO7W?=
 =?us-ascii?q?UI3KviOvxakvVzCSMweg7PyEjQHk0FFTB8RBOwoYwEsSmLljstd2fYd47BGn?=
 =?us-ascii?q?S5iUFP1DUzpSMu+7KncgPgCtwDAERMrmou+L7c051BS4N6FFS3599ayEtawR?=
 =?us-ascii?q?qKFGLpJzJYR96o5A/N5fjucB3kMa94x00UF40na6RdF7xzmmes68S2sDiq3o?=
 =?us-ascii?q?KKPc0gQyhskggZW3Juvtd1zISm0On0YuMT5e4b0QUaBmLZZMNQhp4V8/g2VS?=
 =?us-ascii?q?aRakxxCfcVF9yeWrVu6bMyaFSxvCy18P27jJqCA1y3ypKRevbZQcayVJ4Ner?=
 =?us-ascii?q?0j3jOJTwzyBXDnlTr3s65TVC9HNJLSLou+y/WEiUe/+DNRqqShYps8+Nj5rL?=
 =?us-ascii?q?g6/RrO3tDDOMxv0OyxkuTq0x0WdFjpbwDJM84ditelrzn4+sJGziR9x1Jqk8?=
 =?us-ascii?q?xFt7bqKtIu9Ru83s2ZR2U9mo/UVX7G2ssMKNE0YHPYDCCVbo3qMCppLJBwQ4?=
 =?us-ascii?q?zJsIt9Z++28XX3bwrObu+f+I73InTFKs6o2wTwua25anAZKHIqd9S9as/XU8?=
 =?us-ascii?q?PdaqZKQrIHcpzS/+gNw7mp/2wRs9xBTrGNyeb7QJhrD/V4+/bRzX9PqPuug7?=
 =?us-ascii?q?D/P4x2B4J1zgy1MvkOJt/hqQUq3sAp7FC44vSdNA6IuON1EwG36WP5OpJpRq?=
 =?us-ascii?q?Y9UgFYicq41k16dcZdtt95ffwc4arFAPGqP5o40qh/ov4PTxF2w1/1UonT91?=
 =?us-ascii?q?FQaI/eXE+PVt88wYOgUokwFEFoxun1zYeBYLV3ddIhagOVwF7GAYJ0jGXn5P?=
 =?us-ascii?q?cyoauBsS6GnhrRdLkKuNX5lnfeC/5AVzGbxlxl7ccEcGAQiHiVK9J60cQlX7?=
 =?us-ascii?q?rtdN/hpiRgdklhfUpj9kRGWzLgwqliEgBb8O6LJ0zDZ7/hDd/MFW67xC74+j?=
 =?us-ascii?q?YhjxNpzKO8QhKIRrrzwLzuvRixvhjRpHdnMXRAiCgKZtZsUxWGsVSMy+ClYf?=
 =?us-ascii?q?L6XdTlicJ73LDefLNWsKEQUeKYqo+WvREQjKbWkKUg+ljcAdfr3q0zM31RWA?=
 =?us-ascii?q?pgqkYJnbXWIYwtKe0u9J89cRjHKhnnKZw19Qcw3D04yFxWZE+maLJRaNysDQ?=
 =?us-ascii?q?zv8tw24Nbje88pE+H039iwczRYm9iOYKMo4s4QBwOUCQrhol/hc720Rfj5EJ?=
 =?us-ascii?q?AGWRSKqZDFJP93WrqzF3K+buBUR/m+xatWEFlzw7yRzYEUJA3fUwXLYNpuSr?=
 =?us-ascii?q?XFXrPCe2Z/fEYYso9xd56opJ0wLTLSqRP7aLU0RjSEVGPsiChNzKoIJnVvX5?=
 =?us-ascii?q?0rdq/mso0cLXp4l9BiCoy1x5d9T+fmgq2WSKV7e+5RYwLcB1O1oi/h+KVI7m?=
 =?us-ascii?q?OdRnDpCfNd7efNANZZClQ+mLPml+mVKswq5onFNd5MS1RNJBhtzZnOVVeJCL?=
 =?us-ascii?q?HkGwwaZ1EeXMlMbyFydEjiPuJwhfxzZYmy6Cng3cMyO3JTNCwKV9j24e/qT1?=
 =?us-ascii?q?GzhXSNQVUcoyTZ81ShLQYOO4EJgOo2yuVBbfJg3m7hblaOfh0A3d8hZ7hxtd?=
 =?us-ascii?q?GkMPsAJqKlGKY+X4nkoH7342V4fNf2Kr5Rh2HkDmYj0oIF1HfnywTrlEFGYd?=
 =?us-ascii?q?VJy8uUYnKbdjE4tUsEY2LAEnwlFgHZjbhP4APtKhMS8x1M0mSCdCmjcthTKY?=
 =?us-ascii?q?VZflzDuL/S9brSLNipu/CGSzuzL3WYczuzNASPQRFam+Br1HrIq5Z0nbcDAe?=
 =?us-ascii?q?pYkCXfAacIebRS5kBuMky6jSSs+Br2s/x+g8IGllGGyCE0xauvWeBkiEOzo1?=
 =?us-ascii?q?DZS35W2luS9rr8vMRznL1AL6w3SBMpi5T1EHd9bisIZmgkX2PI4ip9qsYcjE?=
 =?us-ascii?q?YZ53b3G0hnXavHaRFQjkhKorW0fIr/yFCix7ZnXoOBnExZg67FrEnr1Qg3ft?=
 =?us-ascii?q?CGfh1FkU439C9MBSqcH5b+CfQxzdsSHXRTdH4wsH8RQ7x/MUL3YvA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77405099"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUeCPRsoNwAa0nbp2SiiyYXqcxnRVsOgtlz5xaIGKEhgxRKecS/V0/N3+vhoJmcIz3pMnNJyFCdVWyHWw02t0JbUVAUQVn76GTMjHyjTymsI6lktaaISRV9KrB+pV1UAHe4Eel1vav4L9BFCdMbY4tJvsg+VxPwMb6okXfLBa72VmRI21Yw80DxwaZinWKuvuXWsMhZOwj9tdJRgumIfayNIgtoyP9hsRc22iMSFSmtLxXDjv4Yb00yC974RXrUe5mWLCODZeMXZBMAJPKg0mJbQxOCfzpP4LI/Ge519wZ/qSFChbPkR62jEIWg1HnRn7LJsbs0Kws0Hr4f87R3K6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdiSftAs0A6NBJojnPWBw08jWis86DU+6U1iEsGHZb8=;
 b=Vp2Vr9lELBnacDu7bzRzRNUZCuxWpNaO0Ugo2AUaPvstAm78Tajqbg+0gh0F0iGoHWoOzw+LjmlvnN8PnbjhSbS6SPaLEq48eyCGDoF6xL2SF/9KvG4me7Am4a7B5L5MHI3EMjHrx9uSRkBux90f92OpH1QryoEseoxgpbAtz04jJvaC75g4w0Z1ejqDJMNWUsv/wsokv8SKn1yJwHeiKH8SdDG7klzZRa0rf2NywaeOkA67z8rsasXvWniv1vTdG9Inj4WGRtUugNMPEQFUxqVjaUPh/qZqYn2OEc5WdVrhoPa/E478GPD0Ri/YmNs5sIq06JJuLeXAVtO3kmmhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdiSftAs0A6NBJojnPWBw08jWis86DU+6U1iEsGHZb8=;
 b=pBnx+gWOCOn8/CgWFEoXUYn/9zEDekyA7esYyYdRc8GVJbJNtY9luMgfVEHgnoHhMNTwQXF8+L+K0qLp/dDOdfwT9qxJqKlegpezcj7HeIgx036/8q92wx0T1m4s6L6ewwzI/ZhjGce0hW/Hgu5k4/x80tGDKY11fKYvCfFWVHc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH 0/4] xen/x86: import linkage.h and clean up x86/kexec.S
 and x86/entry.S
Thread-Topic: [PATCH 0/4] xen/x86: import linkage.h and clean up x86/kexec.S
 and x86/entry.S
Thread-Index: AQHYqBOb2BbPALUx806CiYF/B0ilaq2fKgOA
Date: Thu, 4 Aug 2022 20:02:11 +0000
Message-ID: <56ba2f21-9c07-e79f-af9f-12083a972498@citrix.com>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
In-Reply-To: <20220804150424.17584-1-jane.malalane@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b23baa3-3abc-4499-7600-08da76543835
x-ms-traffictypediagnostic: DM6PR03MB5145:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XqQdres1Yjmuo9fr+xASfjB19vWPYh6JmgKctGfN4oMMbR2IQs38gRSbaKzheX8XXHQPWgsmEHpX0NP053OCbTGxnqv477qRkuzBWAGK1N8bZlbVZfRJpZ0toIPL5e6Qgy6ng+W1mC8zvtOGiVPTpgfgEJcGbDW7X+3CKYtaDy7IWGSM9PT8UQjPWyUbT67Ape5yxU5uV4TqAubQRCMKuGRQBE81AAP4pvhfWyFhaQMMXZXojYc6xzbvATq4Lh8ZdNrqnOqsaQu1JsqNqUmGdMZSCOP2lYZvIWA7/2a2SZ+xZmlRvc5jMVqFhzQhzBJLfcTKjW18czSG538OoyY4d2xRNOmDLEZN0WkrMAQNaw0/nLQB2k53im47XfJjTG7efEOAXiEm+jX/LMfHZdFvgj3c891RzGl/jybDx9cIgtjDx4MhM2TvNWHNvrc7A38JXaWGpezTeSbZw2i8KsQf5lg31OguYDEshPpQqGurHbwL+ZEqXqpYmOVA0JfIU8P0Bwdtx2obxScBkbiNpflFTz0nn92BIC5oy2m2ITdzyfqny0L6Pf6LXCMjoHApuvRZgBjO1/d6KXvEWKJ/CzUdrTJpmjjFxE7AOCG2vExgLxM4SFyEmkyk5tHecDZtXgjJqS61c/gTTwF01/FsOu1XWtAQICr9xV4jQd99RmCvTCNSP+VcSUti9dQZWCqlrPUOTUXrsQTC/XBJfae/9prsGz0H9jmVwwtOVN7qJXLpWoWXHLJ+VziroUjA/gpsFKwvlu373TO7p1ThaswNX9OeQS7XoiESvD2SzEfsOVKJSeB6jdyPusUzage25zUuow9lt2Rgothyav2tDiRq551FVERdxMbdWq0g6BQokw8oZgm86BPFnmejnwaE8UTP8zaq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(83380400001)(2906002)(76116006)(66476007)(478600001)(8676002)(66446008)(38070700005)(64756008)(122000001)(38100700002)(82960400001)(66556008)(66946007)(316002)(6486002)(71200400001)(5660300002)(110136005)(2616005)(41300700001)(91956017)(186003)(53546011)(36756003)(6512007)(26005)(8936002)(6506007)(31686004)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkFLNWFiY1RDQlNkaTM0OVpWbkNwQVl4MGlpQ0NuZDJGYnNMSnc3UkpXQlFR?=
 =?utf-8?B?and3cThhbVBVTFJDL3BrQ1oyQjV0c2JHelFFWTRUV244NVB4S1NwNm02am1U?=
 =?utf-8?B?WVh1WEtJQ2E3Q1VLR3F3R0xORWRFTTh6TVEvZldRVWU5aUNjVkw0a2lxUExD?=
 =?utf-8?B?ZUtLSW1qRktzSFFTR0R0YmUxNTA1VldFdlFZM1o0ekJrN0NPaHlZeHhKVHJQ?=
 =?utf-8?B?Q1F0WDBNSDFwQ0ZhWHdod244a1ArUlE1QngxbGVzdmg4UXpQNGFidkJGOGph?=
 =?utf-8?B?ajhQRHFMblM1dVE3aUYyZmNOZVRzdmlBeFJHdVRzMGZadlNYb0FyS0JWc1Rz?=
 =?utf-8?B?eE4vM2dxRkwxMFJQNWhnbXpQQTd0RTRESm9nRnBMYlpRQW1ValdFV1RMMDJm?=
 =?utf-8?B?UEI2WlY3QzNEUXhVSk9VN2VaZlZlY0p2RVhUcjVqUVhhT0FqRHBjcTJhZ3RV?=
 =?utf-8?B?RzhPdVdWWG53L1RQYm5BRndWZkJncDZiSXdXdlI4VEkzNVB2L2lSeFovbGxY?=
 =?utf-8?B?OEZ1emhHUCtodk5CTTV1dVVybHhHK2ZKV3B6MWVKNGU3Z294MkNGWTVwYnBw?=
 =?utf-8?B?clJIWDd2QWRvVVoybkxhblRHbTNrM0VtWU9icTV5eVFJSXBJZHpkWFJla3dT?=
 =?utf-8?B?dEJ4ejhDNFpUZTlrb3BCRlVZUk5YWnBZYStmSGpVMmpwTmVGM3AvWSt2NEd2?=
 =?utf-8?B?QWZqM3VFR0pJOVhHTUk0TWVhS05BY1pkdGQwS0tHLzFDTDYzeTNtK0c2WUhj?=
 =?utf-8?B?NEpJaUJsb0JUbUFaRE5aa3YzcENQNG1xRnVYdHl6cGxRbml3Nkp5RXhKVXdO?=
 =?utf-8?B?UFF6V1VrUnlvUHZXc3V1SklaVXFEZm9ocUhIVGIxL1VpU0hCajd6RUNKcFRU?=
 =?utf-8?B?Y1JKalVYbTQ3Q1J2bEFTeEVxTzNSeEk1cWdQMjRpdVBxdHBrVzNnNkZuN0VF?=
 =?utf-8?B?YlZ0bDAvU2g2Z2N5NnVRUTJ0WnZ2RjVvN0tQa05naFp1NmR4OTE0UWoyTkg3?=
 =?utf-8?B?LzZCSGx1ZE96elBFcTloR1VWVWp0eHRGUDJNWnI0REw1b2JSZFI2bGxEZldo?=
 =?utf-8?B?QVFaV0ZJdjdSV3VJenJZUDJId0VBVzA4U1EzemhrbEh6UllwN05YYXlYd3R4?=
 =?utf-8?B?UmVCL3JITzdUb2cxNThXcFo2czlHRGFpUnUzc0JsQ0JEeGdycHJaWFZGVmlj?=
 =?utf-8?B?SkpVSmxvVWxKZ2ppdUFvcW1LVjIxTi9NNlZuUnpmUm1Vdi9PcjA5SnNOWS9B?=
 =?utf-8?B?VEVDV0d1WEhOQlowaS9yLzdiZmhsRU1BNDZJK0RIaS9TUFQrWTlPbGVaZE04?=
 =?utf-8?B?NU1jN3pDd3RsL1luYk1LckdnUDNDcjdNYWgxVXh3UFprMzZkUVRObU1tbXZn?=
 =?utf-8?B?a0VrTEVZNDJsY1FTN3V0LzFjbkJWR1gzZUxmZGNVS0dSTzUrdHhQa3VCdC9G?=
 =?utf-8?B?QW1pdlJSeEtLUG4wYmlmaXVrNzNIR004SjlvNmxxaStoWkZBMW5KNmxpdm1z?=
 =?utf-8?B?bUlrZDZucmZTRjVEZ01qaisxdzVzYTlLQnkwVGVnRE1ycFpIZGYvbER2YWh5?=
 =?utf-8?B?WDl5UmhTcTVMd3dsaUU0clE2L2ZCajNRTjliREhwN05FWnMvcUd3bnNrem02?=
 =?utf-8?B?TS9NcHZvd043UjRyNkpadHZmYVd0SVpvMmcrMUUzdTR4VzNWaGl3UVlGUUNr?=
 =?utf-8?B?VGVOUmZEdGY5U3VBTEVpQ0pnOGV3dTVxTTdHc0dMbUdzZzkrK3VrN04yWjND?=
 =?utf-8?B?L2pGZTI1SE5USnlScysxMjUrUFJCT3lpK0E3amV4NWNMNjJMRXVYcVhlQWhj?=
 =?utf-8?B?UEpxem1RR2RKRFNaSWp0Ymc5ZFlJYmpsakNRa1FEdUJqN1FxTlJuWldXTEZU?=
 =?utf-8?B?bHVYQUFwa2M3MThMVTJUK2JTNXA2V1BSVEQ4SUlFYmQyeVZCOHUwcEhuOEJr?=
 =?utf-8?B?VU00dm1nRlBoc3k2U01mSVY5VVRoWUZIMEw3K3Z2Ym14c0daWEZMTUhHZVh1?=
 =?utf-8?B?aExIaFE0RzZIWkIyT1NuU0NkMjJJSzArWkNwdWdmeFd4aDQvMnVTd1dHODJZ?=
 =?utf-8?B?SjRpcHoxM05FUmwyZDRVVDFIZERjc2JDOHJSa29XMEdVQXhnV21jRXhEbkIy?=
 =?utf-8?Q?oNF1F5m4IMmP35lmwbx/tQyAK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00E6864015B63347BEA3D714E0774137@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b23baa3-3abc-4499-7600-08da76543835
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2022 20:02:11.8235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuca+4/P4GvsTekojyJK9Z/WTDgLX6bZZousiIVW764sXiGTAOzqUY6Y0+yhsCM59qvK0wauIQKWrdNWIgkM1nKBPQWzdJcWO0JqMfhMyHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5145

T24gMDQvMDgvMjAyMiAxNjowNCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4gSmFuZSBNYWxhbGFu
ZSAoNCk6DQo+ICAgeDg2L2tleGVjOiBBZGQgdGhlICcuTF8nIHByZWZpeCB0byBpc18qIGFuZCBj
YWxsXyogbGFiZWxzDQo+ICAgeGVuOiBQb3J0IGxpbmthZ2UuaCBmcm9tIGtlcm5lbCBjb2RlDQo+
ICAgeDg2L2VudHJ5OiBtb3ZlIC5pbml0LnRleHQgc2VjdGlvbiBoaWdoZXIgdXAgaW4gdGhlIGNv
ZGUgZm9yDQo+ICAgICByZWFkYWJpbGl0eQ0KPiAgIHg4NjogVXNlIGxpbmthZ2UuaCBoZWxwZXJz
IHRvIGFkZCB0YWdzIHRvIHN5bWJvbHMNCg0KVGhpcyBwcm9iYWJseSBkZXNlcnZlcyBhIGJpdCBv
ZiBleHBsYW5hdGlvbi4NCg0KUGF0Y2ggNCBpcyB0aGUgZmlyc3Qgb2Ygc2V2ZXJhbCBidWdmaXhl
cyB3aGljaCBoYXZlIGJlZW4gb3V0c3RhbmRpbmcNCnNpbmNlIFhTQS0yOTcvTURTIChJIHRoaW5r
IC0gcHJldHR5IHN1cmUgaXQgd2FzIHRoaXMgWFNBLCBidXQgaWYgbm90DQp0aGVuIGl0IHdhcyBv
bmUgYXJvdW5kIHRoYXQgdGltZSkgd2hlcmUgYW4gYXR0ZW1wdCB0byBwYXRjaA0KcmVzdG9yZV9h
bGxfZ3Vlc3QgZmFpbGVkIGluIHNldmVyYWwgY3JlYXRpdmUgd2F5cy4NCg0KRmlyc3QsIHdlIG5l
ZWQgRUxGIG1ldGFkYXRhIHNvIHRoZSBsaXZlcGF0Y2ggYnVpbGQgdG9vbHMgY2FuIGFjdHVhbGx5
IGRvDQp0aGVpciBqb2JzLg0KDQpTZWNvbmQgKGFuZCBpbiBhIHNlcmllcyB0byBmb2xsb3cpIGlz
IHRlYWNoaW5nIFhlbidzIGxpdmVwYXRjaCBsb2dpYw0KdGhhdCAudGV4dC5lbnRyeSBpcyBzcGVj
aWFsIGFuZCByZXF1aXJlcyBtYXBwaW5nIGluIHRoZSBYUFRJIHBhZ2V0YWJsZXMgdG9vLg0KDQoN
ClRoZSBjaG9pY2UgdG8gZ28gd2l0aCBMaW51eCdzIGxpbmthZ2UuaCBpcyBiZWNhdXNlIGl0J3Mg
YWxyZWFkeSBhDQpzdGFuZGFyZCB0aGF0IHBlb3BsZSB3b3JraW5nIGluIG91ciBhcmVhIGFyZSBm
YW1pbGlhciB3aXRoLCBhbmQgYmVjYXVzZQ0KbXkgcHJldmlvdXMgYXR0ZW1wdHMgdG8gc29ydCB0
aGUgRUxGIG1ldGFkYXRhIGhhdmUgYmVlbiByZXNvdW5kaW5nDQpmYWlsdXJlcyBvZiBuaXRwaWNr
aW5nLg0KDQpNeSBleHBlY3RhdGlvbiBpcyB0aGF0IG92ZXIgdGltZSwgd2UnbGwgbW92ZSBhbGwg
YXNtIGNvZGUgb3ZlciB0byB1c2luZw0KdGhlc2UgYW5kIHJldGlyZSB0aGUgY3VycmVudCBhZC1o
b2MgbWFjcm9zIHdlIGhhdmUuDQoNClRoaXMgc2VyaWVzIGlzIGFsbCBzdWdnZXN0ZWQvcmVxdWVz
dGVkIGJ5IG1lLCBzbyBpbXBsaWNpdGx5IGFja2VkLCBidXQNCnNob3VsZCBoYXZlIGFja3MgZnJv
bSBzb21lb25lIGVsc2UgdG9vLg0KDQp+QW5kcmV3DQo=

