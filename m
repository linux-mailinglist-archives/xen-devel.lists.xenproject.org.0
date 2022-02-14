Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B974B54FC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:39:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272462.467316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdRB-0001is-UK; Mon, 14 Feb 2022 15:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272462.467316; Mon, 14 Feb 2022 15:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdRB-0001gQ-Qb; Mon, 14 Feb 2022 15:38:49 +0000
Received: by outflank-mailman (input) for mailman id 272462;
 Mon, 14 Feb 2022 15:38:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qPn=S5=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nJdRA-0001gC-Ej
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:38:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 318cb99b-8dac-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 16:38:47 +0100 (CET)
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
X-Inumbo-ID: 318cb99b-8dac-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644853126;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=3oSBNKou66fHFm8DM8EiEacYZyHygRmIblUnXFm8WaE=;
  b=KI+OOB0zrhirWX5ZochhZfOCzxi6mrWJZnaW6CMbVdJMB5I98KROqEZN
   5MQjVNaPkIvNykOtZNEoZHteePJB0EFKVBcqujt9KPolu3kbHaiiOAHPr
   /kzHzrmZTJbHLMMeOVg4gVGnRNoo6w7I98TTsOOp/iDE6QmJzPnNCFr3R
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jvKE7cPBcnscUzHn2tvOvpv0BHVOEdtT51gHUXd5LnE/w2R6b7bpTgPxSKpaGH0KDuAor+keo5
 zQmvZnV7rpCoQ+beL/xRueCy0lm0V6Dd/H6SA72gY1NXmGVbtnCMJcWhQrCOXKCbjTMGTd1P25
 bHjVvDljJ9tn6JbjjeEme05pe6Em7+aGr+Wi84zOIDWQC0YmWareqflPOUBe7KBcyyEYeThSil
 vYLnImcGjyC2j5KvDSMOnWzooGGs2jMWOPODR14PXQAfw/3NDc/fttyzJV8WMnjG3Po+H4o3Yl
 NYt+M87bE/AE9/stVsM3wGIP
X-SBRS: 5.1
X-MesageID: 63607896
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iEVuF6NtFDCvvWfvrR2xkcFynXyQoLVcMsEvi/8bNLWB5Y4Qp3Zem
 TxOHSzEb+HbITHFz+oGPoy/oB4GvZWAyoBrS1Bp/n02Fnwb9sDJXt3Fdh2rYH/IcJTKEEtt5
 sxGMtXJfJ44E3GC9k71brW49CYti6zWGNIQZAK81gVZHGeIHw992UILd5cFv7NVbfiF7yKl4
 Y+vrseAYQSogGQraT1L4fOJpUM1tvj56DhFsA1gO6Ea4FOGm3crV59OfqvZw1kU42V38kxWY
 86ZkdlVK0uAp09F5utIFt8XS2VSKlLoFVHmZkF+Bu7y0nCumgRoivxhbKBFNR8N49m0t4sZJ
 Otl5MTYpTgBZsUgqMxFO/WPO3gjVUHu0OavzUmX6aR//WWfG5ff66wG4HUNFZ8Z4o5K7VRmr
 pT0Htyvgier3IpayJrjIgVla19KwMPDZOvzsVk4pd3V4GpPrTkujMwm6PcBtArciPyiEt6ZO
 9dDQzB9TS/jbjZiCE8YE5URtfm30yyXnz1w8Dp5pIIy6mnXigdwzKLsIJzefdniqcd9xxjC4
 DicpiKgX09cZIf3JTmtqxpAgsfgkCThV49UOKC+8vdyqFaS2nYSGFsdUl7TTfyR1BXgA40Pe
 hJ8FiwGio8I10COQefHQACGnm6isU5FedV0OrhvgO2K4vWNuFvIboQedRZDddgnuckeVTEsk
 FiTkLvBHidzubeYTXac8La8rj6oPyURa2gYakcsUg8t89Tl5oYpgXrnT8lhOL64iMXvHjP9y
 CzMqzIx750xp8MW06Sw/Xjcnimh4JPOS2Yd9gjRG26o8A59TIqkfJCzr0jW6+5aK4SURUXHu
 2IL8+CC5eUHFrmRlyiARuocEbXv7PGAWAAwmnY2QcNnrW70vSf+I8YAu1mSOXuFLO5DJSKzS
 kXBmDhy6bR+DmOldqhYSpyuXpFCIbfbKfzpUfXdb9xra5d3dROa8CwGWXN8z1wBg2B3z/hhZ
 M7zndKESC9DVP85lGbeq/I1jOdzrh3S018/UnwSI/6P9bOFLECYRr4eWLdlRrBotfjUyOk5H
 js2Cidr9/m9eLCkCsU02dRKRbzvEZTcLcqow/G7jsbZfmJb9JgJUpc9O48JdY1/hLhynezV5
 Hy7UUIw4AOh2SGYeVXXNyg6M+mHsXNDQZUTZ3JEALpV8yJ7PdbHAFk3K/PbgoXLBMQ8lKUpH
 pHpiu2LA+hVSySvxtjuRcKVkWCWTzzy3VjmF3P8OFAXJsc8LySUqo6MVla+r0EmU3vo3fbSV
 pX9j2s3t7JYHF88ZCsXAdryp26MUY81xr4jARuQeoMLEKgumaAzQxHMYjYMC5xkAT3IxyeA1
 hbQBhEdpOLXpJQy/sWPjqeBx7pF2cMkdqaDN2WEv7uwKwfA+W+vnd1JXOqSJGiPX2Lo4qSyI
 +5SyqikYvEAmV9Ltat6Eqpqkv1it4e++ecCw1Q2BmjPYnSqFqhkfiuM0/5Qu/Af3bReowa3B
 B6Co4EIJbWTNcr5O1cNPw55PP+b3PQZl2CKv/Q4KUn3/gFt+7+DXRkANhWAknUFfrB0LJkk0
 aEqv8tPs16zjR8jM9CniCFI9jvTcixcAvt/7pxDWd3lkAsmzF1GcKfwMC6u7cHdcchIP2krP
 iSQ2PjIiYNDyxeQaHE0D3XMg7ZQ3MxcpBBQwVYeDF2Vgd6Z1OQv1Rhc/DlrHARYyhJLj7B6N
 mRxbhAnIKyP+3FjhdRZXnDqEAZEXUXL9kv0wloPtWvYU0j3CTCdcDxjYb6ArBID7mZRXjlH5
 7XJmm/qXAHjcNz1wiZvC1VurObuTIAp+wDP8Cx98x9pw3XujeLZv5KT
