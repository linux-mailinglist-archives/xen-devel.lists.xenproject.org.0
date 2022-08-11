Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F158FAB0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384388.619755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5T0-00039Y-GK; Thu, 11 Aug 2022 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384388.619755; Thu, 11 Aug 2022 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5T0-00036g-Cz; Thu, 11 Aug 2022 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 384388;
 Thu, 11 Aug 2022 10:31:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XZap=YP=citrix.com=prvs=215a4cc3a=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1oM5Sz-00036a-8L
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:31:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b27f9057-1960-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 12:31:03 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 06:30:53 -0400
Received: from PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9)
 by MW4PR03MB6652.namprd03.prod.outlook.com (2603:10b6:303:12f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 10:30:52 +0000
Received: from PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::98a5:50cc:d31:14b9]) by PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::98a5:50cc:d31:14b9%9]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 10:30:51 +0000
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
X-Inumbo-ID: b27f9057-1960-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660213862;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M3co+S1ehLVNxkOAQf133B931JRCaze/VleNV4MaHGo=;
  b=dAr9u7oZfIiPQO1yOKIEUVNc9NKTU3ufwN9m2M8r7pF4izqIk+datMaX
   8Xl1gNkPB2pEtTxHln4XLcek/vkZjmtXl5COck8DQLcUvob24k1YKVzjx
   MS1gacJswMLlyMWqfiXXxGM7RKjuu0jDQo1QKSeah03pTmDaSIwoFNhl8
   0=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 80414715
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:N/+lnajPbj+vStI8aLlduuNXX161eREKZh0ujC45NGQN5FlHY01je
 htvCG6APP2La2D8L9F2aN+2o0pTu8DWnNQwGgRrryBjQyob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSr4WtB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eLNwRvcp7OGJ00
 NczK29QSimKpO2w+efuIgVsrpxLwMjDGqo64ykl4RSHSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF+BTM/ftfD2v7lWSd1JD3N8HOPNiDSshPgU+co
 krN/njjAwFcP9uaodaA2iL02raTwnqmMG4UPOCa6fRF3GSe/E4wS0EnBVurh76011HrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+pQSiaPCEUKSoOYHECRA5cu937+thr31TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:3utMP6/KCH4KFBWQi/9uk+F0db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WB3B8buYOCGghrjEGgG1+ffKlLbakrDH4JmtJ
 uINpIOcOEYbmIKwfoSgjPIderIqePvmM/HuQ6d9QYVcegAUdAD0+4NMHf+LqQAfngiOXNWLv
 qhz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYpoLSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzRfBky/JlagkEuDzYJriJaIfy+QzdZ9vfrGrCpe
 O84CvI+f4DrE85MFvF5ycFkDOQrQrGo0WStWNwx0GT7vARDQhKdfaoie9iA2Tkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0DMfeMMo/gtiuLElGclshJ1a+FkQHIYLHSr85oxiGO
 5yDNvE7PITdV+BdXjWsmRm3dTpBx0Ib1y7a1lHvtbQ3yldnXh/wUddzMsDnm0Y/JZ4T5Vf/e
 zLPqlhibkLRM4LaqB2AvsHXKKMeyTwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvY5AMxItaou
 W0bLqZjx9GR6vDM7z/4HQQyGG9fIyUZ0Wf9uhOo55kp7b7WL3ndSWeVVFGqbrTn8ki
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="80414715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgXJORtp8fd7ebd+q4o06lDCqA8bLy3IV9J2mUzPi8qpcVdjD6w7LF2X1kxbqrJmVcZ3UJLKfxAJTKxAStGd0ZVL04ATSr2i7P96ktmQbsBiMrlT4i5HLGYX5rVKQn9D6TzZ3KeN3D9SVq3QmHNrwTPZ0vMNAvrdU+5PI6nZjl04d0YhhEEG1N8MmE7EOyt+bRUPP1hiE1A8F7E9cVj3edmSxZuBPfnIN7tTYXEURfBFOlCNQWBdHHbOK9GGS1CjsNtrnq6gUmZOFfji3/91Txd037mccLaSCZmzwe6BSqiXgZ2dYaATNS8cmTU+hC8K0620wxdpi87wvNRvEWX/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49zEQII0C4FjJK3N7Z2fU9ccabXmk65bybIOH6uoXrM=;
 b=Xa0tIwRF66S3rFn41kh1Srj8uN5v1CfHVwuK+CEMPFsqggt53h7YLeVZtCd0PdK2E10t8NdeAA9/Nx5bNe6lQ5ZVOrN5CZZ9N2FmmilLgrHd7eZ3Y2/UMFImrf8lZtqTx+Kt4ADcMOcsgjJsYeOdUmsYAS8gc9ew8YPbxxNfz+mj8tRwjm0kpwRsib90Xx7xot4ek0qlo9qtxT1b8mIY1rlc7ppaOKRrpmGJogZyLxBEWbWVxZAoZUrqK1FVpIg+cmkgtfkCY1sqofs2Aw6GgzthJgCgZUkBtk04dJ1dv7NmXC1ivbCh/Em4GxQWHFc6RjEjZF78dSAPNbGvIbftfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49zEQII0C4FjJK3N7Z2fU9ccabXmk65bybIOH6uoXrM=;
 b=GzrpklQTx3e5WoRxfGV2rLL6sM3vI89XiS/DcmXbAYvYUWz457IMEYXeCixm2dmFAN/53ZI5noz7t2BPilP1Wk+jYl55oVv++QuAGp0s56ZK2cnayiG7SGgPa9/IKphFUaxuF2uidAUwApyEAdJkpiuISCmbemPZ88tb7UW10k4=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions
