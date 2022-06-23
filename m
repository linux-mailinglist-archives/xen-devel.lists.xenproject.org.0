Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E755773D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354775.582058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JZt-000513-Kc; Thu, 23 Jun 2022 09:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354775.582058; Thu, 23 Jun 2022 09:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JZt-0004yg-Gg; Thu, 23 Jun 2022 09:56:45 +0000
Received: by outflank-mailman (input) for mailman id 354775;
 Thu, 23 Jun 2022 09:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vof+=W6=citrix.com=prvs=166aae13d=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o4JZs-0004ya-CV
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:56:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c76c63c4-f2da-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 11:56:41 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 05:56:36 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by MN2PR03MB5375.namprd03.prod.outlook.com (2603:10b6:208:1ee::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 09:56:34 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::99b:8d7c:620d:d795]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::99b:8d7c:620d:d795%7]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 09:56:34 +0000
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
X-Inumbo-ID: c76c63c4-f2da-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655978202;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=oiGANlG8K8+pnTlQLCbjfuKOL0MgCQBzhwyREDcWTes=;
  b=XZW3ZKKKFcyRy2AH4NuqmH+Fw7EUFS/aJvgLiBnWJRuMR8Uq1BRUXUKF
   zCIXr65vykgINVvBlg3VdFnve9CGDc7hTakbag44ZsysaJ+yIjYia3I7S
   lFLqaCWDt1brDpIA5ID1xtCmcPhJTnyCJTStLTG6ad7iPshF+m9YQqZeL
   o=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 74262279
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2mEirajAo5vv67VeBze6+csvX161JhAKZh0ujC45NGQN5FlGYwSy9
 lOraxnFY6jUMyawOYxoOc7lxf41ycWAz9ZmTQBvqCxkFSIT8pebDI/JIxv7MXrNJZGcHRI2s
 p9GNdTJfJ04EXGG/xv3aOe59yZ22fDZS+KmWeeUNn0ZqWOIMMsEoUsLd7kR3t446TTAPz6wh
 D/SnyH+EFT+h2AoYjpLsP7f8R4x4v6ssz9EsFZkNakTt1KDx3cZXc4Tfa2/ESD1E9JedgKYq
 0cv710bEkfxpUpF5gaNy+6jGqEyaueOe1DI0BK6YoD66vR4jnVaPp0TabxNMy+7tx3Tx4ork
 IsX78TsIesUFvakdNo1AkEw/x5WZcWqyJefSZRomZXOp6FuWyKEL8RGVCnaD6VBkgpEKTgmG
 cgjACIMdni+a9eem9pXfAXOavMLd6EHNKtH0p1pIKqw4fwOGfgvSI2SjTNUMatZammj0p8ya
 uJAAQeDYigsbDVGO3wnT4kBxtyQnyfhWj51sA+FnpAotj27IAxZiNABMfLzU/nTHIB/uBbdo
 WjLuWPkHhsdKdqTjyKf9W6hjfPOmiW9X58OELq/9bhhh1j7Km47UUVKEwfk56TpzBfgCrqzK
 GRNksYqhYc/81akQ5/RQhu8qWastR8AQdtAVeY97Wlhz4KLv1zHXDJbH1atbvQ7nf0vFHsXy
 WSAgtjWWDhNvKGVTmmCo+L8QTSafHJ9wXU5TS0OQBYB4tLjiJoulR+JRdFmeIa3k9n0FDfY0
 z2M6i8kiN07ltUX3q+2+VTGhTOEpZXTSAMxoALNUQqN8QdRdIOjIYuy5jDz4flMIYmDR3Gdr
 XMEnI6Y9+lIApaT/ASdTeNIELy36vKtNDzHnUUpD5Qn7y6q+XOoYcZX+j4WDEtxKcMFZT/Ba
 Vfeox9M/4RUOGa2bKhxeMS6DMFC8ET7PdHsV/SRZNweZJF0LVaD5Hs3Ox/W2H3xmk8xl615I
 Y2cbcunEXcdD+Jg0SayQOAel7Qsw0jS2F/ueHwy9Dz/uZL2WZJfYe5dWLdSRojVNJ+5nTg=
