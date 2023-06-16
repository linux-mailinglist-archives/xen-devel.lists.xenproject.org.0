Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059AF7334D1
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 17:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550290.859277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qABOc-0000e1-R6; Fri, 16 Jun 2023 15:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550290.859277; Fri, 16 Jun 2023 15:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qABOc-0000cG-O8; Fri, 16 Jun 2023 15:29:54 +0000
Received: by outflank-mailman (input) for mailman id 550290;
 Fri, 16 Jun 2023 15:29:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qABOb-0000cA-4m
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 15:29:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1f73a11-0c5a-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 17:29:51 +0200 (CEST)
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 11:29:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB7075.namprd03.prod.outlook.com (2603:10b6:806:325::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Fri, 16 Jun
 2023 15:29:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 15:29:38 +0000
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
X-Inumbo-ID: a1f73a11-0c5a-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686929391;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8l2IOP+pPMfpJVIMig30zcUqDszr92zBrLUZzk/D10Y=;
  b=fkT48PvePeWXG49IM1sbXb5ZXwLdwZoBolos8XuaGHlDpVJCEbtmWHjB
   uScsP7ZwCocfFi4eg9r/kqIhHbbAjDnPICl8/8LvJcSbJ2R0g1KtEAZvj
   /XB93CZI2OcPesi1nqjI3+2OtPX0uzNuTaexidi0hNUABT73Ss/MkGy94
   M=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 112407735
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:g2br1ajwwNVN4LxlDmRKyKZYX1614hEKZh0ujC45NGQN5FlHY01je
 htvXT2PPvuKZmOgf40jOouz9hkF6J/cydM1QQZqpCk8FyIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gaAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQVeRcQSznd19moxeypRNVxuu4FMuDCadZ3VnFIlVk1DN4AaLWbGeDxw4Yd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluSxWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTefkrqE12wD7Kmo7FzJJRRiV8NCFgWGYRvhnd
 BIY6iMFlP1nnKCsZpynN/Gim1afvhcDXfJZFeQh9AiWjKvTiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313quMoDqoIi8TBXULfTMDVwYD7NjlrYwpjxTACN1kFcadhdTvFTb96
 zuDtiQ5ivMYistj/76g4VnNjjaop57IZg04/APaWiSi9AwRTJWsYYWz9VHA7PFoNo+BUl6bs
 X4Lms6T4foPC57LnyuIKNjhB5ms7veBdSba2FhmGsF78yz3oyL/O4dN/Dt5OUFldN4efiPka
 1PSvgUX44JPOHytbul8ZIfZ59kW8JUM3O/NDpj8BueiqLArHONb1EmCvXKt4l0=
IronPort-HdrOrdr: A9a23:3xKIoqiUBGljtdmJqIXOYwodDnBQX/l23DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwRJVpQRvnhPpICPoqTMiftWjdySGVxeRZh+rfKlLbalXDH4JmpM
 Vdmu1FeaDN5DtB/IvHCWuDYq0dKbC8mcjC6IeurEuFDzsaEZ2IhD0JbTpzZ3cGPTWucqBJcq
 Z0iPA3wgaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJqZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF7SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqA87I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1ewKoVKuZCIMvJ0vFjLA
 BcNrCZ2B9iSyLZU5mWhBgp/DXmZAVMIv7PeDlyhiXS6UkZoFlJi3ICwsoRh3EB8494ZaVlyo
 3/Q/1VvYALd9QRa61lAucHXI+QMUziBTzxEE/6GyWgKEkgU0i98KIfJI9FvN2CadgGyoA/l4
 /GV04dvWkue1j2AcnLx5FT9AvRKV/NFAgF5/sukKSRgIeMMobDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7vmIXH1EYhE0gXiU90KQENuG/E9q5I+QRaDs8jLIorluqjSd+vSPqPkFXIhVnnkCn
 UOUTDvLIFL71ytWHX/nB/NMkmdMnDX7NZ1CuzX7uITwI8COslFtRUUk02w4oWRJThLosUNDT
 9DyXPc49aGTEWNjBT1Bj9SS2pg525ukcbdb08=
X-Talos-CUID: =?us-ascii?q?9a23=3AcL8qGGvPLeSr/soeNQrUpUh+6IsoI1rA6V6Oc3S?=
 =?us-ascii?q?mDDh7RoGIdXW25opNxp8=3D?=
X-Talos-MUID: 9a23:9W+qhwrUC2WZTldvqL8ezy5Na9crzfWHNEsit4gsg5baOTx5EA7I2Q==
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="112407735"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEN5ajCepUL6NtkjB4khDc+G0+2GVEl+iljMsMlH8UvlnKS7Zgpzz1hO8ufpX+Fc9EpdoiP3kdUBYTADU7CRf/TJDt9deS6azFbpyRVWDEAhZHsZ0luEJKKpvEpiKzQuPiltuTxk0KZUXyVyCDdYHstR9eSjcO7/rsO5jmbHvHj3yHcMI2844yzgKUilN66i3B6wozzFekSJu0Bt1BDUEL0nKdoDh6CpcKglJ8Z1sb9BDr5o01uxoErwlj4EB+RePg/zWwHlRVsx7UjMx1aVqEgRdwtSbUnIWApOLOGTQZ/lOIK/cWpoGFtneV11REdfmv8UOuC2wRYn3TL9UXXR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8l2IOP+pPMfpJVIMig30zcUqDszr92zBrLUZzk/D10Y=;
 b=KOlEwq4mZ9EImx6BvIn4oZWZXnUqKFBbdndWNRo/TAMFFGr/vA4gt+1ZPiIbgnCSKaWK4UFuFNqmg5MgVQX2vcCCj5PaBK07AbVQqru8UEEXIDjt0IVVpQ7R1gwQH06s3Kmt6mfHTvrzT7XCK/vVKIU/GAgFepqKHnocdIhCCaE4WQqFkcAn59Z0PLKZjN0BcCebtMiTe+gkiyOLYOnJsZK2eyEoskfY8hNO+wi8aFQ3t2a2bvMUg8a/N88TlKDmiUh4NI2GZsW1TC7ylZM7PMY6RXunKzzi6b0S1Xdh4RfrUA1WXTNVGSnLIzt6XrrIaFq2eccKGrxksRa1F93UeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l2IOP+pPMfpJVIMig30zcUqDszr92zBrLUZzk/D10Y=;
 b=BKhj3r9Jq6cFi0SEav7qw1x/NShP/ExjED2k4GkImki1MmDa63Lj2GbKTmHxO2XbX6KMrCtqpO5TqSeFcvY5Ng5fm3KV9DLd7CPeMoEGiTq3dIXrBNEeOpmrbCEAjZfFwf/xFzuWDAt6EJldP8ChjzcmAJvqViA/vC2VzIkgsOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a836cdc0-747a-4ac2-0527-fe9d342959f3@citrix.com>
Date: Fri, 16 Jun 2023 16:29:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/4] automation: Add container for ppc64le builds
Content-Language: en-GB
To: Shawn Anastasio <shawn@anastas.io>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1686667191.git.shawn@anastas.io>
 <b970696f4f38fdf69ff112812c61f5537591d86f.1686667191.git.shawn@anastas.io>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b970696f4f38fdf69ff112812c61f5537591d86f.1686667191.git.shawn@anastas.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 42898a48-afcf-4b4a-ffdf-08db6e7e7f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y5IUBqyfe4LbDQyk2A0/5jDSNGnbjD4xtvOodtpzGuMr183uda6CFtRwZtcDrZ6mDr7o3PKNsFShNNdARB44YUl3ls6S3rbGwSYEOQRof3hHgtSi2mM+ujxHbsn7yJjGo9tTanUteh6IjnS9Bs7NuQmCfPzFErREoG2T1oLgGJpFm/RrId1lS4OyTsP6qGdath6dQ90Jt+9dmoiOs28jqb0q8ALVgbk5MM16ui5dT46XgNakFAENIMKsxaKmZ/BgDT/0thqY18gwR9/0W4k5ERpYDGIdcR/6ZBKroM2EGPdbVptQrC6sYqqQC6/viDcg1icwaw5vCOVtB9aLibF4+OnVUuu12letD/EY07fMNWl6aZs0rjWWL5ub90qHd0nXq+/HVkxWfvhZ/fnne8FRinL2dEWwLDdxIE4O0mBkjh9uSI7TfDgSDhsbksFOp539rmQ9GE9vdry/OCPwon2PdVv80Zz9AtsxdxA5KkNjlu4K16SBj24DfqUGMzsBMHIDFme+nVdZCHyWMB2f/sQKFggb+YR9J7p15BIj3+rJUqR0WzRhGbsSCmsO7mwpY712PmovbBRN44kGTLN2IRYiqPqWJBt3R8o1PfE58UqmrXAq2gbMK9C/2isq6lKD3BGu3ed8SwQB7G3WEc4voeSlBy9Ah3cklavG/DumAx1BYNk6OlGmj6oateBPnvTTOKNn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(36756003)(86362001)(31696002)(2906002)(4744005)(31686004)(6486002)(6666004)(186003)(6506007)(26005)(6512007)(53546011)(82960400001)(54906003)(66476007)(316002)(41300700001)(4326008)(38100700002)(2616005)(66946007)(5660300002)(66556008)(478600001)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUd5ZEFKOWNsMkora0hZZ0pjalpPb1VVN3ZMTDg3RU1EM2VjamdDMGhjK1Rs?=
 =?utf-8?B?VHZEcGozSVp0eWUwdEU3cW5GOE43YkVBblM1N0x1b21oeEtERFZ0ZG9BMDlv?=
 =?utf-8?B?Vm5PM0xtT3JXM0hETDFLYnRZcGhqV1BlQ2cyRXBwVlA3emQ0Y1FNRnFEZkRC?=
 =?utf-8?B?aXJMekRhWU8rMkN6SGRONnEwWVBzZk9PbTJ6ZnBFVWl3dkVtbzk2bUxvb0xE?=
 =?utf-8?B?Qit2ZDV3K3BnT3d0QlJyZjB5Uk5LQzlIeXBDenF6am8vMlVKSy8wSjkyc2hq?=
 =?utf-8?B?WDAxOW1aSWVUM050SDBBcXl4UmJZSS8zMldKeTFoaDEydXF2Z1E4Rkp3UHJj?=
 =?utf-8?B?Tm5OVHdURGw3ZnE3UzJiVnRNdytrNU1nWTFlaTJWd3d1UWpNaWJXV1ljeFIv?=
 =?utf-8?B?WjBNZUpzbVhFWWpuTnZ1K3MzcTdtdGlvZE8ycnArSVg2ZG9LTlVwTTBPWER3?=
 =?utf-8?B?NTJ2T0tZeXVXeDNkekpVb0Y0dmREeWExSjUwZWo2V3FiRHNpNk5wbEtQVUxk?=
 =?utf-8?B?ajk2dHhyWS9naURESXVmcW01K09Eb1NOb2ZLWi9QQ1l6MXpHbUg3OGhpOVVQ?=
 =?utf-8?B?V2xpVGg3bGUrdnJYQ3B5WjlJWHkvNi8zQ3ljRWJGTXFoSklXQllnUTY4aUFt?=
 =?utf-8?B?T29lR2lmQ1NDMzNRYXhzZ0sycGhBRmREYU9EdGN6UWt0MkJIQ2NXd0J0cFRt?=
 =?utf-8?B?MVFsblJrbUpRMXl1V1gyQVVyTDBKVFN6WFhuSTJCSXR6WWExRzlOUWVEL2g0?=
 =?utf-8?B?dkZOWm5EU3V5N2Exa2xXOVp4MWo3QVk1YnFZbVpCOFhQaFp5ejJ6d000YU94?=
 =?utf-8?B?WklUQU0vSXNnVkdrT0lqRjN4TmZublRaaDViNlRGN1J6OXkyaDFsdGxCVVhm?=
 =?utf-8?B?U2xPcWdWclVmbjE5UVRNMXFQT1l4ZnBSUURsbkdoRjF6WGxRaU83M1J4SVQ0?=
 =?utf-8?B?QjRBczc5R2lVaVVhWnByQStCVzZZNEhnOUtiaEVOK3lDbERmUW1yMDBtOFNj?=
 =?utf-8?B?U0NJUlNVdkhicWx5U2tjT2s3cFc3M055aVBYUjBhYi93ZFBvNFJBUDc3cjg1?=
 =?utf-8?B?Z2dEbURNT1p3bmhjZGtqSzRjWUF4Q0V0dzRPVkZtbmlHUWtVZ201Uk1FUlFE?=
 =?utf-8?B?UllpTVJlQWQva3owRjdhZ0o3OTlwTTVPS0kxMG5qa0F3VTgxb0RrbldDZklh?=
 =?utf-8?B?RFUrc1hwaHlmNkNtNWJGTkJyY3pJSndEOEFCZWlLbnd6MUg4VjgwYm1JTDdh?=
 =?utf-8?B?a1VVcXE0MU9oc1FjZmliQkk2blBZZGtweCtYN2o4L1VwUUNTWk5SVG5iUHBV?=
 =?utf-8?B?SnJrY2VTM3YrSFhvcHZiU2NydUdaMXhXN0gvYXZTa0IzaHpQZG9zbDZ4V0lp?=
 =?utf-8?B?MlpWZTAwc20zeFU4Q1RSK0dveS9hMUJQdVdvSHBwSnYxUi85aURSMUo3QWcx?=
 =?utf-8?B?L0Zhb0kvTG1mc0ZtMW8zM29XYWJwY3dmbjJmV1M4RHpMaUhGOGxGTmt2eXly?=
 =?utf-8?B?MmFSVDgyR0tTcG90S2k5UnVaL3ZQREpwRjRvMWxaMlN0QzBqdERGUGNNa2du?=
 =?utf-8?B?ZjJOTHRpYW9hdUF0cFpSSHNtWStUemdXdFlOZHRSQ3NWaTlsdFlvUitLNlcw?=
 =?utf-8?B?amgwSnc0L291aDNzSkQyZElYZFVqN0J2SlpHZUNKK2VrZk00MjV2TTlNV0ZZ?=
 =?utf-8?B?Rk9LTjA3YnpzdStmWm1ra0JzbW9ON0VYUXh4TWU3d0FLNUxCQ3ROS0UzOTNK?=
 =?utf-8?B?Vm0rbkNobzAzQmJiYURtYVp5RnM4SU9pYy96TnNwc21EWUl1NnVDeHRmWVVF?=
 =?utf-8?B?VlowNHFyZ1ZseG5naythZ2FKMHpBaXUzVG80NXA1ZGFrV0dmVGxyd1FRbjUy?=
 =?utf-8?B?MTVrNERZenVqYm56bHVPV2EzU25BeWlpUEZuMWpsdUV4TUtVbU1aODBZSWNN?=
 =?utf-8?B?cTRWWnFmbVpNaE11MjU0NEpZUXV1NzhuRGR2eGF5TmhzMmpzcTYyWENLeDdX?=
 =?utf-8?B?aVhncGVXU3lXUms4aG5jaW1kNmU0TkRJbFhhZnUzbytFQUFqd1g5V09UQVpY?=
 =?utf-8?B?ekZ4SVlyQytUTmZzSk52K2Q1UVFGNFQ0YnA4QkNVSE5Nb3loRURScWhFSWhn?=
 =?utf-8?B?Z25mQTZaUXpPc1N6YXVEUEVlREhPNzk5UlpnclBoQkJ1RVJTTmpRV3J0U3dk?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V0PU+HwH/AdpLr7dEeRWOg9Nw0hjYAXrytr++dnyLmGYDmHkXYRr2VUUoT1znLoPZgNGXhVYldqadTjTR0AAtNj5TgA+gIgiiZknptgDVPFg90NZITD4Yg4xXE/puUROshgme/OLhBmy405cWzvPTvxjlow66bZiiiDbqPa0KwUmzRUqmZke2B3tbZA9JDs359OzRTcueH1BNUGzxzQTXCyeaWFvOe971Q7Cv8dJFHV/N+T3XgKH9Wwwv1jSv7zsUrquXbddnhSO8yv1xrABOSKoubVrSmoVU9lqw5SvmhvStwkLUcuXf9dxMKm66R8IZx2jzcBNZ7PAxn5cIr5Ou/wUnN1UA0ysnBHeS+2FW6SUMCytC8K4UPWmOPvVg6IisbFGGhOduu9C0YP9p7vNMaold3UsfGj5CHP9/0Nzj3B8IwIuaqQ178h3RK/1b1BUGukTF6YWSCzcdp5n4EPX+luCuwOWgr3c5HougMKhA+g/OxE2N7OcpXnvnM5z/eYKfxOiDhRi4QdqmQ4IPtmGr6y0botGq9EqAjVeTyukrarRBX3K1eL1JePCMYysHxKl1zd5kcAcbKVNVWnxVn8KBOinvXmFOOQGxaotB/vfD+ZKC5aAVtid9OFXvWJZL8E9B5WZDfaF9OiIPOkayk43it1gpbBRSSHY36JVwtxbq/j9jplFCoN+cg8Qeoh9N7hsZjpX2XM6AH0W8nJucrNZPlIN+5WtCpijek0Uq6f+RBOGQ5AWsXHFk/5QxGPlD6M1okNaP1lHSjglpK+YeeAoNfm+eLp1v7KJP44LVcMgX56ZGEOn5dOpDWvNVXNcsMTlsgk44vmQsSwMdUaEe1DBaaTEyC8QGLsUp3xVYVpIde/5WFoq9GXg5QAE5+kq83zvDwjD5qmo379abKOg456Goo8aBkLpQKAGNwpfz3PjdxQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42898a48-afcf-4b4a-ffdf-08db6e7e7f20
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 15:29:38.5364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /n+U5bGZDR+O8sTM9NSwHjkClma88mRvo2q+KhtF7a9+k8c091nD/8D2wTYDySxpOIcYauEla824MarQuwwgQYzZXDKnMPxJXPLp5mjoUZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7075

On 13/06/2023 3:49 pm, Shawn Anastasio wrote:
> Add a container for cross-compiling xen for ppc64le.
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I've built and deployed this container properly, replacing the prototype
from earlier.