Thread-Topic: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions
Thread-Index: AQHYrWuqhVokOxPY3UOreWT/dXaIGK2pfX8AgAAASDA=
Date: Thu, 11 Aug 2022 10:30:51 +0000
Message-ID:
 <PH0PR03MB63827F5CFCCB8277405FD70BF0649@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220811101715.3947873-1-ross.lagerwall@citrix.com>
 <7ff6d006-0a6d-60e9-ebb7-70ad3c6d6a5b@citrix.com>
In-Reply-To: <7ff6d006-0a6d-60e9-ebb7-70ad3c6d6a5b@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bcd1f44-a1fb-4e25-17ec-08da7b849093
x-ms-traffictypediagnostic: MW4PR03MB6652:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Qye2rxD6IT+IDZNVZQivNniAuES83L9xQIbsMg3pmBoHy8lNjIfSo66g6n6TRQYYUDbrX+TtvoxFdcf36bBY6oxQ3foTafUa1z1rAifGjzEqDqJlR2WvnKpdURTl+zEg5gbyltL6ZmnjRx5CDZCeFTWi/Yl7PPChROnWUBpN5vF0kmxu2uOt8m64taeXO6yQTOS+3qCP99Hw6Axl19o9z3F6foQi5t74235jyYASqEBZ0AUqw7injO2ZfNpXip/6+YuqxWyUNo9NDVjR9mBYbd/Y4ClkXzYZI1oTnZuUKtvy72WxAEGje9r7VNK3eCRRrSrtD58/LQiqGuYxsRZT7oJ4CUksxpSxL6+peFQavwHTtrV0EJFQ0rItDtQKtpM6xX1nx5WHD1P7oPXHS0qDLurshAX8AIf9U1yx/tc9N9hO8rUM0dKbE+RZnXvUjB7QXjadHMA1KAGAv8x2XEYzqaZx8fXtC23y1tEyuRxwaxK/OJn8Q5ovmPk0zZu5t2elACAulVWSEQPE1sSgMRn+yX2saW6ZN/KvF+F9RP81lOLyxD3Id6p+d1MebT9UGm0KKZTYKJEYLtqCpB9hS+s8bIDp9DnXfyUlzmMt0hqS7vCVKTrNKC7A+93xJJF/g4M5Wg/jDpZ7uZW/f52nojF4eUWi08WmuqiEjPadI4t0sN3ivO9LhtzeORZL+1b+qPGnSSr1Rk+gMIgzzxAeXVuvhdK1DO2T0PKl3KvXFe6j8IstkRyForrjGY7kgDvGpkFmb+jfsBtClL8YWqrIafX7c6VP+ZVZeOpMqt8b+W9PEJr7Mn96z4AGjq5tdGWQQ3RZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(41300700001)(91956017)(8676002)(55016003)(2906002)(4326008)(76116006)(64756008)(66946007)(66556008)(66446008)(83380400001)(316002)(54906003)(110136005)(186003)(122000001)(38100700002)(26005)(66476007)(9686003)(82960400001)(478600001)(86362001)(8936002)(53546011)(5660300002)(38070700005)(33656002)(71200400001)(7696005)(6506007)(44832011)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wRnRdzNw8xZ/bTQuhIBaAvJoZJwqb2vl6ag/OzAd7lFZmC7nMjCr29ejSt?=
 =?iso-8859-1?Q?1aTvTxXI0CDI9OBPYBXPUlFN9q4QdusS70bh06NhGXEiJ4xrZwsIPGwCH/?=
 =?iso-8859-1?Q?W9pOKhxHbX3aUpRZCGmZ0EBp5TVqkuFrK9axUNA5+9Zr8QGwsSYgNVX05o?=
 =?iso-8859-1?Q?r/UD7C1eks0fsGILQI+Ad4g+vsquZ5XrJEwxwlCkqlWPMm5vqwYZKqsQ6H?=
 =?iso-8859-1?Q?FRpU454fgcHTPEujFIya9DnkpQCDynwtlFsf3jljR+lEdbccXu3E84bPyl?=
 =?iso-8859-1?Q?FiJau6EspLhbGPOZvARZriEPv1Da8LOdOgA0/QYfnI8HYVLQvQ67jdxYke?=
 =?iso-8859-1?Q?xsSeOZgOo1O0VB4ZAuveWpg6RUGrRcseHqmjzPAIAdBMv2APR6qPjH4RR0?=
 =?iso-8859-1?Q?Q8sdHWcmaI3C4dXRucNSCIlgRZXpV0QSugI7mGW9se1G6NRxrrddOmSeOV?=
 =?iso-8859-1?Q?GSQJnnYT9RBfWTxQAO+nHDESUSXScdkdz860nxfeQXc4z/Ur0fLiCQ7sHq?=
 =?iso-8859-1?Q?ndFA4509Ybw5qQhLSbo5+ry9qyW6gINQ4l9udaJKJAVp/YwLjpaZRTUqKq?=
 =?iso-8859-1?Q?nEdSXtEoohyfU+FlxGjXWCs7i28PF/gNqpo5IdoBh53s4JDV0FM7n4f84/?=
 =?iso-8859-1?Q?dJ4ujWUKQ5q4ZNx1HDVltBvH85gSACkd/gNrobOxL4c69LquG1NoYqDcRV?=
 =?iso-8859-1?Q?MDG86pVfL5HjIqx/in2XBcJax1HBXJdvqrP2M3MHxWxbGRYXRWfUYiinmT?=
 =?iso-8859-1?Q?/Wbz8P7vmlll3+QNKHcBKq9PU+dDgGPX/+vZsxPEIs/BbdzBF2/UiTNTrF?=
 =?iso-8859-1?Q?CQCxHNYyFNporHb8w2TB80AyBt50r/lYV0e7imMWlmjSBDsozoLeCIDnHt?=
 =?iso-8859-1?Q?BKnhISD4+BvoOO7dZCk7Ii4hzvqmv657eVtE/5SJqaLMor2yhCyl+2YXxJ?=
 =?iso-8859-1?Q?p3ZoQoUaYdHqTlfPQ5uqFpK5xGZlXI1/ENr2jbQKUy+WQa5QliJmsssQOa?=
 =?iso-8859-1?Q?kg3b6Q1JhKu7Er6VlU6CLMCENroNJF3hvoHZFYayVeIlWCG9jRNMwJKTIW?=
 =?iso-8859-1?Q?myVOrQXKRmg1bhn06lenMAQ/FPlvkWbwX6uGRYMPW9/i7GO9XAIyQKtd/b?=
 =?iso-8859-1?Q?8BBsH8NkUXoy6D3KUS22GpEs7ox+SShMgQRsmVNQoUN8YgcX3N/ruWie6h?=
 =?iso-8859-1?Q?RMLw/GUR/ckqvnky1fVngU5de4PTuckzYiVJs8UiPpdB+oaRz8L+3Meq+I?=
 =?iso-8859-1?Q?SsCEZFbnEeLNn8cY2q1hH6TxH/NXCNmG6L92mRvf22T848pBGldUaV1rz0?=
 =?iso-8859-1?Q?Qa7hSo+G4vCEz8g6jEOT5u5IJp40WQ3xEBXAA9ixms+FFT3S63T5aKmu6E?=
 =?iso-8859-1?Q?TEWyfE/QTJlPIjkXFJSUId5ntfQi6u7rPlDo6fKqYQodLiIc+tYG+fJLco?=
 =?iso-8859-1?Q?H9v/EH7vjxRa5cCuyTtZYygb0qXiZZQ3iaXtaJgltkIq3b8y6Vgb2Cd/qZ?=
 =?iso-8859-1?Q?UKFTkWehKOwsgo8+Wy9O4OJLH1X70iGCp1l2ynPHQJUmtE31ppD7IXeAHf?=
 =?iso-8859-1?Q?rto5JAiZ//yP0gmKKbIRPM6PntY4FmvpE+WTeLe3F3LKnlTR55Qc+SO1F9?=
 =?iso-8859-1?Q?JumUqrPP/KARziUuCLELt6T/HroqZY8dG5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcd1f44-a1fb-4e25-17ec-08da7b849093
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 10:30:51.7180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m2bJQ3jI9x2c4sqe1XVIncZMYJsIVdgfwKcIw57/CCL301HOMu/2Pg40ZN+BHfl2eArsEZLOBYYBGDGaycsx6GsbMQGg+iTsBvLaMiIPQNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6652