IronPort-HdrOrdr: A9a23:XMVzGK6MZlubq5zCHAPXwWSBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTPqftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkzNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9o1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUWpDKh8KoCOCW/sLlWFtzesHfsWG2nYczHgNkBmpDt1L/tqq
 iKn/5vBbU015qbRBDJnfKk4Xid7N9p0Q6s9bbQuwqcneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KJoMxsj+K4KC2Cu3DE10bKq9RjxkC3kLFuGoN5vMga5gdYAZ0AFCX15MQuF/
 RvFtjV4LJTfUmBZ37Us2FzyJj0N05DVCuuUwwHoIiYwjJWlHd2ww8Rw9EehG4J8NY4R4Nf7+
 rJP6x0nPVFT9MQb6h6GOAdKPHHQVDlUFbJKiafMF7nHKYINzbErIP2+qw84KWwdJkB3PIJ6e
 P8uZNjxBoPkm7VeL2zNcdwg2HwqU2GLEfQ49Ab4YRlsbvhQ7euOTGfSTkV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="asc'?scan'208,217";a="74262279"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFYqFaYC0GlmsSj+lsaEh5rc5pFx2V4n/u5d9UJtI3cTGnBimWRl+GxR64lf9LLOACbWCtzpnUFUtbga2/c6mhgwfZ+7IrD1Ew+AjM0h5enoIjcDNAN8HN8dRXMGYJjon84F+BGD0XP7VlFJTENwpyMaplrrCqThK8yZyq8+UnjbaVuAWFp+uCQJ5AutOSFZjreQ40a4elfK8INfGYzxNUOoLb1M9Ufkj+YJ8UcyhRQIvm9GZCAbwI91cT4uI4mW1leLg2LUPVk/qZVMqh4dEuNyl9QjNCIaf/9mJMpNrHV1zTNaD/Rvf8bK9A8GWgUz8lutIl7MhAwbJWQL9tjHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zhEXelUsWthDYo+ZiKHfkVi4ABIVMevjWQBIFBuhVo=;
 b=BB+NVe3Zm5+eZPRKKYuhwXgnag02rbXoPZ8u4oPRXiJVOy3tMVqJiVpL5fq1tMBgUDt3KFvixhxD7+pOM+Tf3d+GYNvTiS7xCh7g+7VqpZZNE4nADlw8nmUeca9cQwa6agw1curM3jv8KwLDqMBAqhVRk/v4BSmPNfK3wSix+3ydqZNMhEmpmMmbQnWJPZ7Db+lEESjFcSp6sHHJ4c2jxZu34szNSyoWX3QJYBX0qw8ong2fP38Jrt3/809TjFAWnsgVKIEISapjJyLvf649FAbBA1/qvrOqDiYcesgEoLc4H57cUf97yg8I6K4QRt+UgHiIXWHW9HHmpDMukrVx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zhEXelUsWthDYo+ZiKHfkVi4ABIVMevjWQBIFBuhVo=;
 b=pNrz4++iC3Wu7APNGLWJRaR93Z1jmYiVa2VUGrYgEDRDTp1KaBreMtly5QdYTh6QXX6o94/UIW3LiaJVrEq1uJYAjBVKJDoQJvHpVP0dHjB2MJZ/fPRFMKul4ct0RR/SOHyCmxrPUNjWN4FkW8o5hvgb9Jsj7pCGs7hCddFm5QA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel de
 Graaf <dgdegra@tycho.nsa.gov>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] MAINTAINERS: drop XSM maintainer
Thread-Topic: [PATCH] MAINTAINERS: drop XSM maintainer
Thread-Index: AQHYfBZAWPNhrlbPskGUL/+6B0hJq61csbAAgAAlLIA=
Date: Thu, 23 Jun 2022 09:56:34 +0000
Message-ID: <DE900420-7474-45AC-B363-519D1D51020A@citrix.com>
References: <baa7d303-1fcc-cd59-0872-a930ea43734d@suse.com>
 <16b02586-43a5-0f67-5479-1d7b77aa892e@suse.com>
