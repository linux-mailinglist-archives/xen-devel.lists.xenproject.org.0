Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7317E4923C3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 11:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258429.445029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lmO-00065c-1C; Tue, 18 Jan 2022 10:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258429.445029; Tue, 18 Jan 2022 10:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9lmN-00063F-TR; Tue, 18 Jan 2022 10:31:55 +0000
Received: by outflank-mailman (input) for mailman id 258429;
 Tue, 18 Jan 2022 10:31:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pp88=SC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9lmM-000639-9G
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 10:31:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d10df90b-7849-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 11:31:52 +0100 (CET)
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
X-Inumbo-ID: d10df90b-7849-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642501912;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GWqqN1sIHcAORxE6g2na17l0tNHcvpFgdP7GxxxROoY=;
  b=gmqgd6wz6ZBPZgSwEOsnGruK5lzdmVtYcxx5HxJENSrG5J09mRLU1F3G
   0IffTSqMdcmaMdWC9kTvTBIuBKxNjXnIJc09R+dMDRUiOiq5OJyrex+UE
   ySkMbdgAFjfZG4jn+KcgARwIvwRGej8MacTkak1qXmbvZmMuoH+lu/0zx
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: r1MxCONqFcHnxo4ge2TbCxQlpT6zWyGkbGSpO/ukOr+83051aD6NM1IIIfVISkJ8/k+ot2ltLw
 6ANQJbsJ2wFUgWvFipBONh3pSe6mjp4rZlw6y9weZ+037VZjjpy9+qf7nu9o7STj2xBd7pOL86
 5Vea3UzlS+sNBZ577eqgiv2PhkUvctisQVTXVyxJjFE3YJ8ZVHqHgLDZnLOT+zf3igTiQ6CQ3b
 t0tYi3YdeCyYl07RZesIiI4udVK6GpKAR/+X6XJyyqbtMy2U8NQrPo5CYuhuQCpDWeLIgVZfZy
 n+eDMBOw0685KvNqYUCwEuzv
X-SBRS: 5.2
X-MesageID: 62208202
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KhMbe6rCwhdcRaBWo9ulqx29KAteBmL5YhIvgKrLsJaIsI4StFCzt
 garIBmBP/7cZGX0eNogPonn9U5T7JfUytA3HFQ6/ns1Fn8S+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IHpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaCRUggGMoPDpO8+CyJ2KQV4JJJq26CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4UR66OP
 ZJDAdZpREjCXRhEHGclNJJgzMWhpVukVwxZh03A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0Z/tLHMI2xg6xwYmM2CijIm4dcRJid4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 idsdy+2trFmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifhs1bpdaJWSzP
 Sc/XD+9ArcJYxNGioctMuqM5zkCl/C8RbwJqNiJBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6NGfjTkkr2uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidilkVcuo+p0OJoZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHAf6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:DWOqRaj3E8lZ6bQtq91wlS567XBQX0B13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKOzOWxFdATbsSl7cKpgeAJ8SQzJ856U
 4NSdkbNDS0NykEsS+Y2njJLz9D+qj+zEnAv463pB0BPGIaCZ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqL+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+memsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lodFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNyN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wuJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tAB2nhkjizypSKeGXLzYO9k/seDlGhiXV6UkYoJlB9TpZ+CRF9U1wsK7USPF/lp
 L52+pT5fZzp/QtHNBA7dE6MLyK41z2MGHx2V2pUCHa/YE8SjrwQs3Mkf4IDN/DQu198HJ1ou
 WGbG9l
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62208202"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXXhzDQ/t1kI4nyZYT4z4N4/cGykZSHZs+I0Yg126S+B5yZFEGTUVrTD37cxhOT7KjpTnV5qepA5yehPKTVnT8BkjJK6Uhgxz4K8lsqP7ndjTNTltMd7lpSSrgBcY8BQRHGutsggi2wuHlhmxrsL0ruGRlCcvuIrie4g9xtWLeWYhQnmXcwKO1sEXHnOBjVaw9+n3JRVEuavDVEvaKtjLIIPpVdduiQ++Pb5G9IU4QNIpvuDuL6Gj5qOgnlayG8b3TR3AGNFJ00jLfNwEkQC6nA9fXz4glzbiDpc5a28jm8BiTJ2ZRp77Ko+xXEIBvRz5pdST5Ov6kD1m6TxoOHhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU+QjsQJ+kqVNabDdctrPGwhPgWnfwdES/6YbjcWp+M=;
 b=gBPVmTVq7ZxZv3Ft/5Zgf9/qjPKX9C9dLzAzDl8yF13eXYOA5QSlbT2uMzZzAOCM4PwvNrh0Ed9K8EQIPAVsNSefOoRJ384bD+gFPMKRE/swY763uv7+ioi9hRcBd84/d0TbLKnCwtkcIoX0zCYJeLV+MQ13nJg6qQOYew8uLVZaWykLvy2/7KIDaYbWNgyn15JRFP+IVhQjvKNA8kuvvYaYmnRVpAkqlBfN32ZL3FVim6LcNFfzneGG+8i40+I4rpxSh5JsfHYzVh/7vGIYRmyW3scQitMOqFjRy9izcbzMGkm3sVMOOPKt25kvUZykegTl4u92Iw5Tt2ZGVY1p7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU+QjsQJ+kqVNabDdctrPGwhPgWnfwdES/6YbjcWp+M=;
 b=oBAGiAZuMZnsPPxo9sMNWUT0WcdrOZHflAq9IhsriQ5O4ERyU2CybQr24KgZBfrcfgUYYmGhi/mlKJmGc6Nwo4FKjTCX7QLs9+0cEelJ6zmmRjrM3a3l2135grevNa2VlEevZXk7deoVIKN8YrJ1UmFyIlOb/LFQERX+/ea418g=
