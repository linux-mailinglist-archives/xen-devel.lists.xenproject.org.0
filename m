Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5BA7331E2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550176.859137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Eh-0003m5-PX; Fri, 16 Jun 2023 13:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550176.859137; Fri, 16 Jun 2023 13:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9Eh-0003j2-LI; Fri, 16 Jun 2023 13:11:31 +0000
Received: by outflank-mailman (input) for mailman id 550176;
 Fri, 16 Jun 2023 13:11:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9Eg-0002qy-QI
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4da7919f-0c47-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 15:11:28 +0200 (CEST)
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:11:27 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:25 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:25 +0000
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
X-Inumbo-ID: 4da7919f-0c47-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hBwvY3lfHoNM8Xj1tdtM0Io/t3NQd40npWjmDL1Q44A=;
  b=VU4sjFCZWcNEIbHXCJMVGjhj9u9D2vFD7OxQ3Y8+Ieu45V3CUkpaB3fg
   Hkqf84kGtV5wU01IYjNbPZ7M8j+i2kK6D+q9B7yhfn5NmPWWHvPnQlEDe
   erRSKAX5wgcdMyJkAVNrIO5cBeMTMblhPnZgWWQaZliST/pcdva5y9NFo
   k=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 113085923
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:l1REhKPdrd4hs2/vrR2TlsFynXyQoLVcMsEvi/4bfWQNrUomgTFWz
 zMZXWuHP6rYajH1et8iYInn/EoO68eBz4U2Swto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uBdImcV6
 aIXFDBXahDfh+WW+ojnTNA506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvzS7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyn01rKex3iTtIQ6LKK2qr00nkavxjJNOjsLdwPhjPm1lRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLncAZi5MbpohrsBebT4lz
 FiShPvyGCdi9raSTBq19L2ZsDezMig9NnIZaGkPSg5t3jX4iIQ6jxaKVdA6Fqew1ofxAWuon
 2zMqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:3Oo2F60cvoC7UuEO7/WzgwqjBH8kLtp133Aq2lEZdPU0SKalfq
 eV7ZEmPH7P+VQssR4b9exoVJPufZq+z+8X3WByB9aftWDd0QPEEGgL1+DfKlbbexEWmNQy6U
 9hGZIOcuEZDzJB/LvHCArTKadd/DGemprY4ds3Vx1WPHlXg6cL1XYfNi+rVndYaSNhHpQDGJ
 +V9qN81kGdkSR+VLXcOpEdNdKz3uH2qA==
X-Talos-CUID: =?us-ascii?q?9a23=3A1EMdU2jXD9u84jXtak24w995HDJudFf+yizMfUC?=
 =?us-ascii?q?ECTxtSOGVTn+qwv9iqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3An5dYJA+ohtNJRhm23+V0LTyQf/937fjtVl4WrZV?=
 =?us-ascii?q?Y5fuiKA4oYRqdgCviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="113085923"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du6eygVEPkomcX7RCGWs0Im63Fnm/4qWoHUv1T10ZCXPvRqPG3k21SQHZfgiSHngggaTyMsgbuGrgisruwvrH8ZM+tCph6FGUdTiaT5DBTb0sdrwFJlSM4pqtYarK0b7EgmHGQvExRsgITltwa3RmdqRqsGng76TI7k1aShB1oHjdtHYNNImV5C92Grh/6tyj1NzEoImVL70XFW9kYvoOSfbkJkpN067DdHk9Pwp0z0qcITjfFhXVTosbQNPXzTa4dh+iCO6QjbxCtd8n3B93KeBm7pjoLx8Ty6Bx3iLFl+71arZbrl+4sMpg1JeRopP3Gs8sAZYPM+Cy6t1okNlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWrUG40xYuI686NvKvmyZ+nsvRDiKbBAZHC1yketgNo=;
 b=Qmqc1MPAH9aiKt/CgZTnybP6L7ziTyPAQbWVPiBGx5UtaynzW4xYPgg70FEZb2lraKNqm2xjMCga0MSz/Tx4vrxlQ0eOrPY5n0BSfMaeLyhKdTnql0m4iCrAbcDq64OivVNy1nEqdXSaabl/IPP5Ao1c/JN/YFoocsmTLWpGrBcBafczY9S8lgnWRCTdqH9Z0GSqep19aaCy2pkdo3NjYliAUE7Maclvb85DtuGc3mKMKOPIF5g6oZXUcui2nJECELzw9ewdC1vaEHEDjcqjMQn9TAcwCnACgM8CpGHTAyPzEJzcwICbq4xEnvGeZQgiLY5gQ3pQr4ctad3/2pKt7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWrUG40xYuI686NvKvmyZ+nsvRDiKbBAZHC1yketgNo=;
 b=PG/pfOIU7tjMTbfQx5ux65+hrmh3iYRQ5sB3Sfz7/lovZtI13nhr6TqPLbWfw7Yum81InecTn/QXT7fOJnaTvwR0PC7zGzEC8gagjPIT9X5gbv9SZkdHMcna8F1jyZv4nMHtMpEW0pWe6L5w8dVqV6jDstn2IdbMPJbImkRVjOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 05/13] libs/guest: allow fetching a specific MSR entry from a cpu policy
