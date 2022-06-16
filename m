Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DA954E00F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 13:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350565.576958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1nib-0007uk-Lu; Thu, 16 Jun 2022 11:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350565.576958; Thu, 16 Jun 2022 11:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1nib-0007rs-IP; Thu, 16 Jun 2022 11:31:21 +0000
Received: by outflank-mailman (input) for mailman id 350565;
 Thu, 16 Jun 2022 11:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOxQ=WX=citrix.com=prvs=1593354c1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o1nia-0007rm-JY
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 11:31:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5f57152-ed67-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 13:31:18 +0200 (CEST)
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2022 07:31:15 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN4PR03MB6781.namprd03.prod.outlook.com (2603:10b6:806:214::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Thu, 16 Jun
 2022 11:31:12 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 11:31:11 +0000
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
X-Inumbo-ID: d5f57152-ed67-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655379078;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TrGuu1O6xyTnKuYPsaFomWjzxLP9McM8YjHAt6f03ck=;
  b=YaQ/ot3XbiQaVIsjxF3VqJ3lSfcr+dbUTWEVHaR5HE6Jn6Cthl44/RaZ
   rkaXMePFHUZngL4wqBdZ9b8KIiFwSzKLfmMfmNYPFzFlUovQ4S+jsnWR9
   9ZItlj/QTvIi4a6Ch3R2Zt1Yogh3/6CblqLRcQYY/uhkF22TJqPNzWeg/
   o=;
X-IronPort-RemoteIP: 104.47.58.173
X-IronPort-MID: 74166412
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:l9bxRKi8GS/PoBWf4uc2wmNpX161fBEKZh0ujC45NGQN5FlHY01je
 htvUDuHOf3eYDb2Ldxzb4Sz9UsGvpCEztdhGwA/qCsyFXwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVrT4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSMxAvPoyNUHaDdBOQ9uIIp0/OeYLEHq5KR/z2WeG5ft69NHKRhveKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI8ehWhr7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9w7M+/RrujK7IApZj5/dH9z5Xd2wZ4YIxViEt
 keczVygHURPXDCY4X/fmp62vcfNly7mXIMZFJWj6+VnxlaUwwQ7CgASVFa9iem0jAi5Qd03A
 1cP5iMkoKw29UqqZtrwRRu1pDiDpBF0c8VUO/037keK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy8qDqzPW0fKz8EbCpdFA8duYC8+8c0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNtGuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:Q3Gtv6jlREJGK0/SPnuFGWz5C3BQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.91,305,1647316800"; 
   d="scan'208";a="74166412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPxTv4U2bbEykJNxMlukz2yWjGa4Ovsidys9cj8hrqPR+vF+Q5k5wmLwkgfetlt6LMbwTVnB5ZPtbQp7WwVGsJHgaG6jINIHqU+hX9MYG3Cof8mnFMXTBZAStsds6OG5xd3ofu8IuKSH8MvJR42K40o3ybyEoEoCKJh9Ozt4liYqfcZRDG8pr7vLW6gScGUeCJv9tWfkz9cA1hT4DBOnMqVk6hHFWYjN09vNY1ZKdlvfRPvZ8+LtWQjzAlIh5tsRMtpHjaWOG50bQu22OS7dJqhbEzKUz0bMxm7V5jD0GOk+aG5sLT+HyNgryecWmjy9gkDUICAIXitZVAZIUNwcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDRUB+Tje9osuHlgCT/GCZN9hu9NnzZg4bn8F8g5oTU=;
 b=ePsmn5bI+zm5WjbG4tXuR4XJSJ+F9g8SxQCBdzi2u3KtqrrG3qGTli1Bjs3j31WcMqGLhZu8JQ/Ngt0uxleWi/vSgBz2JXvs1kffOOvbvSrUdUjvZFuw5GqAXu38fhEpTorPsmiWf53w3I6NXYMoY7WAamQp78TatfJBHhsVEJDZrgj0tbzUNr/5GV/5GAL8TGHPJyZKA8OcVF+s6FmRCmuJ0PKXNeiUbEqbtfn3uBXwt1LVW6T12qHTe6tnOF0SFQNxmRagYAIs3qfUCrvMf/C54V9nYRYYCscDpOQX83WQ0CcPPotOfkL6+JadEjxKdtOKrTDSUa1fgeN02j/oIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDRUB+Tje9osuHlgCT/GCZN9hu9NnzZg4bn8F8g5oTU=;
 b=k58goI6AXV/yOnmphjHQJ3YRIjGmztYK5jz/Q/rYJy3mASgZUOHMaG0J8ZSqZkEybm6L039wR05c5XLByenQk+fJIy5qAtct7VVxhm/mJ/U1/RysUUmjsv6Kct92yH2mgATKyT1hO3JxQrQ1Q1iymzm9JJjeIdqsoKL7OAH0IjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Jun 2022 13:31:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <YqsUfH763oSchRdW@Air-de-Roger>
References: <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
 <YqhHtetipYTG8tuc@Air-de-Roger>
 <72c94980-cbcd-d3b3-7aad-c9db58d9c4a2@suse.com>
 <YqhXFKMlIvkQzVoT@Air-de-Roger>
 <291bb0ee-06d7-af25-79bb-e099c7ff2fe1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <291bb0ee-06d7-af25-79bb-e099c7ff2fe1@suse.com>
X-ClientProxiedBy: LO4P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c81a3f51-714f-41ed-72aa-08da4f8bb70b
X-MS-TrafficTypeDiagnostic: SN4PR03MB6781:EE_
X-Microsoft-Antispam-PRVS:
	<SN4PR03MB67812310D2B7CB22E7D31DBC8FAC9@SN4PR03MB6781.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mmu8ieMJYv+UXLzMRGODQNALxPJKNj7hPBoDMYillfsmJiFEUp5kEXXoFP5HR9L0MgSiC7YsgsGFhKeZNaffU6Un0voFB0+4tEu2oUZ8d4eS8kwzdEalDAI823HgMWta9f45Wyd4UMvNiiZAQQX0njFrYmMVMSYKt+LIb8fLxDIgATu20gE3Eb/TUupwCT6db+8E0u4iXuWfPFYn47JdDvntKWKUAqumoXx2iI91bGngFM1ZqiW6vHTDoHo01pnsXNQ39xE9WhO++St3Xi+/xzwCLjvNR1GLGB8oJR2WWpmCg5K28UbJ2pH2caZGfRx0mQpj49WYPy1T/R6hhoL0uAjXOxp7qE1j4hZcJPuLpZpScXyTuos95RaMu+vvb0roOkJA7W0h9EgI0r+HMm+h2oDmwmzrvZXffa4miP55DbpA1HA4wM2uyUyPWfk1wJPiN/dYPXzebMiVsWTipU1HinWJYVwIMtCxWcScaO8v7wQ4kTeT/EMGDQk35XY0R/Mvdz2MSFz9GzN/3k2gWQ2d4zBrwEtrqRhM4rstTR7VOd1voL7ueSef0/GCuWV8d4hl5TmmoM66Z+GZDPuGK8AwX0FC277HLdoveV1kUWLmi1RiByiH8xPMb55cqP3gpJuR5o06ems2hNPSAhp7eU06Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(4326008)(6486002)(498600001)(82960400001)(86362001)(6512007)(8676002)(54906003)(6916009)(5660300002)(316002)(9686003)(26005)(66946007)(186003)(66476007)(85182001)(66556008)(6506007)(83380400001)(6666004)(38100700002)(33716001)(2906002)(8936002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnRRWGFlQW1vVGMzV1RTUnd5dExiZXZuc2NvdVNyTnJxV29CcE96c2ZlOEto?=
 =?utf-8?B?OEtETEhGSU5rVUlQVlVNaGhUSGxwRFQySDllejN1VUdZSm5Fc3VJbER6RDFV?=
 =?utf-8?B?L2NDQmdWUDNQZ2hUbHRhSmN0T2oxdWhMUFZPSWJJNjU3ci9yZWFocTlhYTFi?=
 =?utf-8?B?a1g4SjMrYWl5SGptVVh1a3Q4OW9oTG9QMS9MUmR2eWx1UHRDY2d1Yk50K3JJ?=
 =?utf-8?B?a1AvZCtkUk5hT2RVMFByUG5DMEgwZVJNNkN0TGdJMmJCMW04NkVFSUpxUk50?=
 =?utf-8?B?K1gyYVE0bi9LYTdDK2tXZlRSVUp1anVRcHovc0ZkSXFNSzliNk5sZ3RMN3h4?=
 =?utf-8?B?UEtrZkVrRFVXa0lUL2JJc1E5NE92RDhkaXFLZk1JNGxCdElmTkpWb1VRandP?=
 =?utf-8?B?RE5sRVdtN0hwNXozdVpZd1NuVSt0RG9qcjBvcUZoeUU5ay9XTklBSXpCN1ZQ?=
 =?utf-8?B?SkgxWWV3VUtJTFozZFVWZjIvWDVNY2dDY2F3cHoxY1QwbzV2SmtBT3JKVjI4?=
 =?utf-8?B?MDREc3dkRGRvbnV0a0xSNFIvR0N2K0cvakxzRThrb1ZCdUZucG81ak9vNFRT?=
 =?utf-8?B?a0ZUcW9nOXBBaHpWOWprd2h1WmJwMVhwOFZ5alJ6eGNld1J5UW1VNkVIbDRn?=
 =?utf-8?B?THFVZU44MmRkNndPVm9qSXhnRHp4bm10MVhBR2JzTGpSQnNuaUszdTFOU29W?=
 =?utf-8?B?Umtxb2tXeVgzVVNtSG5hSjJ2a1I0UUtPQmk5bC9UNW5RRXZJVUVTeVVobHdE?=
 =?utf-8?B?WGVSWXl5c0JCM0w1TWRuWTZMYkJzZEJMMC9qZlFrUGM1dHh6dXBnbk1mWG9J?=
 =?utf-8?B?anNPbzQ4VXpSOTZXME83SXc1OUZJSkVFV2Z4NVN6YUlDazNPaUZqSHl2OUdV?=
 =?utf-8?B?V3NDWU1oTFdyTlYyWGtkQjFFN1JOVitFN1Bta2ZvZUdTRStXWnNjMmxvZWFT?=
 =?utf-8?B?azd0SHRXeWtqUmdvQ0VFbjhGQmNrK3pCUkRwYWc3Q29Mbi9Vc040R2hRTldV?=
 =?utf-8?B?dElTQUxVREdMM0h2WHV3aDZmZHNjUHBSVjZQUkVadTNSNFQzQUZxTEhxeDJ6?=
 =?utf-8?B?c1NvQ090WFRBMzhwbTRma0lnQ1NKTDlZV3IyWE1POGo2YmRCWTdmeW5PZ04z?=
 =?utf-8?B?R1h0bG0yVUtORDd0aTVBQUNXSWZJcmwyYmp5eDAzMWRLQU9KL0V0aFYraU1B?=
 =?utf-8?B?Z0RvcmtTc3ZNYks5Vk9pUzFHeFhJc3lCemtWcVQ2Tm11bTVtaWV1WFhaZXFB?=
 =?utf-8?B?TGFuOFRhV3dOSW9idDNkWElBbXM1RWdXZ0RPL1QvbXdRWnBVNjV4eVR4Ylpu?=
 =?utf-8?B?c3lVc2Jmc0M4SVBuUHVLMEtNSGZFWW5Kai9EMlc2VXVxM3FtOXBSaDYvaktW?=
 =?utf-8?B?UUFvVGhPRHljL3VnVER0NFk2Q05yV2VCdVZuQ0xGK2hOeGdyOStQWUZsbW5F?=
 =?utf-8?B?dmNuaHFQL1haT2hsMUF4TUNlT0U3VVNma0ZCR1I2V3RmNEgvSEhVWWRXNmNH?=
 =?utf-8?B?RkdKSUN1V2hJa1lvTTk2bmFFNEQvaFI2NXlySTV6NW9kZVl4OXFMZ1RyeFZI?=
 =?utf-8?B?Rk1zY0pQSkFuZTlLa2JoNW9URWI5eXBmbzlNUU1LcytLRFAzOFA0WVBWZUJV?=
 =?utf-8?B?RFY0ZnlZNEY3Z3BmMUdVUzRpSU5aNGpCeURjZ3VoUmZGdDJNL09TblBwdmhE?=
 =?utf-8?B?NXBTbDZjNk10VHZDSlV0RHVrT1B5cURrdnVjWkxXaGdwQzNlUDBsT0MyanJW?=
 =?utf-8?B?MGFIcUlEMEVyNFBRQzFPK3VmWmttMFkxN2NpN2oycXNVL25zZWk4QzQxd3F1?=
 =?utf-8?B?YVBidFRNUjZPQXpaTlBpZFMvQk5MRVhjbHlIMzZZVlAweGIxRHh5cHVtQnI0?=
 =?utf-8?B?Y21GdEo3WlBmeVFHaUJ2WG1wNUY2aUh2cDIxeUZOR01DcUZwUWt0OHVoc2Ez?=
 =?utf-8?B?ZERNVTdJWjNGVVc5YmVCTDNNN2M5SkdqSzFob2xMTHd4WGE5Z1BTOTB4LzNr?=
 =?utf-8?B?NFlCWmVyM3piSEphWFl5bE80WWZEQVh0ODAyZXhGM0VLaXI2OHFPZmVlZlZD?=
 =?utf-8?B?VFRLYzU4d0MyWFNROGhpSWc5eURJeHhYTGFmdFFFQVZyVUJlUVlnKzdjS2xu?=
 =?utf-8?B?aTNRZ2dwbzhKemdjOVd4YVB6cVlzcGhxZzBOU0tjRmdLVGttd2tjcnoyMjNB?=
 =?utf-8?B?c005MjhZNGhvQkQvUDBEQXFSWEU1MDV1dmc1azIrN0xCd1RDY3VSb2VLaU5B?=
 =?utf-8?B?elNiN3JNaTZuamNxcUVjZVZvWnN6VlBhUWZ0cFBPZktTdTdEbnlxYnJ3bHVv?=
 =?utf-8?B?M1N4aVl3YjI2M3NGRVBGYnE0L3VQOENIeDUvRnVjS3hnQ3B2OXlHbGRGSGdN?=
 =?utf-8?Q?aATn3J+hx9mFEbB0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81a3f51-714f-41ed-72aa-08da4f8bb70b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 11:31:11.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTkX2Hu6qY5ymFN2Y/hn8cHfR3OtuUgvqWDocYmd9zRSCREhOlMuP0uidXB/gjCqyVNhGL3u0ZPHRywYEQJzYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6781

On Tue, Jun 14, 2022 at 11:45:54AM +0200, Jan Beulich wrote:
> On 14.06.2022 11:38, Roger Pau Monné wrote:
> > On Tue, Jun 14, 2022 at 11:13:07AM +0200, Jan Beulich wrote:
> >> On 14.06.2022 10:32, Roger Pau Monné wrote:
> >>> On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
> >>>> On 14.06.2022 08:52, Roger Pau Monné wrote:
> >>>>> On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
> >>>>>> On 13.06.2022 14:32, Roger Pau Monné wrote:
> >>>>>>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
> >>>>>>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
> >>>>>>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
> >>>>>>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
> >>>>>>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> >>>>>>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
> >>>>>>>>>>>>> Prevent dropping console output from the hardware domain, since it's
> >>>>>>>>>>>>> likely important to have all the output if the boot fails without
> >>>>>>>>>>>>> having to resort to sync_console (which also affects the output from
> >>>>>>>>>>>>> other guests).
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Do so by pairing the console_serial_puts() with
> >>>>>>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
> >>>>>>>>>>>>
> >>>>>>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
> >>>>>>>>>>>> important than Xen's own one (which isn't "forced")? And with this
> >>>>>>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
> >>>>>>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
> >>>>>>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
> >>>>>>>>>>>> not convinced we'd want to let through everything, but perhaps just
> >>>>>>>>>>>> Dom0's kernel messages?
> >>>>>>>>>>>
> >>>>>>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
> >>>>>>>>>>> this request is something that come up internally.
> >>>>>>>>>>>
> >>>>>>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
> >>>>>>>>>>> limiting based on log levels I was assuming that non-ratelimited
> >>>>>>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> >>>>>>>>>>> triggered) output shouldn't be rate limited either.
> >>>>>>>>>>
> >>>>>>>>>> Which would raise the question of why we have log levels for non-guest
> >>>>>>>>>> messages.
> >>>>>>>>>
> >>>>>>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
> >>>>>>>>> levels and rate limiting.  If I set log level to WARNING I would
> >>>>>>>>> expect to not loose _any_ non-guest log messages with level WARNING or
> >>>>>>>>> above.  It's still useful to have log levels for non-guest messages,
> >>>>>>>>> since user might want to filter out DEBUG non-guest messages for
> >>>>>>>>> example.
> >>>>>>>>
> >>>>>>>> It was me who was confused, because of the two log-everything variants
> >>>>>>>> we have (console and serial). You're right that your change is unrelated
> >>>>>>>> to log levels. However, when there are e.g. many warnings or when an
> >>>>>>>> admin has lowered the log level, what you (would) do is effectively
> >>>>>>>> force sync_console mode transiently (for a subset of messages, but
> >>>>>>>> that's secondary, especially because the "forced" output would still
> >>>>>>>> be waiting for earlier output to make it out).
> >>>>>>>
> >>>>>>> Right, it would have to wait for any previous output on the buffer to
> >>>>>>> go out first.  In any case we can guarantee that no more output will
> >>>>>>> be added to the buffer while Xen waits for it to be flushed.
> >>>>>>>
> >>>>>>> So for the hardware domain it might make sense to wait for the TX
> >>>>>>> buffers to be half empty (the current tx_quench logic) by preempting
> >>>>>>> the hypercall.  That however could cause issues if guests manage to
> >>>>>>> keep filling the buffer while the hardware domain is being preempted.
> >>>>>>>
> >>>>>>> Alternatively we could always reserve half of the buffer for the
> >>>>>>> hardware domain, and allow it to be preempted while waiting for space
> >>>>>>> (since it's guaranteed non hardware domains won't be able to steal the
> >>>>>>> allocation from the hardware domain).
> >>>>>>
> >>>>>> Getting complicated it seems. I have to admit that I wonder whether we
> >>>>>> wouldn't be better off leaving the current logic as is.
> >>>>>
> >>>>> Another possible solution (more like a band aid) is to increase the
> >>>>> buffer size from 4 pages to 8 or 16.  That would likely allow to cope
> >>>>> fine with the high throughput of boot messages.
> >>>>
> >>>> You mean the buffer whose size is controlled by serial_tx_buffer?
> >>>
> >>> Yes.
> >>>
> >>>> On
> >>>> large systems one may want to simply make use of the command line
> >>>> option then; I don't think the built-in default needs changing. Or
> >>>> if so, then perhaps not statically at build time, but taking into
> >>>> account system properties (like CPU count).
> >>>
> >>> So how about we use:
> >>>
> >>> min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))
> >>
> >> That would _reduce_ size on small systems, wouldn't it? Originally
> >> you were after increasing the default size. But if you had meant
> >> max(), then I'd fear on very large systems this may grow a little
> >> too large.
> > 
> > See previous followup about my mistake of using min() instead of
> > max().
> > 
> > On a system with 512 CPUs that would be 512KB, I don't think that's a
> > lot of memory, specially taking into account that a system with 512
> > CPUs should have a matching amount of memory I would expect.
> > 
> > It's true however that I very much doubt we would fill a 512K buffer,
> > so limiting to 64K might be a sensible starting point?
> 
> Yeah, 64k could be a value to compromise on. What total size of
> output have you observed to trigger the making of this patch? Xen
> alone doesn't even manage to fill 16k on most of my systems ...

I've tried on one of the affected systems now, it's a 8 CPU Kaby Lake
at 3,5GHz, and manages to fill the buffer while booting Linux.

My proposed formula won't fix this use case, so what about just
bumping the buffer to 32K by default, which does fix it?

Or alternatively use the proposed formula, but adjust the buffer to be
between [32K,64K].

Thanks, Roger.