In-Reply-To: <16b02586-43a5-0f67-5479-1d7b77aa892e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68065955-defe-45b2-7bb4-08da54fea7f0
x-ms-traffictypediagnostic: MN2PR03MB5375:EE_
x-microsoft-antispam-prvs:
 <MN2PR03MB5375D90F5F2B956888BFA02499B59@MN2PR03MB5375.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pAS6aWbHxBqmCSmW6YgdOFqK1MuCCeAJeESbsXaPKhvEYOUeDqN2TPC308684puYROxBVTeN50Xil8iwmEe6iH+FB4Vw6lgCNAJZh4pRMbxTfbT7aztc3YD36tgO+/tS7QFn95Dwt10QKFGdRv8jlw3UNRg+OgOjD96xNQfggmWrT5u/KoUbqzAHVJxdJcrQOMx1ZIccdTURBg7hyw8r3ldzxjreC/uqGGqm+i05D+9qpjSfvnKNhySFMxITuqEgxuc5bJM57MNbKspipMZd2M4vrCydgNeWbxPh8U2P1tG5CDkYXuPyq3NiIR/swByTXEyQu47jvo/TwczCJR0zEKO4WywMPSkNUfFAcbA0AK3ucPVbshfKEpE8kiam1S77G2Qv3e6aKTS9Ld+QcCjCyFS30dJOLuPbvdDlohsyZdt7bCcZdkXQm44AtcmlSLjiFDjMk56d0GL78FOz8z2g7a45gFp0NDBlPRB5G5HjIzApYHuzXSIF181RYWCe+Q0mQd0RnWdShq2eSkpIiS/oJ4DJRjZsH1m+BP4lGGm03PxhH351TuFG2fJ4p/ZJDpBWcUkHkCcgchy+MZNPguNLkekfCCScn11RO7LrDIdFEnaUs9IFburKX4RY5JGg9gcka+HG+nCdENOdNsOt7B0R0oL3T51Ru43te/qBK8lvJN++xoDvq+R38aQXWKfcoLR7jKcYcBsjw2TAuCGLL0bTMIeuniwYkyhJO0zxkmp0UxiY4fbsKEkpOJMyuNr3756U7hrrVfd/7vwVccDV7qZDOrZlSVvryY/eO/psITU8S1c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(6506007)(41300700001)(2616005)(186003)(82960400001)(99936003)(26005)(53546011)(38100700002)(6512007)(122000001)(83380400001)(33656002)(8936002)(8676002)(36756003)(2906002)(71200400001)(6916009)(316002)(54906003)(66556008)(64756008)(66476007)(76116006)(86362001)(66946007)(4326008)(5660300002)(6486002)(91956017)(66446008)(38070700005)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlFEVXNZRWRPSTk5NGVrQmR3dEJXZjcwRm9wUnlKR1hFYml2THJBYm9UR1dy?=
 =?utf-8?B?RXlFbnVzSjIwMGJWL0J5TUluZThCQk9jRjRkTU1QT3dTb3pjQ2xQenhPTUtl?=
 =?utf-8?B?NTg0dzI3aHJFa2hrcWJuc292cWVOdllwQmJocytQRytKS245Z2V4MStQNVZt?=
 =?utf-8?B?c0RacGgyOXptOCt0dGNqZkJUYUh3MVNNR25xUTJGNDBNOW91SUhnRGVQSlVi?=
 =?utf-8?B?UkpNV24rMnVMRlBNdzFMcjlhU0w3N3ZudXltNHNIcWpuTFJvY1R0OGR1ejdj?=
 =?utf-8?B?SENMbVhDWFV2S1FWdHRzREhieWJQbWsxN2FQSjF5MlBCTWNIdkI0ZVhCV1BG?=
 =?utf-8?B?TTRibWIwV3JmemF2c2ZNMDhsZXJLeFJhWnd3YUhhckE3TjdrMGJ2QlpLNmFI?=
 =?utf-8?B?cDAyNWJMMjBKNWpKcUh0RU9tMzBxaGQ4R0lWc3lxa0ZxMXZuWC9mL2FvZEhm?=
 =?utf-8?B?YkxNYldYWGE3M0FVQlRqT3lyMHpLcGVvY1g1UUloekt1U1h4c3pqa0NWVTEx?=
 =?utf-8?B?dS9UTkJweDZiU0ovZzM4cW52TGtsbFBmeWVvbVpST2t4T1gyOXFuT1JUVmVX?=
 =?utf-8?B?dGRabjBwUnVoNHh1NkVWYzVTQzRaNGFwWDI3RzVNRzU3dmt0VTZ1OUdlSS9s?=
 =?utf-8?B?SVdCemtvcEp2RFVkT1YzUHJHODRhZTRCcndnS253SksxeHErRERVSFdPUGk4?=
 =?utf-8?B?NUticmR2WDJpYzFoVU5YL2pHUzQ1Ri9GODhXSmNuSUxUdGdtanFZTVJOd0VR?=
 =?utf-8?B?NTdpZTI2amJnQkNSQmk4SHA0Sm9NUWZrUG0wenlIaG5VOG04RTNnZVNvNVhC?=
 =?utf-8?B?WEU0WVdxV21Zd1VESENrc3NzZEtrWmtrQjlJME5COGpMd1JYR0FDMENIY25E?=
 =?utf-8?B?d3JGai9CaVl2TGpsR1pvTDBhNnZOc0ZPVXFLRElYRzlTeTg1RGlRTHlSd2pH?=
 =?utf-8?B?M25WS3hubUQ0WDB2WmFtcXd6TVVkdEZNZ3NCTmNRNm8zTGRha0FDS1hxalpJ?=
 =?utf-8?B?TW83RTd6d0RqOGV2eFY4TjFkeFZTVmlFTXQ4bFRxSmNvRlJtQ1kxTVhQd2Vv?=
 =?utf-8?B?Z2MvSzV0Wk1JbDFGdXIra1FCZjVtQWsybEt6aWJDZ05ITStOcUdoQ3NndFl5?=
 =?utf-8?B?T0VnQlNmTDBrbXArUkpKSE55b1BJdUVLVm9wZ1hWR0dDZkwzcFdvb2tDY0Rq?=
 =?utf-8?B?aituKzFKTXArVm1PVS9mRWJUNHJzMWo2OHlvRjBkUjNRUk5iZGtzdWxRZnpl?=
 =?utf-8?B?RzcwUC94ejFIV3ZvUUVZOXFPZGlNbnhLbFhZQlNOb29jU21wNVRxYmRpa2g1?=
 =?utf-8?B?d3ZEVnU4bm5uOVV4Z1A1eSs5bFptZWkydkxCL3JXY0c4ZHN6WnZvNmJUZGpH?=
 =?utf-8?B?eVJPdG12R2xDM1BXaGNIREVoYjFpaWROeFprbTNtRVpIRzFEait5eWUwcTA2?=
 =?utf-8?B?MU0rQ2pkYi9ETnNLQVdzK3hMQUY4MUNHdEgvRGpMaUtaS2p2MlVJayszWlkw?=
 =?utf-8?B?eERSK0ZJZzJjZC83Zk1ZbGZJdVBlRHRuY3F4YW9iM3ZuQzh0NGlGSEVuS0xn?=
 =?utf-8?B?Nk9GeW1TRE91Zm84dHZDeS8zZDR4OU9aSi9OQ1Q5bU1yM0hsTU1lSkk0dTZz?=
 =?utf-8?B?Y3NvbU9zZG1pcnpwODRRYS9aYVdsOHM2UDNmelQxRHpad2Vna3Q4L2UxUFBP?=
 =?utf-8?B?bUE3dXhsaW1aK1NhU3dBODM5bVFMNi9pa0pVRDk2RUpIZktZOVBrSEhRYjlV?=
 =?utf-8?B?dG0vV3NMc1lqVm1wRDdDLy9wVVNkZ1FPVS9xUlZiUmdCbEhaU3hLOXRaWk1w?=
 =?utf-8?B?M0FyY3BzZEVDSjAvOWViS3lsQXFncG16RnlKUGRoTWdTaEdaNEg2L3drc2VZ?=
 =?utf-8?B?akVHNFQ2UHZ2UW84Y1ErTDYxMzVaTGE1NEpDQUpvWDBaQ0UxQUJqSWhuL0Jk?=
 =?utf-8?B?UXFUSjhETTFDZmlNSzBrQXptdFh6RTVMS3hYZ09uTXBkTExHMFljZU0xajNi?=
 =?utf-8?B?ZC9heVFkMXhZaFNsQ2FsU2Q0VFFYRUFiZ1M2SDM5eFI5MlR4cHl4RWVBL2t2?=
 =?utf-8?B?bWxXcUEzWXVTVkp3R3BFYi9WQnNMR013ZDNwd0hXUjRMMEdEaFZPTWtqQloy?=
 =?utf-8?B?LzFRMGZVTVF5VDdxMHZJNXhnM3QwbFpOVFJQVkhCU0xVYjlObER2Z2gvanRu?=
 =?utf-8?B?amc9PQ==?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_16464673-E05F-4B3D-B777-EAE887EA61DF";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68065955-defe-45b2-7bb4-08da54fea7f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 09:56:34.2171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lL/AS5pOwVgn7HigF3X3omOerh82NPw/0hD9YtkNSg5ydhk1vpcPVJ9zbbi9yvMO61FBuAkyQ/FUO87JbrNIfKk+AmmdtRyFPKoloz7uDvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5375

