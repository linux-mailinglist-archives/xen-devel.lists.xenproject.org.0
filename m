Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E144610FFE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 13:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431983.684650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNrk-0000LL-Gz; Fri, 28 Oct 2022 11:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431983.684650; Fri, 28 Oct 2022 11:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNrk-0000Hh-DR; Fri, 28 Oct 2022 11:49:36 +0000
Received: by outflank-mailman (input) for mailman id 431983;
 Fri, 28 Oct 2022 11:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jk72=25=citrix.com=prvs=293452418=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ooNrj-0000Hb-07
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 11:49:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95dee47c-56b6-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 13:49:33 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 07:49:30 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 11:49:28 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 11:49:28 +0000
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
X-Inumbo-ID: 95dee47c-56b6-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666957773;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Zm/3UsG2PpP0G67ER8fI7VqnfG4u2Sxk7j1RNkhhpG4=;
  b=G5xiDPgBb+SiBqmEVn9QfSWO5T8R+3RitRSTuIcXIA9osqUiVSsj/Vfw
   INq02Gmj0jE0MfA83zJTZ1RkUU0+EfqpH8pGh5MjE80sZOAymjwHUB6OR
   1d4w8TD4k20X3HlOjewn4gY5/W6QxVAPbrlWJUw9hjgIDGV0kRDRzsOUX
   w=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 84129515
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jVzIQqmFAX9XoxxK95gvEkbo5gxaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDz+DbKzfZGf9Kd13PY2/8E9X75fdnNdgS1ZkrnxjQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7amaVA8w5ARkP6kT5g+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 b81Di8iKU65vtqnh6P4cNlSl80xNta+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea9WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzX+iAtNPTeDQGvhC3V+CljVILAEvcHiqud6XhmGHBdxHN
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQPwrstUnAwMj0
 FChlsnsQzdotdW9S3iQ67OVpjOaIjUOICkJYipsZRQBy8nupsc0lB2nZtR+FK+4iPXlFDe2x
 CqFxAAlnKkah8MP06S9/HjEjiiqq5yPSRQ6jjg7RUqg5wJ9IYSjN4qh7AGC6e4addjJCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:cN7rZKhDu9/FEX+vqZtH4arzFHBQXzV13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hoAV7CZniehILMFu1fBOTZslnd8kHFltK1tp
 0QDpSWdueAamSS5PySiGfYLz9J+qj8zEnCv5a6854Cd3AIV0k2hD0JcTpzX3cGMDVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP++w+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlXQnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxKIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ9u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh5rD3xHklXKvoIRiKp7zOSI
 JVfY/hDbdtABunhknizyRSKIfGZAVzIv+EKnJyyvB9nQIm3EyR9HFouvD3rk1wiK7VdKM0mN
 gsSp4Y8o2mbvVmH56VV91xNPefOyjqfS/mFl60DBDOKJwnUki92qIfpo9Frd2XRA==
