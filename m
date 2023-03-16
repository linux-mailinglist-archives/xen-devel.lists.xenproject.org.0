Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6DC6BCA1E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 09:55:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510389.787955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjNs-0001M9-Pu; Thu, 16 Mar 2023 08:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510389.787955; Thu, 16 Mar 2023 08:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjNs-0001J8-Ms; Thu, 16 Mar 2023 08:54:52 +0000
Received: by outflank-mailman (input) for mailman id 510389;
 Thu, 16 Mar 2023 08:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcjNq-0001J2-UK
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 08:54:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32d7a7fc-c3d8-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 09:54:47 +0100 (CET)
Received: from mail-dm6nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 04:54:43 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB5861.namprd03.prod.outlook.com (2603:10b6:510:3a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 08:54:37 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 08:54:37 +0000
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
X-Inumbo-ID: 32d7a7fc-c3d8-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678956887;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0/P2v3d8BMk7UXVCr6QZrcZrJf0h0xZGuyiIBOCWAJ4=;
  b=GB9SL2Bln555B7JUKp306x6US3StMBJcVZ10XmYPGYJ57575PM+qJMiu
   F0u2WyIv3ToV0kW2A1X31GOl76vvjsBS4J8XxhJBnFeaNwg1qXYkL70iI
   YZejlg5OvQtA8ehVMd8n0UkxNpj+G6+MfEYOxrPZWNTbGEa6Mpyv7Wi3X
   M=;
X-IronPort-RemoteIP: 104.47.73.44
X-IronPort-MID: 100989999
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1VVcE69BkLVgz2wiSPBRDrUD7n6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2EbXGiGa/mOZWT0et91b9nn/EpQ6pTXmNZnQVZppX88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkV5AG2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklI8
 schOAISUSuBmr7n4Iy0Ycd9gt4KeZyD0IM34hmMzBn/JNN+HdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeIilAtuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eXzHOqCdNDfFG+3t5qgliomnVLMUUTZVe5gvuJqWqVYc0Kf
 iT4/QJr98De7neDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL8+Q+IQGgZRzhOQNUjuIk9QjlC/
 l2Dks7tBDdvmKaIUn/b/bCRxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdMTj0z
 iCDqiQznfMfgNMA16ih1VnCj3SnoZ2hZgU1/ATMQmOs6EV6Y4OjZoOA4F3Xq/1HKe6xdUWMo
 3Eeh46+7eQCAJuXnSqBaOwIEPei4PPtGDfBm0xmG54t8Cuk03GmdIFUpjp5IS9BMsECdjvkY
 RaVuR5Y4pB7NX6mK6RwZuqZCdkuzKGmB9TsUP/8Z99CJJN2cWev3iB3ZEeWmUvtnU4EmKQzf
 5ycdK6R4W0yDK1myH+6Qrkb2LpzmiQmnzuPGdb80git1qeYaDiNU7AZPVCSb+c/qqSZvAHS9
 NUZPMyPo/lCbNDDjuDs2dZ7BTg3wbITXPgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:3QozEKE9RNosB7hipLqE7MeALOsnbusQ8zAXPhZKOHhom62j9/
 xG885x6faZslwssRIb+OxoWpPufZqGz+8R3WB5B97LYOCBggaVxepZg7cKrQeNJ8VQnNQtsp
 uJ38JFeb7N5fkRt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="100989999"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfAwYqhtzVL0mCKu0d4xXjIcjYB8AF9iMYSm7jCEf1G0JV/V1A+62o4m/jKn6F3uPYYbvZj/29obAwGLolG7aNrqD9MeUrZSiBcr4kwNrSYJLt6xITmgX0dveaLjY2MiRKAZcnknpF+B40HMKqePj9nzZHBr0G86Lv2GElv1XNoQFXaGNcTtDE65D6ifDfQK93sPPixLrRWqGwxsUsoS2CYpxOSqeZCFaNPYG/ufX7YxMUrpeTAkXURP4Y5DlxSpjMq61xJMZhDXNGxD2qPyRKd6Q6R5gZH3lC0grY0rOQ4AmSK/CigS7Zhxw7b4vVLHzq6YQ3b/yLUL6120PjprQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaYPxTxhzS68gjrMW2jNThGV0qPmZ6WiN4tI6D72svk=;
 b=cCcTMTsSrbCBcdFVmv4h00rWchWAdq2JIr0FWX2Xiu5JIl0krL4eQetZA0S5lxTQadFGkVA82oWlR/Z6ovlDXFoxQEqJ7BLa6Y1++zx1VbfpT6fNh/11lm/nm2ahYlqOZRlft4ZEeFYjSGCdOlGDi6f4Y1zaoFFA6+hwGA80v9NE8swj8UDfdjQGNUHQ9MFn6BX9c0VkJotbkVBl0gSQu4ZMmjcFQJWRBEURktz4mrJm/3PDUiOCmU7EfIdWbaYVCDgOV512zgT6741v+jVwsSYova3cewiEEvbwzY2ce0axYg+Ctk+Yk9RDlvDiBcEkVrahcApqyfBph26mlzAWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaYPxTxhzS68gjrMW2jNThGV0qPmZ6WiN4tI6D72svk=;
 b=p2M4A293QZKSfDh4Fr4udUI+fHBau6i0ys/sTCKjEmLCZsV7a6twZEHKeXhVEMD/0iMAQMsCYdyYnR3G6pm4NIYjcuOl6tTw4+bwC1HAdzjJ0qp+DjoiEIw0kq5WeM4aWCgC+CU/cToGch7NJodUBTyFv4bs1UoGHv5W/YgCJHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 09:54:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Huang Rui <ray.huang@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Message-ID: <ZBLZSEc17HjCmOu/@Air-de-Roger>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-7-ray.huang@amd.com>
 <ZBHz7PpUbKM69Xxe@Air-de-Roger>
 <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO6P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 880eb98d-6f89-4e80-d0c3-08db25fc1268
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nH64tLGYad7ONOaC63xEmJNVFApJy5DTvdX/ZLyAWmAMDaTYBWB6zly+gX2M4Oi3RWAlxpBcd/D2/FSgCDnj+ryBEAyfgTiWz6McpwG+QcBaAHpEpUK3jakHutV86GfuisSwA470rAfksY/2fkJvTs8YN+BZmQ/IF5fGj1Ars5sIVCjDzr62P1xr2EFWgSEY7Xz5W5xI42NzQuVYSP5yUIzGsMa2dOPJ6si6y2tTctpbgIWKG/RNg7CokhmSgWDF5mCXUQd9sy2G4DCJmRXKFp3PVQcLh7aZa0jlkj933ZvdfNC3bKAwv99V9gt7irIshC0+5XZbTuDNVLjKXwISs99dElliDr1+XDyx8vcurZ11sbaoDx+Co7hjoIK3HOVlZTDBIx1aMD1BIarCzuyYsFMI8JizXIoMAhsAksrR/VI20cU8IsCQY+vmXGfFNlqdQTQFD6sqbEYhWLexDIKsSCR35cvnv67adSoaaLWxPCFoyuZx+1TfKkZJfKKFhIqwjhrnJXlsBYh1581Xq1l0DMZvBVYJ5+f8bjJ7NQNw9jepDokiQd3GykHFp4tC5xSQbrDla7IknhCD8LrshUNKXufCNYBlprMQqetGcyGzSIT9VKQjPhaCxd/ESo5qrLx2SyveECRZLJGq9vP4JmBZkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199018)(33716001)(85182001)(9686003)(186003)(26005)(66946007)(66556008)(4326008)(66476007)(6916009)(8676002)(41300700001)(316002)(6486002)(478600001)(54906003)(6512007)(6506007)(6666004)(2906002)(38100700002)(86362001)(7416002)(5660300002)(8936002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFBpRm5vN1orbDE0eU5KZkhHMWhocVdSNXdMdTdTYmQ5RjdBT3VPQ2RZT25V?=
 =?utf-8?B?TzZPanpmTkNhL05aYTM5THhtRU9lbGFYbEFxZUQyNGRrYW1RcVVNU0FnaDdS?=
 =?utf-8?B?QzZuMVhYemQ4TkNnU2dQWEVwcGd1eStobWt5VFpQMDhhUDVZeC9rK1JmMTlN?=
 =?utf-8?B?dkNTTjhiV0dTWHRRQk5PYkk0Nmt6RHpVdCtkKyszQkxLeStqZVo4LzREcTNG?=
 =?utf-8?B?Q05VTytmTUdWZTR0RmhYclR3TlZyMGl3YmdsUGd4VVlaM0tjUUMxMVV6TGNv?=
 =?utf-8?B?NnRJd2FucHhwbENIN29qSndhdnNrUVRpRFl1UWhmQWxDS2ZnV09wdXU2TnN4?=
 =?utf-8?B?Skt2MjdjNDlVcU9CcmI3QTd1R3hiK2ZJd0xnV09wNDVwSTJmUWpyWWZHaWJU?=
 =?utf-8?B?dmNKN3ZXNS9tekd2UWVneVFrMUNqekZ1NDlaWG9lbGZ6cTJiaVQvMXZId1pR?=
 =?utf-8?B?YmtDTmxrMStHd2hHa3Iwc090MVZyQlNmejhERTF1eks4Z3lRd2t6aDBLd1RB?=
 =?utf-8?B?Z1RpNGwwRDJSU0c4SmhWZWRYUDVjQ3ljbzFlL0RGa0ozSENIV3VhbzdBVU9V?=
 =?utf-8?B?TWVVYlh0MW1pOTV1RFQ5QnU2Q1JjQU1RNEIrOWozbU8rVU0vc0NYRTFLc0xE?=
 =?utf-8?B?UTBwRDl3cVN3eXVCeWpsallNa2wzeUdjSlRSSjJvTnIxeUtJK2Zzcmk1ZXdJ?=
 =?utf-8?B?NEpsM29QenZMYWhvaWRLbVA4NDNDN0s0MXdGMER5UmRmTm1PckZXUGNzV1FL?=
 =?utf-8?B?L1N4SmJob3pja0ZRdVUzR3hlUmYyZUlqbmgwYWVxSWNRemhnQ2lQcU9FRzZJ?=
 =?utf-8?B?SkF0WGU1NVhnUC9hcEZUa3JDeG0xSHFCZVNhQ05odUFrREE1aml4TGRXVWVi?=
 =?utf-8?B?SHNiV2pzUGlmTVlIQ0VxdnRZNUVUUGZvVFFOTEZLSEN5cFJhYW1HZmdPeEVp?=
 =?utf-8?B?U1FoNitKa01PQnIzNE9VM1pKdXdQeUxDNkV4azJjV1JzVnRYRTJvWHBIckhn?=
 =?utf-8?B?MkdRaFMxd3owNkFxTG05dFhKMXlOb2pBK3ZiZmhka1VUT1pYTDdycXYzWVJS?=
 =?utf-8?B?WE91ZTJBM21mSUZNSmQ5dXhTZTNkazhqem1xU3pUb2xsYVJieG9XZlF1endM?=
 =?utf-8?B?aDZnM25NbWlkWVQ2NUJOREh4WmJ5OFZMeUVDT0RlVEFSQkRRZ013THJsWElW?=
 =?utf-8?B?cCtIUXA2Ty9OUWxCbUFGdHo3NkNDL2psTFcxeVlhR2hxcjdiZ09CWXRrWGFl?=
 =?utf-8?B?Z01XajBTcVBVbDNRUnZnbU5nRjYwNFk3Nm5NUWNjWWFMNkxrRkhXeHRsUUNV?=
 =?utf-8?B?V3VtaGlKeEMxWHNTbXpkNzJvQm5YSFM0OWh2VkptcFc3VjdsVnRTSjdNMStk?=
 =?utf-8?B?RHJYMUoyaTZUREw1VTdiczFtNlZDcVpveGtpWVdJbm9nWlVMbmRZWnhZTE04?=
 =?utf-8?B?Z055Z0VrTStJWGV4RXlVTCtkUzBQZWNqNWw4Vmtwb1AydDl3ZFdDWTFBZ3dD?=
 =?utf-8?B?RUd3cFBNRzM2bUxSQUM4M1pTbHY4dnhDWFc5Wk15L21IRGVhL1liN2RDTzRS?=
 =?utf-8?B?S2pCQ0E5aEVzaC9nUE05ZUpvRFhrS0VJaFRXNjhmYzU5UEFJTEp2WDFYSnFl?=
 =?utf-8?B?UVFTYWd4YmtHY21rcEx0Z1pkY0N0VnpSOGRaOEFWUEliZzZoQjVkSEc0dUdJ?=
 =?utf-8?B?NmM5QXBzMkI1c0lBcFFLWkcwaU1uck40S1Zlb1hEazIxRjB0dEFCUkZRV3U1?=
 =?utf-8?B?czM4Q3BuUloxQUdwenVucE5LS1VyM2F5VTRyL3EzUUhBMC84bmdKTHVUS005?=
 =?utf-8?B?aFd2ZjkrY1daVUpWNGZneitNTjdWWTZsZE9FSTZCRml2b055cG5TWDF3SU0x?=
 =?utf-8?B?aW1PYjFCMUIxaitQZERsbDJUYWhpVHp1dElQRThoQ2lxTW1KMkp6ZGFvc3ZE?=
 =?utf-8?B?QU95VU9WUTlrOEFWODRyQ3J2c0x3M2FPTm4xRHJNZ2g2ejB5Ymh3RVcxUy9u?=
 =?utf-8?B?SGduTktXUmJpQk9vUGROZ0hidmpON2pyRzBubXhqZGdlbE1wSlN4V2Y2cnFO?=
 =?utf-8?B?Wnp0NW5GR09ZSkd6elFqL0RPTk5DaWRZY3FycVNhNDBHN3puYUk2U2dhemho?=
 =?utf-8?B?MlpjbS9tU1VmUjNkSGtjMjhlODJEN3ozNGVCUUZsRks0WnRocWx6cjVrMjlB?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2a7U8fkeye43ESf3Kk5ApGpiMJbY3NQb1858PXFQC5MYmNAJlKX+00MxG6ieg+8mN+6txmjBXj6HSTPtTpeUzfnhBxdLNsiK7C2cJPe5iLySx1efIr4ZeWI7mgHADvgXMgMQd9GW4ICBsaOv0l9e4DZD9SnsNYwnZkqxNxcKla5MTbwpqaj1+75KhGbFG3oH21rEH9a96pwXIcPsY2EEMvQ1FND6H+kqSaU7n0TF6Ub8S1G6l8dFIir1tUVFIzPOSwJgU0h2fHGARc8VbS29BRNQuZ+T5fqKo2ZqqGyhVSsdXESUAXhtrtRhAnJBgI12IxEkZp76GWHjpsPZwxENxKyuFwOEICvp3OjKkdpQbmPX/hKq8VpurqLQ66QREFXrzHO2irBop94P4mSy1h0MG+GtTWUzFQYHLEM536bBkw6hpHAAre7Bwx2Uz+bnwcLmAS5C0NcARtIMMzW3+69pCSbDqCzkwqbN0RvntzWx1ox/MykNx7uVJHyXAa1ShegfQppEaUIHrddYrdlyv0SU30amQqXQRNorxK4ha4YQwBndX+txxUpbUUFyb7IZfeWnjlr4wawSvtfahaanFuNN9zlZVZvLbRqWHZNv5kPatSkzuOIds6F5UDAsfChQYiK6szPAMJtlZeFlICO6XUdJNJMBgh0f+VDccScLCWOo5yJNxw5kHYczg39BN9VyRPQTkN1Z6UPXNlNh8ROmHJsnvbaV+u0oR7j5Xz09aOjpEeuCxiGE8RX1cqqt56GKdUYyUVtkZnqLqLJag/oPTqDE28EU6wA6B0UxeyxeyIi6b16HSHKOlVdbRDhmsfsx/2PZHxAI4EfepBR7VRuEQ+VJdJ9LI//9IkTGQA5oyy5tRpaTIjehFlXquCF+y12MjvWY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880eb98d-6f89-4e80-d0c3-08db25fc1268
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 08:54:37.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLQtkJBPtEX5n2hBkoR0uFLXEuCAt0BPYwUsHIiZ/AU9+ZvaoDHv6Lhq9uK/YwDotR+UKinb2EhtmRZhHgFTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5861

On Wed, Mar 15, 2023 at 05:44:12PM -0700, Stefano Stabellini wrote:
> On Wed, 15 Mar 2023, Roger Pau Monné wrote:
> > On Sun, Mar 12, 2023 at 03:54:55PM +0800, Huang Rui wrote:
> > > From: Chen Jiqian <Jiqian.Chen@amd.com>
> > > 
> > > Use new xc_physdev_gsi_from_irq to get the GSI number
> > > 
> > > Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> > > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > > ---
> > >  tools/libs/light/libxl_pci.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> > > index f4c4f17545..47cf2799bf 100644
> > > --- a/tools/libs/light/libxl_pci.c
> > > +++ b/tools/libs/light/libxl_pci.c
> > > @@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> > >          goto out_no_irq;
> > >      }
> > >      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> > > +        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);
> > 
> > This is just a shot in the dark, because I don't really have enough
> > context to understand what's going on here, but see below.
> > 
> > I've taken a look at this on my box, and it seems like on
> > dom0 the value returned by /sys/bus/pci/devices/SBDF/irq is not
> > very consistent.
> > 
> > If devices are in use by a driver the irq sysfs node reports either
> > the GSI irq or the MSI IRQ (in case a single MSI interrupt is
> > setup).
> > 
> > It seems like pciback in Linux does something to report the correct
> > value:
> > 
> > root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
> > 74
> > root@lcy2-dt107:~# xl pci-assignable-add 00:14.0
> > root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
> > 16
> > 
> > As you can see, making the device assignable changed the value
> > reported by the irq node to be the GSI instead of the MSI IRQ, I would
> > think you are missing something similar in the PVH setup (some pciback
> > magic)?
> > 
> > Albeit I have no idea why you would need to translate from IRQ to GSI
> > in the way you do in this and related patches, because I'm missing the
> > context.
> 
> As I mention in another email, also keep in mind that we need QEMU to
> work and QEMU calls:
> 1) xc_physdev_map_pirq (this is also called from libxl)
> 2) xc_domain_bind_pt_pci_irq