IronPort-HdrOrdr: A9a23:fL+cJqsrqRYST39V7SezNgjb7skDFdV00zEX/kB9WHVpm62j9/
 xG+c5x6faaslsssR0b8+xoW5PgfZqjz/FICOAqVN+ftWLd1FdAQrsN0bff
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="asc'?scan'208";a="63607896"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4mLUh9nBo9LQIE9d4BPreoo7HHelQwMHeScuOeBAPRzlOSscZCNZM29ddHtpvuNWTyJZs9gBwg9RzsULWABp3540JmzieDs+I+9OUnvsT+jBBzHY56hZLarOqMYFsXgIRqvGbIvHjCFcYMm/mG6fpJHLDd2+Z3IZdq8RL8XA6bbt22m6dgzsP7BL9ZtrzD/o244FiiyUkckFkZPvo2YnWW6VhbTBnDkQWBaP/K60EFRUCrqfHhLAEDfJiMdw/x5+3QhGnmQd3ZFQU/RgtNYtF3UTszRUobL7t0OkY+2lVBo5VHNtrUVjv3pOxsPrrOG/BH7VmsEYsUfYjlt4JTuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnqExeOU8zdxFQsf/DLx8fidRLtrXMepj8Axlx2cv44=;
 b=MS+XdJcaZ4c+E2sr0RSJ2/jUa6mQzBgOeXAcKx5h6XoQJBtDmIZMmDkgz7PX+cLrpVUkUBW7KCErMw5fOqEqKnoznpM17oRyGazI8Tf4f3XQoesgihzikkEVwXAEgj2C1/HZ7PL+Q0Su1qWkam8RYBurEF3GsSz9KbI1e0AuRhhXxKGnjzae3CvSVAA7zKIKymy27EQyjO8+w8M44PURtmTSvoXt1nK7pfXarVYshNCFvmRogoGih1W86sbV6Wxxt1f9zLaqoDikS5L3yIeu8PWL2KyYz3X68nrBYgPVWTDMU6/GCGNqyt8Ivaj+qzxVtW22QVeUhrrrBu8JgXx49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnqExeOU8zdxFQsf/DLx8fidRLtrXMepj8Axlx2cv44=;
 b=D+pmUc8ZhK1esWPr3c1DcT3KP8giD4RqfypEstDqRButc0FUXkVQsE0uK07x2H4fsU4AhFz8IG/lYx17GbB7y1fakapl4d7+nwJx59p33liFM1ChdyG/ciDqR7hOV1jOrDxxIO2lJrcg6bqcB2RL4RkOST6zUrkx+FZehGhQ6HI=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Roger
 Pau Monne" <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 14/16] paged_pages field is MEM_PAGING-only