> From: Andrew Cooper <Andrew.Cooper3@citrix.com>=0A=
> Sent: Thursday, August 11, 2022 11:21 AM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>; xen-devel@lists.xenprojec=
t.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Jan Beulich <jbeulich@suse.com>; Roger Pau Monne <roger.pau@citrix.co=
m>; Wei Liu <wl@xen.org>=0A=
> Subject: Re: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions =0A=
> =A0=0A=
> On 11/08/2022 11:17, Ross Lagerwall wrote:=0A=
> > These functions may be called by init_amd() after the _init functions=
=0A=
> > have been purged during CPU hotplug or PV shim boot so drop the _init.=
=0A=
> >=0A=
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> =0A=
> Hmm.=A0 That's a bug in init_amd() I'd say.=A0 These really shouldn't be=
=0A=
> used after __init.=0A=
> =0A=
> Which path exploded specifically?=0A=
=0A=
The stack trace was:=0A=
=0A=
setup_force_cpu_cap=0A=
init_amd=0A=
identify_cpu=0A=
start_secondary=0A=
=0A=
In setup_force_cpu_cap() here:=0A=
=0A=
        /*=0A=
         * On pre-CLFLUSHOPT AMD CPUs, CLFLUSH is weakly ordered with=0A=
         * everything, including reads and writes to address, and=0A=
         * LFENCE/SFENCE instructions.=0A=
         */=0A=
        if (!cpu_has_clflushopt)=0A=
                setup_force_cpu_cap(X86_BUG_CLFLUSH_MFENCE);=0A=
=0A=
which was recently introduced by:=0A=
=0A=
commit 062868a5a8b428b85db589fa9a6d6e43969ffeb9=0A=
Author: Andrew Cooper <andrew.cooper3@citrix.com>=0A=
Date:   Thu Jun 9 14:23:07 2022 +0200=0A=
=0A=
    x86/amd: Work around CLFLUSH ordering on older parts=0A=
=0A=
=0A=
Should the fix rather be to guard that call with "if (c =3D=3D &boot_cpu_da=
ta ..." ?=0A=
=0A=
Ross=

