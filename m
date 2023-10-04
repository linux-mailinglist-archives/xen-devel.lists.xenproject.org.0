Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA4F7B816F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612588.952556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo2KS-0000XU-Qq; Wed, 04 Oct 2023 13:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612588.952556; Wed, 04 Oct 2023 13:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo2KS-0000VT-Nb; Wed, 04 Oct 2023 13:54:20 +0000
Received: by outflank-mailman (input) for mailman id 612588;
 Wed, 04 Oct 2023 13:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8y1=FS=citrix.com=prvs=634504905=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qo2KQ-0000VJ-FO
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 13:54:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81608d21-62bd-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 15:54:16 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 09:53:52 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7347.namprd03.prod.outlook.com (2603:10b6:806:394::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Wed, 4 Oct
 2023 13:53:50 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 13:53:50 +0000
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
X-Inumbo-ID: 81608d21-62bd-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696427656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zAKKZrXT40kxGi6o7MaetvKBywZS5ao8NsgvC6VvEWU=;
  b=DFuoUs+9IDDi059DLdcMbdi6VeMSSSzBAVS2vzKXIfma+UGQ1wV9GQdJ
   FpQ5wUplqb7+nPMFyrBG/tqTMkNyehOMAQ2VIazBtPAm/OVwpqlt4prO7
   cW9hs9C247FP1kWm+WU9bF89HpFj6FMal9+f7YgmYqJxyloerAWEJAQGI
   g=;
X-CSE-ConnectionGUID: afEOUnMJSoK2u26v7J9LPA==
X-CSE-MsgGUID: NdccwdNhQSGL/FQWsIsuQQ==
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 123862573
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:4Yf83a3tYs5noHWj8/bD5Tdwkn2cJEfYwER7XKvMYLTBsI5bp2MPn
 zdKC2mBbvuNZGKjKNAjPIW+8UwH75OBzYVrTgtkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRmOagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfCG9j0
 sEeDRI2aTPZmrjo3u2ZG81Ur5F2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1YZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LSfw3mmB9l6+LuQ0PJhi0Kf4GwqMzIyEnWCnuKYkVOHYocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRRzubicUlqB9bOZqzyjNCxTJmgHDQcbSSMV7t+lp5s85jrNU9JiHaidntDzXzbqz
 FiitzMijr8eicoK0aST/l3dhT+o4J/TQWYICh7/W2uk6kZ1YdCjbonxsFzDt68fdsCeU0WLu
 2UCl46G9ucSAJqRlSuLBuIQALWu4PXDOzrZ6bJyI6QcG/2W0ybLVehtDPtWfRkB3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:x1KRpq8JcCo9sa7C3XVuk+G/dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsj6KdgLNhRotKOTOLhILGFvAH0WKP+V3d8mjFh5dgPM
 RbAtdD4b/LfD9HZK/BiWHXcurIguP3iJxA7d2us0uFJjsaDp2IgT0JaTpyRSZNNXR77NcCZd
 OhDo0tnUvSRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTvj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qm5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwaZUaAHQ5UYMtMx1lP
 sj5RPTi7NnSTf72Ajt7dnBUB9n0mKyvHoZiOYWy1hSS5EXZrN9pZEWuGlVDJADNiTn751PKp
 gnMOjsoNJtNX+KZXHQuWdihPSqQ3QIBx+DBnMPv8SEugIm6ExR/g89/ogyj30A/JUyR91v/O
 LfKJllk7lIU4s/cb99LP1pe7r3NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0ZoJno
 jbWl8wjx99R6vXM7zM4HR3yGGOfI3kNg6dj/22pqIJ9YEUfYCbcRFqEzsV4o+dS/Z2OLyvZx
 /8AuMQPxbZFxqfJW945XyBZ3BsEwhubCRsgKdcZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-Talos-CUID: 9a23:mzEc6WNJPQ1KAO5DUSdK03MSP+IedV6H0S2OPRCaWEJRYejA
X-Talos-MUID: 9a23:3bmEKwQXbCuQS8wWRXTKiDppK8tO452VJ2RKv6w5oOifKBVJbmI=
X-IronPort-AV: E=Sophos;i="6.03,200,1694750400"; 
   d="scan'208";a="123862573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lc8Nlzvo3wpBZtm4WxUJlkkJNrtNRm29oSBAoWL512XpmfoPbqgs617ntNhE445EMq8GmasLNSe29BZ//nJA4764AeGrhjYcGoKsr8QWHICqXNyybLNgvXfzKDPiJfdXkl//3n+I+n14xSlGYTeMNeWHgcreGaprbcN1bCfCykIwpxE++hXuQagcTDH3pSo4F4ZNBWyAKJi0ojXwAnoYbcKTbB3tNLqrNM3r46XCF2ZBm0nHDJAmQhPayFjCwZ10VyjJUvg3mfV0YPb8QzHc4WchkgemW7yigaAhsLd4QjP9tr8r9Nmjr2dqSZQwhxDItRy4GsOH6y81H7VENlI02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9T/LvJTMaYmy7DqmDRI5rV0oXDj3OflcxEBGo3ICrt0=;
 b=WrucLJMBaTxMaAoYul6J0Y7UdDFstTzegWpRX/3Kuts482Ot2rH7MEsB2clfMeDDFysggKTbFFEqMt5MmDa72vSqZ+cPztCwDxAa9eS0nCEIzPbl4cnxcWun3d0wyCY8WDS09aqs9cqA0uYlXrT23Z5ZrjxM8n2z/Ik+JlrtM7gGBPgoiblEEgxj7rKqL9Pr0bqii4bZ18UoJrCHlPqWUrQAQK5QE+B639gG+/kq9LW7YfsxFDn52+Gc8ZnbhzxwGiJ/e4VqkL4q+gN2WjEOJJrCj6DAR2rNpak6RNdPqK3IINfPdKsPiah79RSJY19ALTrEL10LePwbBKSPDq2ABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9T/LvJTMaYmy7DqmDRI5rV0oXDj3OflcxEBGo3ICrt0=;
 b=JLKMTIgbeAWPtBLEvDruwuue3Ij6yRGNX/2bCxG0PI80+i9drQpPIZI1fAWoUzwd5O+qgaAN0xVdVaHpmEsKoHAm14zgWrGKk2onCBJpTKZ6/+2nYABmOFXWrAyuVpZnuX8Fizykb0wYA+grtS+KyKx1e9WpRipIdlD9lRRHD80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 06/10] x86/mem-sharing: copy GADDR based shared guest areas