Date: Fri, 16 Jun 2023 15:10:11 +0200
Message-Id: <20230616131019.11476-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b730fe6-8e3c-4b69-bd64-08db6e6b3067
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2ksVjEoXiLuz9GJoaEbkjsFgmtDKUHyLPwKj54hCqxv0mYK5MwammpwKqU2V53O72UgJ/y1Ycc1nrqna5y816EWtxEoUtKaR5SPcl4yBFnNYzOMSfkstls8QywtMPy3UgGpn+JhHySr8yccWSec+b8FvacZP/M7gOXAF3Cgy2c0IJFHd1n6fAfrNKefQK9DOqC1GfaB2fkJQatzLqbXeK5VvqAC0Y3Qh9Rl4pl1Nmp1IQ6vDSC3IpG3y4nehmuxlXK08HytxEeeLc79fka6nn4OtGdtWQX/io1rh48QBPE0sIkIOkEdcw/NI04RcLvwWv4UjeBfWCOFvxIHGId1pVrrF4aiT61EPdY15a3d3eHLlpqAQWoV4F/1dSzkDYwhfS3qptLiBGwbelzXb1gl5b9dzJn+SPMBNL1s8Ys5UnBI7It3bHajgskY2mNekH0uYm9/uE7HQWj7Af8ZypdzuQZYDXUY1+UUHxthTj+69De7P6JQgHnCSXYI5qZIw7R3T2oKym8ZHOsp4BceSuHYmmGFrY15C6Zvy5XYj7QClpkOeaJ32gUVp+6I+3rqb//Jq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(186003)(36756003)(478600001)(1076003)(6512007)(6506007)(26005)(2906002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGhScnFObmFUbmRZVlJObjNnTTVDTFdWOU5HaisxZ2R4ZjY1RnNMY2pJUmVr?=
 =?utf-8?B?OXA4VENvM21EWVdBalcySk1yQjUzb3F4TitwazFic0M0VDhTS2gvQU5VNlJ1?=
 =?utf-8?B?anRrdllOdnMzUDN4YURLaGcva3JrM2g3T0FzTStJejFpd016a3kxTE5wa2d5?=
 =?utf-8?B?WmZWa29nM092RTJpeTBLY3lVdk9FTStKejI3UE9PUFNsWWtLSEdVNnJCci9C?=
 =?utf-8?B?Qy96RlM1dlh0c1NvRzJnQWRlbHBoL1ErY2Z0T3g0bUxqNHduZ1h0UWJRWWtI?=
 =?utf-8?B?RjVKUFFTZ2tYYTBFRnh1cVptUVFxZGNsc1REQkVXWTkzcGRpTmVkMVhJcHpm?=
 =?utf-8?B?YzBsSHpIRU1BTXNtNzFuOEZuWkp3Y1pRdDZzb0JGdkJkR1JSZ1B1bzF3Z1JI?=
 =?utf-8?B?MjJKSEZ0NXowZ1RIUEsyREtlb0lNM2pZbE5VSE0yNnhGTWxFWGYwM0NlMkUx?=
 =?utf-8?B?Zk01ei9sb1ZtRUtkMUJpckphaXVndHdLczVIUlJoekFJcm0vTWxLOGw2MW9z?=
 =?utf-8?B?N3F2YU8yWTF5Vk9YSmxJZDl3amUwTEQ0WkZuYmppMHNtbUlHZWtVOWdTVWxO?=
 =?utf-8?B?QzUrZmFmS0d5M2RMOVp3NVRSYmd3Q2MxRElTMFhpVStIcXhkbS9aTGJJT1JV?=
 =?utf-8?B?RVgrMitUa2pwcUZvQThMMldLNnYvZ3RiQS9kMlY5VXFSTmZNeG1rSzR0WDNz?=
 =?utf-8?B?eDR5alVta2diL0VlSXdEUjhyeFJWOWttMS9WaGttZUhiQk12d1ZBcUNUOVZp?=
 =?utf-8?B?Rkt2Q0JxZDArdjR5VU1wWGw5dTlZaVYwb0pLTnF5dEl2SzEvdlVVRHhFS2JE?=
 =?utf-8?B?SnVac3NpcGJBdk9mOFJCU1czM2J6WU4vQXdNUFdFYnFXa2p3T3lKWnNvQlFy?=
 =?utf-8?B?SmFMeVNpOENQQ3p0b2EvL09oa2FGUEtZa1N6bzIzYkRLNU1odGN5N08yMTVq?=
 =?utf-8?B?M2NXdTR2cWw5UDJpeXpibW04K1ltK1g2cHRlRjJPays1OVVTOXNUQllHazdZ?=
 =?utf-8?B?cWgxTEtMUTRUK0Fjak53WmlsV1ZwbXRmWjBoUmRSczRMOHpVaW4za1dLaE8z?=
 =?utf-8?B?bTlqeE9EOTBSL2h3QVY1ZllscWR6UmZIMlJ6TkQ5TDhUaDI0cDEybFZIWG1O?=
 =?utf-8?B?VVhvRmR5K2JPNjAzeWl2bUtJa3Q3OVA2bklRNnFxZU02UGRyUTcwSEw4eTZi?=
 =?utf-8?B?N0RYa1NUb3ZwcHNDN21sZmJObWVWREFHSUZjamw4dElXRjQ2TVJqZHVYSjYr?=
 =?utf-8?B?TVVRSk1Lc09UbjBZN0Z4Yjd3NnA0Q05MTnBxbmx3Zk8vVmczTkNxZ0daV1cr?=
 =?utf-8?B?K3d2TDhQRXlYY0pETndTaGdRcnhxTzltUFpla3JyL0VQenpDMzVVanp1ZFJa?=
 =?utf-8?B?Q1IrR2gzcER0QnBLaitPRGoyUkJJSDErdWkvazJTY29xdkcwM3p4ODBrYVhx?=
 =?utf-8?B?NTFnUURtREI0R1dVQngvclQwODQ1ZmhQV1lYekZJT3BPNUJKZlc4dDZlbUhE?=
 =?utf-8?B?MVhIQjZTTTZFYXVyRm5ZbHVFdnhnUWZMS2dLUUFTSUtQSXV2Mlk5RXY1L1Vu?=
 =?utf-8?B?Y0tCcG9lV1VPVkQ5ZWpRbVhSaDFBQ05tNlpiWGVlSjAvVUVVQk51SVQ0YmJ6?=
 =?utf-8?B?YlNxZTN4bVdWR0FJUnFvUzJRMncrZ1BweTJwd1VCZXhLY3E3d2ZSOVJVZU1a?=
 =?utf-8?B?cjFROHJEWlJGRC9NckxKdEtPMlJrMytPK2hKMzVrTCs4Q0k2TGJTNHlFNkZt?=
 =?utf-8?B?RmtTem9zSUxLeDhPMUJFeXpDbnFOdXpQVnVMcHJPVm5aYVRJZXRTckdtcTMw?=
 =?utf-8?B?dU1ZVkcyRDVobGlZS1lwQ0xwZ2xqSGJsMUVsUGZLZXMwNlc5T3RuMWxiVXVr?=
 =?utf-8?B?a0Z2b2lua2tYZjhzMk1vcm8yZGFZYU00K1kvNldBLzN0WTZQcC9QbjVPRFRW?=
 =?utf-8?B?L0xBV1RIVUVuWElZS2Mza3lJb0Y1cnlGL0xGSlBBaTRHcnpFTnMrTE0rWGwx?=
 =?utf-8?B?S3dqR2YzeWc5ak9PTDMramxJTFhPR1BHanpDYzF3d2FjcTVYbUlCOTNzQjJN?=
 =?utf-8?B?VGZCSmdlQTA5R0lHejNIeisvNmlsTlFDUHBYNGpSTjZBTDNuV1pSaVZHQzhp?=
 =?utf-8?B?L0dQaW42QkVjcHFheUhZVGR2c2NpQ2sza0VJaDc1bU9MUi9LVmhsdDFZOEt2?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0EuYKFdDNE/Bda9p1F8U1/+UqKhZN56DersOWL7gycX3fql+l9MKemcHRAA8ZMhsQpGnEnjRH+t5cD9VrlGX5uy6Q058Qcvi+hVFyhH6yLCXbJQHHAyxUKso23xiwrFPS/UPUidFqZKntseh5xP1r+La6DPewsVQWPTk9ieDmLQYXqdHvo6nStU5RNz7sd2+5xJXY88tyOJrpEFI9AOBuEeD7EAikNr+xN7HVhFuEDG2qjj9pO2RKJUkjwAnpeuiB0l9cQQG3pe5kyKHcb1+5OiT9eUvKs98IWXAMpsYt3ErdewTrJDUSC4Ro+HJcBC7fbNSnMfuc3ugSPtrevUb28Y69LYVLciaF3s1/OIwk5/7HSevdwZDN6tPXNyAKD0ybNqwOiYYwYIFDUsc6grOE+8oJr8QrzULCPnvi5oVdkmRi3yi9oMNJdBXycT3rd6QUhEeWrgIvFqVoQ4cowCGPwC3wSsdz69pcT2tApw9GY2zhHImEeWGi2xokI/TXfwAgp11sOmgnswWBO8oSqhh9BmoAzLNxoX7OeX5/vYq2k7zE00AmAdV1YghOYXaVkJuQ1ashoEM95drSlb45445c4bTUY9QWbeacFtcCEk3DdeyDiwMbuv1mhrNVfgHnFTRgWOTh/t3H4d/qP/tpnFZmjzXQlW8Ls56+w6r79lfEnnT0e5nw+2Vqt8fBYpsxl91wNltb6CFzFC7EK0eXYwvpSd8L35n7OtMVdd5V6V5wYo93f33ADCMtFd02iX06tmlsVTtAxrGqatelkVKHSrbIJtc6cAPn0tzZ9UvOccEgCywPz4qclla7gtxIaeKRJRu
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b730fe6-8e3c-4b69-bd64-08db6e6b3067
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:25.6715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ewbo0j0ICgYrl7thVrBp/tYV4h7sNdEohzU+xdmoGd/npOpz6DU+jkrwBT2FA2l0VeOjo+ogzoYFzPIxYUPo9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Introduce an interface that returns a specific MSR entry from a cpu
policy in xen_msr_entry_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Use x86_msr_get_entry.

Changes since v1:
 - Introduce a helper to perform a binary search of the MSR entries
   array.
---
 tools/include/xenguest.h        |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 0a6fd9930627..2672fd043cf9 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -810,6 +810,8 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
                             uint32_t leaf, uint32_t subleaf,
                             xen_cpuid_leaf_t *out);
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 630d0018529f..c67e8c458f24 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -854,6 +854,26 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
     return 0;
 }
 
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out)
+{
+    const uint64_t *val;
+
+    *out = (xen_msr_entry_t){};
+
+    val = x86_msr_get_entry(&policy->policy, msr);
+    if ( !val )
+    {
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->idx = msr;
+    out->val = *val;
+
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.40.0