X-IronPort-AV: E=Sophos;i="5.95,221,1661832000"; 
   d="scan'208";a="84129515"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9AJazwRmBH+JyCTTPqbO57tQiiQdRz3EE0omOorqQBWGDJPZn4jkIJMFEbMKb8rH6LtbxmAKzZkzlYwa9Bpt/LlIC5nGR1+gS9cET2Lf9iXExACwHcR6SaLifyaVSkiGh2Dy0x4nN/vTY9F6/R92vAus1qllxjD1qZCnBoDyaxNBfTT4Q4VoDAQfK5H21KLL5OFSHwnuaeJ9agfJ1RdTdtgUJVzBYof9XwZjydV4KB42Qdjl/J7Ab5ESl/rfPWeYRv0sb5sGX0ioaKRRzNgzVfNfq4LIjGyptG5tkpHza92d/9zmoSpBKRFiuhDP99+et8oi6ewpUpHuA03syCivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKECUDVl1zscucUPv/GjI0191rht6maSxmk0rYH8+MM=;
 b=h63r+u2tmoD0E2ZY1Nsz6PM+AXc925MFJEGRaM1TQBHMymj7nZJxPFPEqMcKWgMELcnCh7ifdgV3616OqhCGqtDb68WDO05QUwyf8gLbjKUS6LOqnnUvGi5fHSd28qFNS5/lvxAAv30sNfWF+t1MSOj2Os/3RMaZn0Vx6K76bhLER4iA7zBc0i1MZXAwte1qdIiWe1N1R3yzb1qjj1i6Mbh3fZqnHrfC+N9DBh5Z8jGKmohRwRWWhUZQ6pOaMibOyOrwoGsRgqKkigI2wSasKeBwKZ2noimc3WGnyl4GMfYSgTHIE7JqPOinfCzmaN+LlkNPMGJwaLJ8LBULMgFxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKECUDVl1zscucUPv/GjI0191rht6maSxmk0rYH8+MM=;
 b=e1t0lpUMKNk+s4hPfWP6UqHfaVudL408ZdZ2gfTi6G+n7kUZCngMsrTCRNQbvAQO/L3lx9LfEWi1/Pe58ZpjGjUgs5t9ZtFuUagcGBWrJdqplUpPGXOKxhfrAAGL1YNB029Q4i/QU6N7g3K20puK5SgJ93ynrlhSf5nYrNjg5VA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.17 v2 0/3] amd/virt_ssbd: refactoring and fixes