Date: Wed,  4 Oct 2023 15:53:31 +0200
Message-ID: <20231004135331.83736-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <081ae245-9d47-4cab-ad64-54b33566429c@xen.org>
References: <081ae245-9d47-4cab-ad64-54b33566429c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0048.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 2443ec4a-f5bf-4cd2-ce9c-08dbc4e15677
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XaRcixdKIqFT2rYIbNeW4CiKYExu2UJE5kWHoQKWjpIARjgcTxgpcflQ2PxDb0HXIH1rGRHp+ebHW8IarosCdfFZHmBjtyoAeOyIPXddYGxo1TmF56WwVDf8yoLEJ5Acfk8ZUMbZs/HI7WHbc+8c7kHtyyCvyxBte885a5qbMXiy7Y5lI/Ua2/QGi3eiNWeo1sY2jr5qX+Za1iIULSrV/+sJ3c1iv4MwuQlUuZzqKNLxpV0XasG12QsjkqHXPiserQP9ScL9rzTUPgQcQLze5cvkqn8qzuFRP9JM23AzKnH+VleqULQx74g/yS6mB0YQN8Pdgclig2pEo1FspIkU6Nb5yOxGEFy5nmUQCWMfxYv7YgEU++j4XNv1eMFtC7Jqj8WVbNuWcFroANiK62oU0f1bM5AeJ4GL9y5eP3KEhzss5Xqw9pzYzmt47/uAlKP1YdxCoCCscgAYt7DNsIpGlS9HM6Y6pbqx3eUBejcbzddicR+0Yt/xneRU6rtqpj/fiUaJYaCrnMhLvhJWUZm9Mkrdjd1NpK/Yvv0yeEjnMKkfYELUC1yNMdCL+ukZ8L8b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2616005)(66476007)(54906003)(66556008)(66946007)(6916009)(316002)(41300700001)(1076003)(6512007)(26005)(6666004)(36756003)(6506007)(478600001)(6486002)(38100700002)(82960400001)(86362001)(2906002)(4326008)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3NhT2xGQ0VTc2pHREZqTVBOeTVMZlZ4aktZM2RSTEdLdUpjbEFUdmNIaVBG?=
 =?utf-8?B?am1XcmJwbjdxYkJLNVdYc2tFbXpjOXlsaFd3emQ2Y0dKYzg0NGd5ZDhKc1FY?=
 =?utf-8?B?NVFEbjgzZUk2RGgxeFJoMlBKWEp2blBhckZFSUd3RXdtVjlSR2NETS9GVVoz?=
 =?utf-8?B?cXhTY08yY28wU2FrR0xSeGI3Z3BPbEZYMFJvbWdkSDdGNnBGc3pBQ0tvcUZv?=
 =?utf-8?B?S1NMUERYTEx1UnA4QWtYZVhtV2pvdzRwVUtJUjljMVpMcCs5WS91eU5FSGVY?=
 =?utf-8?B?Z0RQYnc4Nkt4aXV5azRFd3BzdTlGRDVxak9OeVMwNFFUaVZHTzF6blVrdWt4?=
 =?utf-8?B?OUlTTXFuTE9MQXRLQlpocUJkREVkdXo2VlRtSEZVK0Z2RGlmc1FBa2lFeGxC?=
 =?utf-8?B?TEpndndac2N4OWtLdC82TE95cE9tZEwvUWhmQUZyT3NXY25aZTdJRWNEVmM2?=
 =?utf-8?B?UHpEOFA3eXZqMDVqZ2M1SEtoUkhKTmNJUXlOeGdUOHFOekFLbStNTVFNcWdt?=
 =?utf-8?B?Zkk2ZkhRSTVHSzFranN5SVoyQmdTbFp0ZlR6TTZWTFMzbVUwSUlyaG1HODJs?=
 =?utf-8?B?R2NpODNCVy9lWVVQTThrOVJ2M215RGtuWmJBZDd5bHhVN2ZLR3BVbTd1TFRu?=
 =?utf-8?B?emZmRldnVmZReUdKTDJBQ2N2S0s5UHV6dVBqaEg1aG83N3NYNTVlMFp2SGJ3?=
 =?utf-8?B?WUFxb0JPbzFKNUpzMnNGQWRIMTlZbk5GVS9kZU1oYmVVYXdIZlpKd3hyUE5V?=
 =?utf-8?B?WG56amxBb25BU2VCSmNBNlBKUVhkTHlVN1lxdnlsVFFkRGRVblI2UDUydnJG?=
 =?utf-8?B?ZHorT3lVMFFOOGkza2t5VExNL1pyQmFscVA3eEpUNnA3T2NCTGI2Z01oV01y?=
 =?utf-8?B?TWV3akI0K0oyWU1wQldUdnNqQ0xaVi95a0hidHJxdUl2aHRkQm13YUpyc3o1?=
 =?utf-8?B?cDhyampqUHRiNmVDWGRCU0l3QzgwYW9PV3d1b2ZCQ2tMZGxKQTdYZHFCWUpT?=
 =?utf-8?B?TFlrMmtsMXJlNFA1WExMa28waEpKdHZoVHJRam1RdEZrLzlOaEV5ZlhoVVNK?=
 =?utf-8?B?ZEVkRnJpbDgxckdrWm9kTEpVOUZRTUxBbWp2RnpTWWMwaGxEcUpnSklXbXBX?=
 =?utf-8?B?UWpPNjNwUkp5NHZzTjQxTVdsYU0xai9NNHdrNndvWGlnZGpnWVJOdlFwLzhs?=
 =?utf-8?B?anVNdE9jaW5EMW0vRUVNRFA4ekFERjU4WkUvQWY3TE42UEhYZlFrUkxwRmVL?=
 =?utf-8?B?anJVTnB1OG16cDVEUDdhdlRHSlI4WUt1Wll4REhUemRPTnU4djVVKzZmTGY4?=
 =?utf-8?B?QU9qMDRrSHJRdSttREZYZ0xkSWtQdHUwWEl1dEZ6REQ3dEF2QXVUNm9EMG1V?=
 =?utf-8?B?dzV0R1hBMlRyUytpZkZ6emVGalAyTENJQjRiMThMemNnTVlmSDdGRjZhZTZu?=
 =?utf-8?B?TE5NZ09UVXVibUhkdy9Za3k5QThvWHBiY01qT0tJUG5xZUZldTFoZHh6ZTU2?=
 =?utf-8?B?R2hsYUdzWGREZ0U1M1prTWFrZTJDQ3dJZ1cwN29YdFUza3BrN0RTVnAzSjJj?=
 =?utf-8?B?V2lSNU1qR0k2dGFqVFhHdExFYlU5TUh3V2NaZk0zU21GUmFPb210U1BOaVFC?=
 =?utf-8?B?Zkl4ejRNZGMwbmtYL2g5UjQ0endBSEhmZ2hLY0VSbkdDQnZoSGdYQVBvMXFP?=
 =?utf-8?B?V2NXb1VSdHFQNTNvdkZvSkFkV1hHcmhtTGgrWlBpaVMvSmQ2VldabG5uWTZk?=
 =?utf-8?B?bXdMWUpIUXlKeVlhTTViYlBmQUxvL2s5RXVUK0tTd0xUWHpTbzdEL09mQ3lV?=
 =?utf-8?B?Y0xmUnArZ0h2MXU5bHdrVmcxSjN5NDhoektoNllkNEliYk1OSmQ3cm81bFl0?=
 =?utf-8?B?djdrMVR2VFZwU2pxenlOUjFUUTIxUlBENDZYS0JVb3NQVUNuQ0pTUDQ3OEtl?=
 =?utf-8?B?cFZHdldkYnlzSkViaE1ZbUR6OFV5U3lLaGp0RnBORFJldnUrUFRBUVBqM3hk?=
 =?utf-8?B?ajVaSG9jbWdRMzVUQVZnUitQYU14cEJieG5vRG54cmd4TUJ5NEtWdytKdlRi?=
 =?utf-8?B?amRLeFJlODR6LytBVi8xTDBQbjhCUW00WGxIb3gwanRuR25rU29mZTlaMk43?=
 =?utf-8?B?VCtDblREemt1RzhUSlk0NDVhR2dyOXg3NTU5bmY5TzJaYzRKYnd1amhrVU5i?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QAbjIm+DZ7REgTieOcUz/NIa28tEKDnVirZ4OHe0UaLhf19qcv6XzdIxnEgWY9UBfLwyqU/GHAeveWCqJ359CzGgTjs6Z4bhnoyUbxcr+kXhr640ESB9/+hbRxan04BKP5zQJITMnM1kWbRWn05WQlaadolyN01yO+1msSqjpT7wsO8dHwyzjDZ8Af9wUfrqo01yypgwVdfFnScO0JzKJnPsbvYCZNktuu/7Fqes3/gx6Pce31EuOHnfn2d2xlSSOrMkjSRFBoE1O6i1CSXFPawvHRuvTjHMt+uaiGu5/5sW1KJY9BgK/g/T3yjrwvleTJx0+i5heUXwSRA0AQnfLIKpRvP5aWnCgw3WKoD7OduGp36D8ZgQSIEN7KZ6mbRkzJ5U27jwE4fKf9SFAmR8WW78OmYGylkaUOQ/d7fv1CZ0FnLYtNg9vpirmexts7VxprksH3sNiNhzxmPGwqwtXE602g+Yb/dem28M1HpFLG3PHsm5hQrgvvOEeccVviw5VFx6IgDO+LdWP7og/bxfqY9k6aL2WkW60BsD40HOauH4G4+E/2Pobxn/IPwpbNS3dd39EK5NS2YcWkD7mHGW1XPPhx2u1yK7tfiZkksOhn37woGved4cGaG8CmP6XCWut8nB6NR3Ztl2f9fr4cw3zw/BFFEC0Z981Uka1YCQQzDugO0SOs8bKzlCSSBnwwprn6kBx4rS4Xq23u7BGDpYHBulH+OhSLvGlOH8yuZIpYoObJt8jpkJyy0dVWNJeAHYlIN0+3PW1EvFWfULv6qTFu0vW4qvCl45BA8h+vkYkVpVgsSoCXbP0UEBNYcb0H02r4D25FYA3JKo+FlgyPaltRovjVE+RaH9F0GnHoRVh51BZa0etYb7dNrkNkfvg06OeZqgHzhJ7UMopZP7uIn2bw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2443ec4a-f5bf-4cd2-ce9c-08dbc4e15677
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 13:53:50.3224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OX2E9CXCg6XQ/ASnebKPf+84llvbYN8wEcXUH72YEvHpyDuEfFYXSPeS1vkuBdlLueBGfdkdixXWTduQPKwQPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7347