Those would be fine, and don't need any translation since it's QEMU
the one that creates and maps the MSI(-X) interrupts, so it knows the
PIRQ without requiring any translation because it has been allocated
by QEMU itself.

GSI is kind of special because it's a fixed (legacy) interrupt mapped
to an IO-APIC pin and assigned to the device by the firmware.  The
setup in that case gets done by the toolstack (libxl) because the
mapping is immutable for the lifetime of the domain.

> In this case IRQ != GSI (IRQ == 112, GSI == 28). Sysfs returns the IRQ
> in Linux (112), but actually xc_physdev_map_pirq expects the GSI, not
> the IRQ.

I think the real question here is why on this scenario IRQ != GSI for
GSI interrupts.  On one of my systems when booted as PVH dom0 with
pci=nomsi I get from /proc/interrupt:

  8:          0          0          0          0          0          0          0   IO-APIC   8-edge      rtc0
  9:          1          0          0          0          0          0          0   IO-APIC   9-fasteoi   acpi
 16:          0          0       8373          0          0          0          0   IO-APIC  16-fasteoi   i801_smbus, xhci-hcd:usb1, ahci[0000:00:17.0]
 17:          0          0          0        542          0          0          0   IO-APIC  17-fasteoi   eth0
 24:       4112          0          0          0          0          0          0  xen-percpu    -virq      timer0
 25:        352          0          0          0          0          0          0  xen-percpu    -ipi       resched0
 26:       6635          0          0          0          0          0          0  xen-percpu    -ipi       callfunc0

So GSI == IRQ, and non GSI interrupts start past the last GSI, which
is 23 on this system because it has a single IO-APIC with 24 pins.

We need to figure out what causes GSIs to be mapped to IRQs != GSI on
your system, and then we can decide how to fix this.  I would expect
it could be fixed so that IRQ == GSI (like it's on PV dom0), and none
of this translation to be necessary.

Can you paste the output of /proc/interrupts on that system that has a
GSI not identity mapped to an IRQ?

> If you look at the implementation of xc_physdev_map_pirq,
> you'll the type is "MAP_PIRQ_TYPE_GSI" and also see the check in Xen
> xen/arch/x86/irq.c:allocate_and_map_gsi_pirq:
> 
>     if ( index < 0 || index >= nr_irqs_gsi )
>     {
>         dprintk(XENLOG_G_ERR, "dom%d: map invalid irq %d\n", d->domain_id,
>                 index);
>         return -EINVAL;
>     }
> 
> nr_irqs_gsi < 112, and the check will fail.
> 
> So we need to pass the GSI to xc_physdev_map_pirq. To do that, we need
> to discover the GSI number corresponding to the IRQ number.

Right, see above, I think the real problem is that IRQ != GSI on your
Linux dom0 for some reason.

Thanks, Roger.