Thread-Topic: [PATCH 14/16] paged_pages field is MEM_PAGING-only
Thread-Index: AQHXcbjXAk59gab870CDDmzd/HViC6yUjm8A
Date: Mon, 14 Feb 2022 15:38:41 +0000
Message-ID: <A010DC27-7DF9-45EC-8A50-449C94516D86@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <ab136038-0242-086c-9e67-02c47e1db3e0@suse.com>
In-Reply-To: <ab136038-0242-086c-9e67-02c47e1db3e0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3fb089f-b311-4305-02db-08d9efd013b2
x-ms-traffictypediagnostic: SJ0PR03MB5792:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB5792469E5B002F0A53CBDDDD99339@SJ0PR03MB5792.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tC6hIyTCfCA3Hw7TDiObFSBbPCpjp4pKRSRT0R/ft5rxi2BV5QPk7kIIpS4iy0kC911PcLsIxe98sseq3JZS6fGrr5MOGrqG6+LsgqHM4AxuXXpLZ8Vf6ZyMtYqMYPsDibP5WGqM+HhRWe+6+ROgVfl33CFlkLXmuTpLupibGr776AVgFdgzioZw2IpXDR/KpkyfOCCSR/ARC2MN9RqwgZNj3dNC7xj5SpbgyYo9FYHcyjPB2mJdZPc/CLgYgJ0JkkRG9UMv0+EHesHivcOVYe5REEk9Q2Bt9yPCBf8vGsPi1+YBcSJsOn85DGmC1A9qdqQi1W6yxuDzhGmN/Q1y3yQxFXmbj+0Ozj++WQ9Sfu6gbkyG++E8r4eX9k20YZRFVW1ww+xuJ18YWU2vOaYifDn0wW5qtmUUpxGGnMsWkCA4225+lEWQpxyk/BSySvzq3XCtv4XPUwuQDKVBpeGdaadqyZG5Uqe3J16SKLPWYX9d5bsoX3LEkNTMnGlyQC3orlGWefbHrQm96WHQdVDtooKC9ahhGdp5UWNO686nRZIdV1wjyDomOGU2uyisI1mGEgBmCKzyLoBZ37Rd8pV7w0y6RbPcIj8b4YZOQR3F1t37h+ou6CS4ZjS6gPlsXW2PDfH0NsMhiWCUUH//XQLbRcmZV3cKrWKCOJE0iuHYtHggjJjZf7Axc+LBd9uAsyZsvDVsJlJH2XaQQU9MlxkEUgKNPIZoefBnj6RgeAg/AdmFm7hi3ZICAH2WFPUj7s6K
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(53546011)(38100700002)(4326008)(91956017)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(8676002)(26005)(186003)(6486002)(6506007)(6512007)(54906003)(71200400001)(316002)(558084003)(36756003)(6916009)(2616005)(2906002)(38070700005)(33656002)(86362001)(8936002)(82960400001)(99936003)(5660300002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?okz5PkCrYqrvxSg4WvL7M8x7LXUpHoiAyZnY1oT+/SM6x1QdjTlWD8tzDiLy?=
 =?us-ascii?Q?ctQeXtY2PCIhIavvOy6+AlbRQJAqkWJyPiQ4P5Gtdvue/IB7hcWyRc+q+KH9?=
 =?us-ascii?Q?G8kVuJf32K3bFgCqlsw1YXwLCaE1ZxMbSvBg2pyspLCP84WSRTbCnCocgVmW?=
 =?us-ascii?Q?N+Y67yt3fTMH80Jjn6mz0hHyA1E2AvZLwySHehwfivIxmcsXadl4bkNstGnK?=
 =?us-ascii?Q?RekMNyARv+QJ9VBb0D0xhqjEC/Paa/124w3M6qrdJqTwjmMZeb6Xn/sma7Ob?=
 =?us-ascii?Q?W59doNRW66q3L2B74sX9RO0JrsJt8wix02wuzCU32PKEhwH4OedKjSy18Ebo?=
 =?us-ascii?Q?uWiac0Z1zuN8+TZbc6uZTqDmzOHGLva82ra5rDDwUWkEBWjety+j6AUh+Q8W?=
 =?us-ascii?Q?PTrRQUONe1Heaed2Go3NZvS0NnwujRVRwE0//tiOxOsZFSCiIK4gZbjKDyW4?=
 =?us-ascii?Q?xESTbBkDw1zlU7c+k0g60FllCxujdSfBhl07xqhiGY+xXLcNfPk9f5VrO4sY?=
 =?us-ascii?Q?ap4e/IQIbqznYNcl8Z6MgZyR7zmACmA+cbCvHbF1i5XEjv8tunNRe170dP/k?=
 =?us-ascii?Q?XbtPrPaLkqPKKj2hx788rJGnWcaQeY124AyKycHwaI0VeXOSnj7JLHQAJuJl?=
 =?us-ascii?Q?WpMHLHhBF5xfgiesU8rT9UEYEMVCp9du78L1jQKTLgoedUH6/w7tlkN1bhLz?=
 =?us-ascii?Q?X+xOqATGrW7zdamkwzsvfb4hn6H7+T5prlAfu5Hz6ne06vEtYHQwAgyc7XAt?=
 =?us-ascii?Q?Pown0GYuMepk3D9wuPehS7xkMVpqY1t8ROVMnCfnaLqKH3neyEyf13fYxGpW?=
 =?us-ascii?Q?/Da3yXg7hd8jMaOzc/6jNAtQSC3CQ83MNWn55oK/MBazXL9a721TehTPHxT6?=
 =?us-ascii?Q?tDXCsaoXqHt0W/xBjQRjtSdRQ4j2A/FQz9EBgMHBe8phfjWx1MOTMqv5OyXG?=
 =?us-ascii?Q?2nDLbz5K5smfjWOQ+P4IW9+70h0WJRgmBm/0BhmzuaTC1rXkyLjLjveNR2Xk?=
 =?us-ascii?Q?3dTUYLOZuLyBZlMEUR5iOWwUEKj/8z1P+rPbjoN4VfAdEe15Ex4B0l09hs6l?=
 =?us-ascii?Q?o5rjuMGuLBb5GED1PM9lk/VHQyQ32lY5qxnxmT5s85xIc+qiebaEsXT/iDvs?=
 =?us-ascii?Q?brNkq3I0dUfegmY16NrMFWpzDgzv+gPzLOVOWX7BdC346/+fw5Y9n9In/ARG?=
 =?us-ascii?Q?4KY39ZV57TVC2wbRGBXSiVWfVuLJidU0m3kedow5zGPemBCS62DIWsaPZmn8?=
 =?us-ascii?Q?zf1U6BuTioAOrkzol4g2DwbjuWj12BxZxVLNT7DRYoRtPcBhmy2DlCiqnlvQ?=
 =?us-ascii?Q?NxOtxbVQ6gBki3Fm+FduBSQz2iapbZzJrV3oG5i8w6jf8tQ9oMVcX1D+vubY?=
 =?us-ascii?Q?dH1wjuK1nNKDqAOelIPbMWLj9x/FnDQwlyWOEo7fk5U9oSNcd/G6Gv/Wny6K?=
 =?us-ascii?Q?fxhui7yQmBat2UqRjPYTglZJj7jng3/8ZO2uLjjia7cg2R5ujXboXTggTo39?=
 =?us-ascii?Q?TFvv1sIz42nDdln7EuVYibcfGcbfmEKrQwUqcUweDgpqy+UtMCC6JDEa/oHl?=
 =?us-ascii?Q?hAFABVjSTpXZ7JpEdBd7UPY96qiGry8/RmYSROtU94RmHRexs/+i3RZb+VxQ?=
 =?us-ascii?Q?DW9Inr6CqJ2uNAiHVTo2Bpvr9Q5rXITr6EO23imgG+4hRxH1J9N8dlBiA1YP?=
 =?us-ascii?Q?e1R41PbxBqAjlgTSbOs4Sf95+ok=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_21C60BE4-85A4-4486-B441-ABC4FE3C6D69";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fb089f-b311-4305-02db-08d9efd013b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 15:38:41.0899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O4I03x6xdeXBOREx/Hq/1g2PkmIN5WskjbSVnsA/s/6EFDj1ZguMWF4CMtqPaewbkupup75GXfTCi5uERlByCzdTlAROfZRvNSyUE3ZlLww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5792
X-OriginatorOrg: citrix.com

--Apple-Mail=_21C60BE4-85A4-4486-B441-ABC4FE3C6D69
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On Jul 5, 2021, at 5:14 PM, Jan Beulich <JBeulich@suse.com> wrote:
> 
> Conditionalize it and its uses accordingly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


--Apple-Mail=_21C60BE4-85A4-4486-B441-ABC4FE3C6D69
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIKd4AACgkQshXHp8eE
G+1F5Qf8CzKlePNIxSfy5Y5O40stzm8dNX/GcJ2GOmQZIZQacZTODtvVlW0sW+PJ
FGHfoIsGByheJ8d/KXGWzRomMCqKQc90bOcaVmTdfQdtbCvhsV5o51E9RuIaZPGT
CJ2tHu6mAUFF6pxgSVjxiX6FD641zFjlR/QwpHlKERl4nKcYdbckzD9wq+dlF36K
23ApzCC7EiyIf5bmbcZLzMMg6lNWHHq0A3wv2LIVQ+XQAAspbtuq6xAbdad5EKAP
UCIsaNn8j8hgvTdtYIYFFDtIybodrWmKxhE8+Mmd90kVG6NCFBdzFYJbPByXmT6z
0tcTMAIbWkf45jybSuSkXwORINpPWQ==
=zobG
-----END PGP SIGNATURE-----

--Apple-Mail=_21C60BE4-85A4-4486-B441-ABC4FE3C6D69--