From: Jan Beulich <jbeulich@suse.com>

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary fork handling (with the
backing function yet to be filled in).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v5:
 - Convert -ERESTART to -EAGAIN.

Changes since v4:
 - Rely on map_guest_area() to populate the child p2m if necessary.
---
 xen/arch/x86/mm/mem_sharing.c | 36 +++++++++++++++++++++++++++++++++++
 xen/common/domain.c           |  7 +++++++
 2 files changed, 43 insertions(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 5f8f1fb4d871..445947b6a918 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1641,6 +1641,24 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
     hvm_set_nonreg_state(cd_vcpu, &nrs);
 }
 
+static int copy_guest_area(struct guest_area *cd_area,
+                           const struct guest_area *d_area,
+                           struct vcpu *cd_vcpu,
+                           const struct domain *d)
+{
+    unsigned int offset;
+
+    /* Check if no area to map, or already mapped. */
+    if ( !d_area->pg || cd_area->pg )
+        return 0;
+
+    offset = PAGE_OFFSET(d_area->map);
+    return map_guest_area(cd_vcpu, gfn_to_gaddr(
+                                       mfn_to_gfn(d, page_to_mfn(d_area->pg))) +
+                                   offset,
+                          PAGE_SIZE - offset, cd_area, NULL);
+}
+
 static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
 {
     struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
@@ -1709,6 +1727,16 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
                 return ret;
         }
 
+        /* Same for the (physically registered) runstate and time info areas. */
+        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
+                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
+                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+
         ret = copy_vpmu(d_vcpu, cd_vcpu);
         if ( ret )
             return ret;
@@ -1950,7 +1978,15 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
 
  state:
     if ( reset_state )
+    {
         rc = copy_settings(d, pd);
+        if ( rc == -ERESTART )
+            /*
+             * Translate to -EAGAIN, see TODO comment at top of function about
+             * hypercall continuations.
+             */
+            rc = -EAGAIN;
+    }
 
     domain_unpause(d);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index d4958ec5e149..47fc90271901 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1601,6 +1601,13 @@ void unmap_vcpu_info(struct vcpu *v)
     put_page_and_type(mfn_to_page(mfn));
 }
 
+int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
+                   struct guest_area *area,
+                   void (*populate)(void *dst, struct vcpu *v))
+{
+    return -EOPNOTSUPP;
+}
+
 /*
  * This is only intended to be used for domain cleanup (or more generally only
  * with at least the respective vCPU, if it's not the current one, reliably
-- 
2.42.0


