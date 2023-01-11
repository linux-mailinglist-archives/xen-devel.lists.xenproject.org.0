Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEDE665ABE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 12:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475243.736856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZZq-00020d-2W; Wed, 11 Jan 2023 11:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475243.736856; Wed, 11 Jan 2023 11:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZZp-0001yV-Vu; Wed, 11 Jan 2023 11:47:29 +0000
Received: by outflank-mailman (input) for mailman id 475243;
 Wed, 11 Jan 2023 11:47:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHza=5I=citrix.com=prvs=3687a0f96=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFZZo-0001yH-C5
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 11:47:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b67f4aaa-91a5-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 12:47:25 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jan 2023 06:47:21 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5402.namprd03.prod.outlook.com (2603:10b6:806:b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 11:47:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 11:47:20 +0000
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
X-Inumbo-ID: b67f4aaa-91a5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673437645;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=N19BN8vT5mhkquQUDl8iaAN7tGdPH7TWLraXfCAokq4=;
  b=MUyENqgDZvQYfNHba/gnmG4+fo7Cdv1vTT9DaYAxhRsk64yIzpYCW8+t
   H43Q43oKx9Ougw7hMOUvi/aagLs3eiYveE3GYOKB/aLD6PDSAK6ur0PHa
   cNkRKXDfLpslBlzqzd+5jOZA82Ktk+hk76NwnyORn6Yg2CKNB2x8a3k1O
   I=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 92103583
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:s+aHKqj/wxN/9bmNr0oe30diX1610REKZh0ujC45NGQN5FlHY01je
 htvWW2GOf/ZYWOmeN1/bIvlp04P7JeHnYRiSAc5qH8xFSsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6sT5QaHzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQSBTIvVhS619iH64KVVepCgpQuN/nkadZ3VnFIlVk1DN4AaLWaG+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluG1bLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RefhrqU30Ab7Kmo7CQwPVGK4mNaAkhClXOtlG
 lAN+HUTlP1nnKCsZpynN/Gim1aGoxodVtx4A+A8rgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf+a2dqTeaMC0cP2gEIyQDSGMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiipiUkm68ai8JN0qyh5E3GmBqlvJ2PRQkwji3pWWai4hJ8dZSSTYWi4ljG7t5NNI+cCFKGu
 RAsmcKT8eQPBpGljzGWTaMGG7TBz+mBGC3RhxhoBZZJ3zOp9n24fIEW4yxkI0xpMcEsdjrgY
 UuVsgRUjKK/J1OvZK5zJoeuUcIjyPG4Ecy/D6iIKN1TfpJ2aQmLujl0YlKd1Hzsl05qlrwjP
 ZCccoCnCnNy5blb8Qdajtw1idcDrh3SD0uKLXwn53xLCYajWUM=
IronPort-HdrOrdr: A9a23:c0zT0KrB3sSvbAv7l8QATv4aV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="92103583"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfiyQEyH8cTyHJqKB7gCBeNqFp9O/35mjR7LDhgZKZ9XJA6eaizLuMtNvL5kSrnkfhdEEuYD/BVd+x4xBn516738vGNbCNsI4SDrcRgchH7u7iTtdN3rUbmI4dPAoL6eF/Go0sIVK1ZKbfElynSnVIZYjhurTdlOer3548emvKdaNmm//ZN6jZFOo7YpF5CvGYYsSgUEh8BIprdb3n8KhVRLJi5d7s3SDegw2Bh2izQPrO0wVwVOOfDp1aBSIKzBmXWqak3YEmZ49w5BUCXLDfneo4ak4i5Ol3vWiEocu/OmcsRUqiyWG+IxiVITs0EemsrG/L6PZqnJOFiUmKxorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N19BN8vT5mhkquQUDl8iaAN7tGdPH7TWLraXfCAokq4=;
 b=e6E9fzNRFrXmDA5YQJ0Ih2qkYU0jSd4olQhPb9cSCNiw8Maxf95QVstSobM+v6L97E7kyYWgdl9iurbr1EeOEQWBEbfwM8dAyUksLCSAqjbNqpJMn3m+7+nrD1d1gtWdXBaidNhocifEU7V3PGD3okRKcToHIXFJNG9RDMMlSOvmxy7QhYvlZo1nPqcVXd3LBPnHdFZ37gMdytadjR/W44kZttc3bLR0LDXEmwGY2uV6wW+b9dUlJA1NcQ9J+LAXIWgBvPaGQLBVS49dYQn6r4kvZ7j/kDq2TfgjTlFrO3QFMXS2R7aZaiM8HAi6La+WwGs1LvwSWY5l+EgcUyTeQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N19BN8vT5mhkquQUDl8iaAN7tGdPH7TWLraXfCAokq4=;
 b=CFAljS5NFqm5wj/FKz/jhURHuaSzeS5oC6CYyNgniluVXO/+gx0U/WG5OROHRXejpoHJ4Z9Rhqb0IGpP3kzpWafOh3Gooj2lMLHiTLfpnSLN0Kaxfr0LDojeRmmHu4dCChscv/fj2qDQ9CNtbHTshpyzMQMNhSAgwm4wb2TBy6E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen: Remove the arch specific header init.h
Thread-Topic: [PATCH] xen: Remove the arch specific header init.h
Thread-Index: AQHZJbIRC1R7bPh5UkiB/FwWKG3LDa6ZGYaA
Date: Wed, 11 Jan 2023 11:47:20 +0000
Message-ID: <7590f300-49ef-8180-543d-96b5af06fbd5@citrix.com>
References: <20230111114409.7495-1-julien@xen.org>
In-Reply-To: <20230111114409.7495-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA0PR03MB5402:EE_
x-ms-office365-filtering-correlation-id: ac591cdc-7851-48bd-baf8-08daf3c998bb
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ogirymhQkRqselGT+JYNBxijFb871U8NEn20x3v0GkmkM9VR7UInm0dK4khP8xvBHSsyxVm2YOgGJiaeqe+bvHecwu3n4eZRkMISxa8ITFp0tF97LgT8HcfnN4pYL/qsUSBLjKh8dWFcCUIbt28Sdq6p1j1+OHfqlqzKTF181Lk/bgxeaD5b8UN0sJh0/hwbtum14bk/EZrYOyanzjI3uH8nEt+5c++DKEdDNsFQmfGzr3s5029PyPukDxWcyH8en655V5yhCaLfFMaVs5nN7K9Hw3cGIKBhGx82fD8J3RgH7r7FwEm3PwDX8Nrf8fRRfnp3JbyNBiBgVJMPu45SbSK/Glp4RobvHNXIQBydUlGgqWiLnUKPCoR739YGwegQBKcVkKU/cWKkBGxmaJCjEKp6t4ErRJH2efhonKn9CKogUOjHBMiFK4mjenRaKjsm/K0VIpWJC1vqPZJ1764p5HH8FkOaoszXzXs6jOluY5+Kfdire73fLwWDiYE+XdRpVIVgte7IvDFGGhPdmdlxb+8d/R+CPUCHuT9E6XqYYntMR84mHi5AK+skLAaFW//xSzlFwulch2z2RpHUqRHmOK7kApkDcAIu+v2muuZ6xL+WnYuH2QAPvaPO6Qwk6iN2TNntXR210FkUPc1E9kh5ElRuqjEON4Opw1FyPBfulQYnkEHRdUyt/OihYpt1w9D7HH2jVZhhGbwsBXtnCGTSMGX987IhXCgLwk6T6jgrzblxbi8kndEJyuKphN14Y7HzvdXN8S0vdCg48oIAI6Pq2g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199015)(7416002)(4744005)(316002)(5660300002)(71200400001)(508600001)(6512007)(26005)(186003)(6486002)(2616005)(31696002)(41300700001)(66556008)(91956017)(54906003)(66946007)(66476007)(66446008)(4326008)(8676002)(64756008)(110136005)(76116006)(38070700005)(8936002)(86362001)(36756003)(53546011)(31686004)(6506007)(122000001)(82960400001)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGppaVdIWUw1NzJwd3dMdVBIOU1HeDhpbmpZZE1RZ01XLzZRNFVBUkgwMUVG?=
 =?utf-8?B?YWNycDA4ZkttM3lJa2tjdXdvSVB5YTVSdlNQZjRCYjNJK1RZZXVzaUVhamp0?=
 =?utf-8?B?U29oZE5pRG53MHg5Zng3M2lydGZib0V6UUI4ZjRoZ3lvMFVsOUNLNTNaem5X?=
 =?utf-8?B?cEpLNTRPaEdaVSttTEVtc2crd1FLR1NjR29jTnJTU21PRktXREdiTE9xVGl6?=
 =?utf-8?B?QWNTcXVYNjVSMkNCYWFrQStuYXRneWViTXIyc3J0OGdjc2pDMWpQOTlNUGFo?=
 =?utf-8?B?NVBidTZuTnVKR2V3eCttYVVKeXhXRC9FbFAxd1lWbWZVNmFEWWpjMUNrWk93?=
 =?utf-8?B?ek12VjJuVkQzWW51M3lMM0VhVmhUMGw3M3AyODF3dVlmR1RCYTdGVEV6akI1?=
 =?utf-8?B?UllKNy9BNlpoeGg2Z2s2TFBLQ1haaVhSZUVUNTJJV1A0ZThGbkxseDRvUkN6?=
 =?utf-8?B?bU9oMVhlT2pZVGd0VG9qSkRrTXRoUExVWkhzMWRva3ZXL0pBSjRCd01URTJh?=
 =?utf-8?B?VXIrd3FQWkx0N25SR0MwbEI2WWo0QnBrS0RZSXB0U0FiMGFkMHBpTWttVDVM?=
 =?utf-8?B?Wk1wYUxKYUNoMVdYVWxVYmJSamRUcjQrVG5lOCs3RTdRL25TVkl5ZXROazEr?=
 =?utf-8?B?VE0xMGlNQkUySTl4V25lOS8ybUM2L09rU2hOYzYvRlQxcHFyT1ZxdzUvU0R2?=
 =?utf-8?B?NFE3OGdDSEpZWW1pT0daYytsZkNSby9TRFlpblllRzVETjdEaittNm9zOGJ4?=
 =?utf-8?B?RkNlQVZPeHdnb2hvKys3OFhHVWZwZ04vZ3UzMStiZERjY2NFT3FkZW5ORUh5?=
 =?utf-8?B?RmIvVmRUY2psaG5pWTN1WjNVVS91dmV0eTRjV052SFFHRUtWTldLSzh1UUVr?=
 =?utf-8?B?V0FhTnBrVi9Xc0lNVytMS2hDWEtmS3pEL2xXVFhOMDAvLy9ndGZVYmx2WTh2?=
 =?utf-8?B?MUZhUlh1NDhzbGlVbHZoSytLdjNPU3hpL1hXQitmQ1pVcm1iZ3VVSFYvejYz?=
 =?utf-8?B?aytqVnMyR0VTcTEvWnpZZzJFbVgveDlFOHNTOHBuU0VvY2hXV21mOWxWMXgz?=
 =?utf-8?B?MmZnbzZKd1JmSHBDcVhGdW1FUTlJczRLbHBkMFhsN0FOT1dQSGNyT1pXaFlW?=
 =?utf-8?B?bnAxZEVmeDNIdU00TExTQXQ1Q2RWY0xkdDVUMnM0TlZQZWlPVTVHOXc2ajQw?=
 =?utf-8?B?QVZWZnA2cWp2TTBBSDYvWTBlakYxUFNLNG1TSU5kYmRNYWFTQjl1VU9JN1Vz?=
 =?utf-8?B?SGl4RWpLcmx3WFlKandEejVOdUFaQWJRcDVDdlRrWnJvZ2oyZkFKV0hIVHF3?=
 =?utf-8?B?Ykh1ejhWZkJpb1hpVU1kL2ZWQVJ0OUYvS0trWlhmZUhKSXFVU2pVdVFuRndr?=
 =?utf-8?B?eWs5LzArZHdQckNSaTI2RVhOZVhSdVowZHV2QUZHLzVmY1UrKzQyeWowd05X?=
 =?utf-8?B?Qk9LTVh2czg4cjIvU2VLV1NTVFN5Q0hCYVFxSmRXKzNPRlBBTVJWM2RobnpC?=
 =?utf-8?B?TkgrbG85S3pSY2t0ZHI5eDZ4WWR0Z0g5b0lzUDFuS1FhY2w0VTZqUmlkR3VR?=
 =?utf-8?B?cGw4TmpUdkVCSmVRU2JSR2s5SVhGdGJJU1RpUlM4Rlo0K0xtdEVVVS9RWW81?=
 =?utf-8?B?RUlJZUtRcnF0aFRJTGFMWWlsa0t6blhoWlAwWURwQXlMMXVRYzJIeDJtMWFy?=
 =?utf-8?B?SzFoM1U0Q092MFkxQXFCRExaay9neVloS21VdFc5NFdBa2JmUTdod2wxMUR1?=
 =?utf-8?B?UlpPRk44T3dGUWJ3aE9SU2kvUzQvRk1CR0NXU3RNNU1ReDlEUWNvRUlYNGVB?=
 =?utf-8?B?OXkvR0FOSWM2QS9TQnpXVXJwUy9Pcktsb21ZakhXK2xnNUJwUWRISVRva0NO?=
 =?utf-8?B?amJGbnhMeWFDTi9reXMzbUl1bFJBMHhzZTVQL2pMamlOdFpybW94OE9HVDBX?=
 =?utf-8?B?TXNRWWlMODZFZ1gxcU1rWlZxSkNRODBkaUlqNTQxVUdZekpubUtHVkloTjEy?=
 =?utf-8?B?bUxJNGZSWTdPRVRocmRZUXdVODZOWWQwOEJWdXMxa1F5bElTV3Q4SnR4TGFD?=
 =?utf-8?B?WEJidkNEazM0SmRUc1AwTEMvaGRuQ05CcmEvSU1OYkdZd2RkSTRsb20wbHRa?=
 =?utf-8?Q?Pn1l0+iH9/6KdrIaytgdmLZnr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49306D701B4E8B4BA6AB7710D450EFE6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?YnlwSXRnbFA0eXhsU2xoRm5kd0tGRWZPUkVGNWhFQmZDTVRNSjZqbFJPd0Mr?=
 =?utf-8?B?R2tDNkpuK0NHSkxYcndyZ05xZnh3dGVSbi85dXlIdXRrcUZ6VWxqekVwYk1C?=
 =?utf-8?B?MXFlUlYyWDk1Wmc2d3IxNUJJQ0Z5Zm5QZDFjSDNBVk1vbWRRaFJJSHptazVy?=
 =?utf-8?B?VStmUmtJdUdxaGtYazNZaDgrRTRCSURsc2FKZDN3cHBSclNSMmt0SmF3TDUr?=
 =?utf-8?B?YVhhMU8vdHR1anA2eTRjZGpEQzArdUZXVllKTlJwWlZNTklvb05helZDRy8w?=
 =?utf-8?B?R01WZDhpQnFNS2EzS2F0ZmRjclpHNUhwaiszV1ZoSEhudGo3QmZvSGkvclVi?=
 =?utf-8?B?clZXQlVJdVdYUjYxc0Q2cVg2cUtTVExabzdjeWNWUkNreElHQjVIdUJEMmh4?=
 =?utf-8?B?bjVNZEpvUUFJTzhoUkl4ejBGM29Md0ZTbGxlNnZLSUhEWWY5NXRDZEpudmtv?=
 =?utf-8?B?ZCtTL2ZhWGxJb3U1WDlDTjhOdFNnM2dTeStINStKY2xwR1hKN2k2QTYwdXNJ?=
 =?utf-8?B?NzlkTUhYR0FXRUEwekR2NjhrZWE5Y1Y4eHNCakF5RzNuZ3lUL0crRFR3dzZD?=
 =?utf-8?B?NUo4R3RmTk9xY2RteGVHdmZtQXltbHJ6UHpqYlFqdVcrL0RmcGpEeVhZcFJR?=
 =?utf-8?B?enJzSTNlMFFJWXBDeUdKdmF1VDhhWGFZUjFIdFBRaFh4UHcyUUJzd2dudFFT?=
 =?utf-8?B?QTdPSEk4YUVBbit3SVBBTkl4azJWR2FQSDM1U05PQ0lKanl0SHJHUWhjWjgz?=
 =?utf-8?B?UXFMdm9TK0ZpVzcyenhoZHI5K2F4bEhrTFJCaXBUK1dPL2UyUk1nTDZwUk00?=
 =?utf-8?B?NWZCSHRjek9tclYrZXg3dzZrcFY3YlM4S2NLZ1liN3c4NXp3azRTb1NnZXBk?=
 =?utf-8?B?MFRvOTVYaHRlOTBhWC9QWGxhenZjU0MvaWR4M2R0cDJpM00zZ1kwaXF4YkRX?=
 =?utf-8?B?T1EraGNaYktTNk04U0Jka2gxenRKWG9HQTE3cWs3L3ZoeXJvczNERzBVU25D?=
 =?utf-8?B?OFcyMWJhUklUdGxEY2xtakhtL201MWsrVDE2aFA2ekJnZmxLOTI2RVFwbTdE?=
 =?utf-8?B?aGtxRVdYN080YTM3czU2VmViMjVVN2llejlYTzY2NHB6Q1NjVU9oYzFoelQx?=
 =?utf-8?B?VHhSczRVMDEyaUtUVm45UC96dkNXOVIySjRDZytTdHlYbFJ5N1ZLUyt2eUMw?=
 =?utf-8?B?L1ZMVkRUQ1lSZnkvcFVaS2hQQ0JVeVZqNVVVM1ZHVUJxUC9vQ1liZ2VGVTFn?=
 =?utf-8?B?TVZJR0R3aW0ybk1HcjQzU2lmaThzT3BxUmEwMnFRbjNTUnNxQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac591cdc-7851-48bd-baf8-08daf3c998bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 11:47:20.2606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0cP1qCANL8V7PRb9IOHNIH4+78gP9T+N/Ou7e63Of1B16dAJriTVcZszHUqpOsbjKBVpOL//oNA3noae29rPms+GHsTMuj3sk8YOLKVDKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5402

T24gMTEvMDEvMjAyMyAxMTo0NCBhbSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBGcm9tOiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPg0KPiBCb3RoIHg4NiBhbmQgKHNvb24pIFJJ
U0MtViB2ZXJzaW9uIG9mIGluaXQuaCBhcmUgZW1wdHkuIE9uIEFybSwgaXQgY29udGFpbnMNCj4g
YSBzdHJ1Y3R1cmUgdGhhdCBzaG91bGQgbm90IGJlIHVzZWQgYnkgYW55IGNvbW1vbiBjb2RlLg0K
Pg0KPiBUaGUgc3RydWN0dXJlIGluaXRfaW5mbyBpcyB1c2VkIHRvIHN0b3JlIGluZm9ybWF0aW9u
IHRvIHNldHVwIHRoZSBDUFUNCj4gY3VycmVudGx5IGJlaW5nIGJyb3VnaHQtdXAuIHNldHVwLmgg
c2VlbXMgdG8gYmUgbW9yZSBzdWl0YWJsZSBldmVuIHRob3VnaA0KPiB0aGUgaGVhZGVyIGlzIGdl
dHRpbmcgcXVpdGUgY3Jvd2RlZC4NCj4NCj4gTG9va2luZyB0aHJvdWdoIHRoZSBoaXN0b3J5LCA8
YXNtL2luaXQuaD4gd2FzIGludHJvZHVjZWQgYXQgdGhlIHNhbWUNCj4gdGltZSBhcyB0aGUgaWE2
NCBwb3J0IGJlY2F1c2UgZm9yIHNvbWUgcmVhc29ucyBtb3N0IG9mIHRoZSBtYWNyb3MNCj4gd2hl
cmUgZHVwbGljYXRlZC4gVGhpcyB3YXMgY2hhbmdlZCBpbiA3MmMwN2Y0MTM4NzkgYW5kIEkgZG9u
J3QNCj4gZm9yZXNlZSBhbnkgcmVhc29uIHRvIHJlcXVpcmUgYXJjaCBzcGVjaWZpYyBkZWZpbml0
aW9uIGZvciBpbml0LmgNCj4gaW4gdGhlIG5lYXIgZnV0dXJlLg0KPg0KPiBUaGVyZWZvcmUgcmVt
b3ZlIGFzbS9pbml0LmggZm9yIGJvdGggeDg2IGFuZCBhcm0gKHRoZSBvbmx5IGRlZmluaXRpb24N
Cj4gaXMgbW92ZWQgaW4gc2V0dXAuaCkuIFdpdGggdGhhdCBSSVNDLVYgd2lsbCBub3QgbmVlZCB0
byBpbnRyb2R1Y2UNCj4gYW4gZW1wdHkgaGVhZGVyLg0KPg0KPiBTdWdnZXN0ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo=