Date: Tue, 18 Jan 2022 11:31:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/5] x86/mwait-idle: add Icelake-D support
Message-ID: <YeaW5qoXahwHTrV2@Air-de-Roger>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
 <f18d6203-7cde-40be-e645-f5460259c416@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f18d6203-7cde-40be-e645-f5460259c416@suse.com>
X-ClientProxiedBy: MR2P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce98448e-2978-4015-a375-08d9da6da3b3
X-MS-TrafficTypeDiagnostic: BYAPR03MB4406:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4406C946DA5482AB2E4B8DB48F589@BYAPR03MB4406.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XB6YCGUWT+9rTC7s4bK1isNI/Ep4MUKoHouYq/hKo+tBKtBIKOFOq3Phl5CmldFUIkducAYGu7yZMdbXu2J+RtD1P0UI9/CdpYgiUKSv9fsQ8QngLshzZ22F/O0DQmScaai0/vfkf0QH0z7LBF2opo6Bha3RG1U3DX5facCAOS7I4/RHzKonoQUhCSJ+Kf5M6J2bpERCeiKM5hCmFY2XmzMef4ZL44aGe3hrq6/VzfVidIQeqyxjVm0FgD91fdN60qqDDqLO3+VXpWQTf2/rhmoomJBuBfyb3urWCmVEU6CvCljfsLmtL8pnje4BGlEIOd3rLuVgHdKPCd+uixonZPEhz0qD1tJc6X/5SV9wamkrMbTxNJGDBpSQcnQcl2yvLaUbDnnqaG0++wUIQe0zIbCOs6IZByZTXyW4cWWvarZCfauEgHlY1np9y9+COC6MwcIiC5HH2KljF5M34kkGAqp9pIgkitcVt6vsKDLZJ9C83Ocg2CvDKKFLirnfTTr/hl82wtsIad6lb/zaTs1GV0TdGxBE3TsmqDt25zADSEJ1hf/QafHSFrOcARSzyGyBVk97OM9i3DwJD/hwXnqMYOQgpfsjHRS0D1raewdN79PcVEb7JUprf6TRp89bcMekfeJOU4nE2JHmFF8t+TBxhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(33716001)(6666004)(5660300002)(38100700002)(508600001)(6916009)(66556008)(66476007)(86362001)(186003)(26005)(2906002)(82960400001)(85182001)(6512007)(9686003)(316002)(4744005)(4326008)(8676002)(8936002)(6506007)(66946007)(6486002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWF1cVNVT1JVdlJ4SVZuYXB6WDRvU2NpOTJqK3EvNnY3WU1HUzBERGdaVXZE?=
 =?utf-8?B?M2dOOHhNRUZWMHV5dWpZa0xzT3c2YUxGekRBL3NHeUtOTExhdXZTUElmN0Q5?=
 =?utf-8?B?aFdKZU0vNE8yakdhK2Z5YXNIbEkxMTlMT2VvTi9ERkZlRkdoNVgrQitVZmg2?=
 =?utf-8?B?OHUyK1dHQjlheE0yemtoQlNyWHgwYjR0N2hwQk9jZXFaQ3A0ZDZPc01VUC9j?=
 =?utf-8?B?WGR4MEl5UnVyeHd0Mlhjb0hHdHI2akhEWUJXRlkxZjZiZHJvU0I1L0JSbWJo?=
 =?utf-8?B?Y2w4YlcrQjl6b0huYzZlVjR0RUEveVNzQmhIRmE5bXdNaU5BOWMrelp0Y25F?=
 =?utf-8?B?OVVOeU1lUmdOV2psU2lCZ0RSNEhVZEt1QW5uNHc3MWFLVnJPZFFjNzJ1VTdK?=
 =?utf-8?B?OFdLMnp4eDhXdVpHaW9kRXk1bTdHZFVabnNzOHhZWVR5RXdBdGZhcHZxcTNR?=
 =?utf-8?B?YnhwZXBzeWplSW55UWFiRkxHUlQ0RVBlcmo4TlA1RGtuTTdYQUMydGRxUm9i?=
 =?utf-8?B?UkdRci9XS2c2VStSZHRiWEJmOXFTZGtuV2Rncm9CM2xGNlhja05GWFh0bFBP?=
 =?utf-8?B?NW9WY2luUHlzZ0xoY0hBZ1I0SUxhL3p5SlByeHM1RUR5N3U5Qmc5N24wVU1W?=
 =?utf-8?B?YXh6UG9KTTVPekVjbVdlNndFV0QwUUd1YWtOT0FpL2FVUGExMDB0ejBGQ2dG?=
 =?utf-8?B?aHhYbFZJdjhKRDFqVlY5bmduOVIxMkg5VkhrUy9tK0RxeU5aVC9sM1pMT1Uz?=
 =?utf-8?B?ODVQTlg0c0FRZWtHSlc4WUJ1THJVR3dxSm5Ud1lUTlIwZzFqTGMzOU9mR0lN?=
 =?utf-8?B?Z1Zsc0tzUEVHTnlVc3ZHK0hJbTJ1VTUxZGFWSmFja1VQWGR6REFYUjR0SDBE?=
 =?utf-8?B?eXNhZzZhdlUrMVQ2MmplSzF3ZnBCYlVLYXE3YWpaQWJ4bzV3WFcxUmZpRGRz?=
 =?utf-8?B?OFlQRUFPMzhXVlloeThSSHVackRWQjY0WXFSaGE1N3UvYk9IOVo4ZnZBaTF2?=
 =?utf-8?B?VU5jSjh1RXNPNWM4S1kxREQ5Tk9sWDhYdzI4eXZBQWlaRGJRV0xZb3MzZGNz?=
 =?utf-8?B?RFh3VWJhVE0xUlF1RHF6ZDRLZTFuV1RBR2FPaXFUbHAwVG1mZGlRL3pVVHlo?=
 =?utf-8?B?Q1Fyalo3R1ozYVN4Wm4ySXFxMjkwTXA2RXZyRDZObm0yaU9qckZiMFBVNUxQ?=
 =?utf-8?B?TktadEN1eVdaOWVWNWxkcldaV0NNTHlxYzlrNGlTdERnOXc3ZFlvOVJ6d3hD?=
 =?utf-8?B?eEdmKzBxcUgzTjZiZ3lPeVRQQ1c1Q0NGcDlNVFNnL3M0RklNeTBtTkYwckpt?=
 =?utf-8?B?ZFBPWk5xWTNNb05BeVJMeTNwWmF6Qmt2UW83M01hVHJqTkdMQm5Yck5NNU9t?=
 =?utf-8?B?SHVpZ1BQdUtJR0JxRUQ0Q2xlL0RwbTJ3RTFUbHZHMkdlQXQ5bk1nSmdYT3Q5?=
 =?utf-8?B?UUFFQnNKNGlFdnptZFMreU4wUlRDUGxJTWF2NDBsYU1iRGRtTy92YWo1M3BG?=
 =?utf-8?B?OTFLSmppbkFhZnl3RXdyUS95dlhKd0NWdjF5dXdKcHJHTlRtVmhPemJaUktG?=
 =?utf-8?B?TnpqRFd1TFNUeDRVb3hvM1YvTEVJMnBMTDJDdnNXYmN5UC9lS3FFU3NaQlUv?=
 =?utf-8?B?UElxMTZPWm1YMTVRdmw1SU8xcmNrcmZpeTFDUzdheE9OZ25zTU1PVEJQRmtn?=
 =?utf-8?B?L21PeVdHTmlJbmNqVEFNSlFaK1E5NlZXSDEwSXF6eFZUSldqMjVqY1Q1UmNV?=
 =?utf-8?B?M2Ftd2lKS2w5ZlVHenNBZFpmM3p1Y0FpbGdRdGRaKy9IdmxkZ3BNTkIzWWxj?=
 =?utf-8?B?eHFabEZhRzI5VlpJeHI1OThzTzFnTzNOQ1Nod1o3clc3RHphVGdOK2I5WGpr?=
 =?utf-8?B?aEVlQ1VydjFFWG9DT05yS1p4VXVVbXFZQ0ZVSVF4SnQ5T2ViQmN1ZmNlMm9Q?=
 =?utf-8?B?WktaVSszZVc4UExaV0RtN0c4YXpoR2NOd2JHYTg2U1dBaVREejdNZG93Mmlm?=
 =?utf-8?B?MEFaNE9oOVlsUytVelBrempIYm9tS3B4NXVvT3hKeVhSVXR1NXJEZ0kvd3kr?=
 =?utf-8?B?N1FpZlFwVENoTTAyTmZtYW1Jb1lPb2hsbktVV1FwcUR6MGVoMS96N1NoUGVH?=
 =?utf-8?B?dVZ1T1BsamhOT3A5QzhpZStHY2JsNmJRbktSTUdBTy93aUVRQUhkakcrVmJV?=
 =?utf-8?Q?XuV1wvDKQk7ln3x8g6yG4r0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce98448e-2978-4015-a375-08d9da6da3b3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:31:08.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcLD6Fyrj+u4SLyZqewgIDmjoXXDWC46uYEGLfwrrABsjT8z1N7uUB2J6OVwdv/hZWhVNbUttdyRb3Eu0TcW7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4406
X-OriginatorOrg: citrix.com

On Mon, Sep 06, 2021 at 03:01:46PM +0200, Jan Beulich wrote:
> This patch adds Icelake Xeon D support to the intel_idle driver.
> 
> Since Icelake D and Icelake SP C-state characteristics the same,
> we use Icelake SP C-states table for Icelake D as well.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Acked-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> [Linux commit: 22141d5f411895bb1b0df2a6b05f702e11e63918]
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