--Apple-Mail=_16464673-E05F-4B3D-B777-EAE887EA61DF
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B412ABD9-1F1F-43CA-9B13-A74C3DDDDDEA"


--Apple-Mail=_B412ABD9-1F1F-43CA-9B13-A74C3DDDDDEA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 23 Jun 2022, at 08:43, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.06.2022 17:33, Jan Beulich wrote:
>> While mail hasn't been bouncing, Daniel has not been responding to =
patch
>> submissions or otherwise interacting with the community for several
>> years. Move maintainership to THE REST in kind of an unusual way, =
with
>> the goal to avoid
>> - orphaning the component,
>> - repeating all THE REST members here,
>> - removing the entry altogether.
>>=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> We hope this to be transient, with a new maintainer to be established
>> rather sooner than later.
>>=20
>> I realize the way I'm expressing this may upset =
scripts/*_maintainer*.pl,
>> so I'd welcome any better alternative suggestion.
>=20
> Two weeks have passed. May I ask for an ack so this can go in?

I=E2=80=99m happy to give you my Ack re the maintainership change, but =
I=E2=80=99m not qualified to comment on whether it will screw up the =
get_maintainer script.  Perhaps it would be better to send a v2 patch, =
proposing Daniel Smith as a replacement, to avoid the question of the =
script entirely.

Acked-by: George Dunlap <george.dunlap@citrix.com =
<mailto:george.dunlap@citrix.com>> # Removing old maintainer

 -George


--Apple-Mail=_B412ABD9-1F1F-43CA-9B13-A74C3DDDDDEA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 23 Jun 2022, at 08:43, Jan Beulich &lt;<a =
href=3D"mailto:jbeulich@suse.com" class=3D"">jbeulich@suse.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 09.06.2022 17:33, Jan Beulich wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: JetBrainsMonoRoman-Thin; font-size: 14px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">While =
mail hasn't been bouncing, Daniel has not been responding to patch<br =
class=3D"">submissions or otherwise interacting with the community for =
several<br class=3D"">years. Move maintainership to THE REST in kind of =
an unusual way, with<br class=3D"">the goal to avoid<br class=3D"">- =
orphaning the component,<br class=3D"">- repeating all THE REST members =
here,<br class=3D"">- removing the entry altogether.<br class=3D""><br =
class=3D"">Signed-off-by: Jan Beulich &lt;<a =
href=3D"mailto:jbeulich@suse.com" class=3D"">jbeulich@suse.com</a>&gt;<br =
class=3D"">---<br class=3D"">We hope this to be transient, with a new =
maintainer to be established<br class=3D"">rather sooner than later.<br =
class=3D""><br class=3D"">I realize the way I'm expressing this may =
upset scripts/*_maintainer*.pl,<br class=3D"">so I'd welcome any better =
alternative suggestion.<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: JetBrainsMonoRoman-Thin; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Two weeks have passed. May I ask for an ack so this can go =
in?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
JetBrainsMonoRoman-Thin; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>I=E2=80=99m happy to give you my Ack re the =
maintainership change, but I=E2=80=99m not qualified to comment on =
whether it will screw up the get_maintainer script. &nbsp;Perhaps it =
would be better to send a v2 patch, proposing Daniel Smith as a =
replacement, to avoid the question of the script entirely.</div><div><br =
class=3D""></div><div>Acked-by: George Dunlap &lt;<a =
href=3D"mailto:george.dunlap@citrix.com" =
class=3D"">george.dunlap@citrix.com</a>&gt; # Removing old =
maintainer</div><div><br =
class=3D""></div><div>&nbsp;-George</div></div><br =
class=3D""></body></html>=

--Apple-Mail=_B412ABD9-1F1F-43CA-9B13-A74C3DDDDDEA--

--Apple-Mail=_16464673-E05F-4B3D-B777-EAE887EA61DF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmK0ONEACgkQshXHp8eE
G+2ltggAtzKNPJPMyD31fcj00V6tdpmsd6F7Ubddkx0/FeBm3zy3u75KzZTfEP/6
Cn6lFPrMNkpnslbmazn8aV3drnMN+IlCsfjyEP0kSqaCu9Gy9XHtnoAP4UCowWo5
V92ERDmDDuVqwWHQkA0mpSRNFb8lcGeoqNqi7dT3QqYm9DBMIrAlGjXvtYkES23i
KUEVP6+ZSHZg98Ib+X5leVV45UySYMX0PHBynVvLggzAFO0ij3La1Gn+cKQydIa7
H2FpMKA8crWfBkZ0PI03fuBELbIVjcGcOrDnYV4lD7hHecDz+r/fSMSPPTo197Hx
STkd4sYiIVrmqdzydJu36dHcqIBGtw==
=S2A2
-----END PGP SIGNATURE-----

--Apple-Mail=_16464673-E05F-4B3D-B777-EAE887EA61DF--