Date: Fri, 28 Oct 2022 13:49:10 +0200
Message-Id: <20221028114913.88921-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0421.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6b57bd-5c50-46dc-6f9b-08dab8da779e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xg0eooQ38ocxNC/YsyGBpcgz7dm60+9K9P5ThOhq9+zItvXSUeH+VErvLgAr7qVxYN28+b9NsR1nVvysLa535VKMJwuPNvLFKeBDv2AgE42DeomffLfgyQiGN0gdhieC+coJInK+hoYKjQLjOSfqVUo9WjvKzYE5G3C+lRP7i3xhUPe+9qSb9D5bqY2wwi46pk9jDvE/DyWqQe8jbNvjUnZ3w6gcmbcDgZf3XvrTUFLb9G/z9+5vB/D4CEWnHtSy+OxwLZRtQRiILZPPy+loVTCd8etuRqaf9da2vYHpYRUVazpDW904+Iq2f07ufy79stveDS1nS8a1LUR7CJ80pYa3PmEQjuuZSj7gbIkBdfPCL0IHYz8pAt8G9u3EyovY7ablK/bi9kxrTKmGrWY7i1XJJ+Mmt9gqrtOmTlAzzh1sKfV4FnoHtlQMWn4EkG9lqEXA/sb9ysOfeYJKmyW/ZwBtx+tFBQlyj+gDSjTBm4/PJeJBHk69LlTafpSl/3sQH2u0uQ1m6lRf7feH3mwuwLfjiPR6bn/o/+eMyJ24Jycld3aQBVRiUzL/ymMGO9+KpuMc77Ugf45l91f5bd+GYzfuIx+a/fGRv/qCwb/GHvtlFgHsAZpF3oGFJfXNFsR5ownafsFCDOk71kzD+K+bebQsRLVzeVbu5ZusyHeL2qENdcB5SvYzSC8Lar+/M9y3NCviUKS82Ij9h3V9uilM6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(1076003)(186003)(2616005)(6666004)(26005)(6512007)(6506007)(83380400001)(2906002)(5660300002)(54906003)(66476007)(6486002)(316002)(6916009)(478600001)(41300700001)(8936002)(66556008)(8676002)(4326008)(66946007)(36756003)(86362001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEM3ZlRSU2d6QjNCbEJaSkdkaG9jZmlFUit5emViQjFxNmZxRDNwRm1qZXZM?=
 =?utf-8?B?NFVNL3pXZ0R6cG5GMzA3R29WZC9Fd1A0bG9vU0FRN0lWZTZsdy9oVXRrYnkw?=
 =?utf-8?B?NUdoWkZPOW1yRHZjM3NnTFVlUHY4SXc2R2N4UWwxVTg5UDJZVldiZDIraVpp?=
 =?utf-8?B?UG9BOWdGSmsrY1pLdUVFY0dRNWR3SnBzNE5QUUhmZTRSb1JIZTg1Y05ZWlpR?=
 =?utf-8?B?VExtSVUvcEZwMGVnbm9BYWNXMGczaDlpSnhyZ3ltSWNvaWhYTnNFRHYyYU5Q?=
 =?utf-8?B?ZGptWUJSWUQ5YTBFZ3h6TU1aM29weG45MFI3ZnlhazNRTWM3dHk3ZUhCYUZj?=
 =?utf-8?B?WjZpZXBTV01HSHJyNXVBOG8zMG9EeTgwTUF2dnFTMmRnemRLQk9RWUd4eVdL?=
 =?utf-8?B?eGYyNUxlcDMwejFORk1yQVVQNkxNcUx3V1ZsVnFNYlczSEJGSDM0R3l0aEw0?=
 =?utf-8?B?RGRmN05BUXk3SEN3TkM1cmtoTUc3eDh6Tmc3cWl4enNlNHdLaSsxcThXOFQ1?=
 =?utf-8?B?SnJPb3hGTENKVUZlYnc1SkNURVYzNFovUXc5bzNCY2NTTE5temZGTjFOeElP?=
 =?utf-8?B?dWpTK2haTHVVckZ4WGRSMDIzU0oycTZlVHVoMm1ubjVCTFpjRGdQUnI0SnJM?=
 =?utf-8?B?VnRKWUhCMDN0TDdKdHNKcjZQSHE3QkJTbkRiL3RrZDZZakJoR0FqcUc3ZzJw?=
 =?utf-8?B?U3dydTN0OWhuTnZnTGRoeUR6cHBZTWZRTkMybVc3TU9QZlNBclBidWVCdlVk?=
 =?utf-8?B?Q1pNNXBVQjMxQzJwZHJrRzBDZ2VyY2dBT25CNWJBZ1NOREZtZ3lsc2tnNHlX?=
 =?utf-8?B?S2laenRNUFUyTWtwMG83MlhWcTNhdzhkSkp6YmgwK0F5NmhLMlZFcTZSM0xM?=
 =?utf-8?B?WTJQODk5U3RwTlNYSjRxYlprMThHSzhTVkRqWlRrNUlrK0FleGNkYkk4a0k2?=
 =?utf-8?B?c3l2WkJ6NldnNW1CTHpZVWlrV1pGSE1peUVXc1hBT2hBSExLTFJZeURFU3NC?=
 =?utf-8?B?eGc5VVhTUkh2RHdzZWR2dXF1OXUxLzVRazNTTlhsM2ZSdHpGY3dseFVQQmEz?=
 =?utf-8?B?ZTkvUGlPZllHNjFRc1B0T0FubStQMWt6M3VPYkUxYXdLdTh5OXRzaWVWZEZj?=
 =?utf-8?B?ek5naC9DdFVzNXF2S3l3NXd4bVZJYktSMkVzT0ZoUFFQK002NUlJamxVUmZM?=
 =?utf-8?B?elVlYUVSZGNlM3NXcUR1aUxRVmJIclpBeDJPS1M5VkRFMnROWnd6NkxEdi91?=
 =?utf-8?B?bjNCdkRiZkViR3BRT2ZETktaOHVjNUJ2bzNsTWlwdERMT1VSa3B0UDZycFJ4?=
 =?utf-8?B?VGN5TUc2MFllT2VhMWZtb3h0R0JPYVc5TEY2a2V6amJJVkkrYS9CZXRjTkJ0?=
 =?utf-8?B?SmNUeFRaN1pkMGdwbmR6TW1xMW42dHp2OUxQdzA3ZityZ0R1N25DYndERVN3?=
 =?utf-8?B?Z2cyazA2eFhRRjErSDJ4ckNEdTBPZ0pmRXhBSk1rdWIyUkNEZ3daNG1SMEUw?=
 =?utf-8?B?V3pUczJsNXpHV2pXU0t3alJOWVV3azdSVGEvT1BaNVAxaUYwUVFLSGQ5Q2Jz?=
 =?utf-8?B?MXZiazE5dm02WGUwTzd5c3JtMGNDVGc5dlNYRmNSK1NzdmFrZjFielpwcVo0?=
 =?utf-8?B?eUoxN0VDNk5oNDlFY3VRZFpaYTBndktndHVhRmJSSTE1ZEMvVDhGNHZ0bHdo?=
 =?utf-8?B?STczS0ZCUGViazBERE5OVmNNR3B5L05Dak1mOFZtd0ZUeWNWeHl2VDNCcDdX?=
 =?utf-8?B?Q2xDRVlyNXF3djREdDU4Tkk2T2tHRVI0SGhKNmZyQk1QMmljS2J2N3VLSzdj?=
 =?utf-8?B?dkR2MW45ejZjM0RLNWtJWkJyTXBjL2tXcFV2ZlF1cWVFaW9vb1o1R3VaSjFR?=
 =?utf-8?B?RjkyQzllOGt3N2pGQVJnV3ZkeGJjOFZuZThreTRQeW0zTzNOa1NHM0tLejlN?=
 =?utf-8?B?SWRDa3dGQnVTZEpSNjB1TENSN1g2c2xxR3JJeS9WeVR0MGtXaEdWR3o4MUVS?=
 =?utf-8?B?dXhPSC85SEpaZUtxc3lHTTh1eUpSYWQwRlFkdXc0TXRVWjg3dGN5YzV3YzF6?=
 =?utf-8?B?a1pFNUlDQzlvYk1IRnI4VXdJTklobUtXUXNvaFFUanpxaHMwK2RlV29vR1c5?=
 =?utf-8?Q?r7Esj4qirSKDPqv4OR2v7FgMk?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6b57bd-5c50-46dc-6f9b-08dab8da779e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:49:27.8255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhb33fwukJoW6bbrqPpJXocA/79PAfRJu7gjsoqeTwDrV8uLhRj7xwgVlUGuDQaqQu9RCvxGVbC17+gNW40smA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6027

Hello,

The following series aims to remove running C code with GIF=0 on the AMD
vm{entry,exit} paths.  As a result, the context switching of SSBD is
done when context switching vCPUs, and hence Xen code is run with the
guest selection of SSBD.

First patch is a bugfix for missing VIRT_SPEC_CTRL MSR loading, while
second takes care of removing the loading of VIRT_SPEC_CTRL on
guest/hypervisor context switch.  Last patch is a cleanup, that's
already reviewed.

I tested on Naples and Milan CPUs (and migrating from Naples to Milan
correctly carrying the VIRT_SSBD bit), but I haven't tested on a
platform that exposes VIRT_SSBD itself.  I think the path is
sufficiently similar to the legacy one.

Currently running a gitlab CI loop in order to check everything is OK.

Roger Pau Monne (3):
  hvm/msr: load VIRT_SPEC_CTRL
  amd/virt_ssbd: set SSBD at vCPU context switch
  amd: remove VIRT_SC_MSR_HVM synthetic feature

 docs/misc/xen-command-line.pandoc      | 10 +++--
 xen/arch/x86/cpu/amd.c                 | 56 ++++++++++++++------------
 xen/arch/x86/cpuid.c                   |  9 +++--
 xen/arch/x86/hvm/hvm.c                 |  1 +
 xen/arch/x86/hvm/svm/entry.S           |  6 ---
 xen/arch/x86/hvm/svm/svm.c             | 49 ++++++++++------------
 xen/arch/x86/include/asm/amd.h         |  3 +-
 xen/arch/x86/include/asm/cpufeatures.h |  2 +-
 xen/arch/x86/msr.c                     |  7 ++++
 xen/arch/x86/spec_ctrl.c               |  8 ++--
 10 files changed, 78 insertions(+), 73 deletions(-)

-- 
2.37.3


