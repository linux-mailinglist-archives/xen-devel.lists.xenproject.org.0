Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A136A6CD5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 14:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504035.776522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXM9f-0007Sa-52; Wed, 01 Mar 2023 13:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504035.776522; Wed, 01 Mar 2023 13:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXM9f-0007PF-1X; Wed, 01 Mar 2023 13:05:59 +0000
Received: by outflank-mailman (input) for mailman id 504035;
 Wed, 01 Mar 2023 13:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nLqk=6Z=citrix.com=prvs=417c45763=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pXM9c-0007P9-PY
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 13:05:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca82ef15-b831-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 14:05:53 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Mar 2023 08:05:41 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5198.namprd03.prod.outlook.com (2603:10b6:208:19e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 13:05:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 13:05:38 +0000
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
X-Inumbo-ID: ca82ef15-b831-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677675953;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aadJC1iTn4lLQPFMgwUhplmnbOj+G3QekYaEkl0oS3c=;
  b=ArXB/NNUlnnJNlJ47Hpkjo1G4Cw+QAxrDcKSpRicJ3wkk3dK7IYtggA6
   EfhAnToG8STu2PUjvscuVXEYUg7KurCbj4rVBUT3e3aS+fUJzmCiwUQY7
   hN8sAnOHygc0/Irj6xW+x1Mt29Mt3HWdX191RKcqvuu0pOnhxlm8co2KB
   Q=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 101436795
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0jj896twU6exU3LqnNnjcgujsefnVL5fMUV32f8akzHdYApBsoF/q
 tZmKW+GOPyNM2ekc9x/a9/i/U1Q6pHVxtZrTVA+pXs3EXgW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASGziFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMiwrczKx2rKP452EdvJIitoCM+PoBdZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIe9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgr6Ix3gLCmwT/DjUGdAufgOKwsHW5ZPxee
 0IOxHYCiIItoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAOUyRTYdghuMgpTBQl0
 1aIm5XiAjkHmKKRYWKQ8PGTtzzaESoIKykEbCwNTwoA6vHipp0+ilTESdMLOK24kNzzXy3xy
 jairS4iirFVhskOv42r8FaCjz+yq5zhSg8u+h6RTm+j9hl+ZoOue8qv81ez0BpbBIOQT13Et
 n5bncGbtbgKFcvUzHHLR/gRFra04frDKCfbnVNkA5gm8XKq5mKneodTpjp5IS+FL/o5RNMgW
 2eL0Ss52XOZFCDCgXNfC25pN/kX8A==
IronPort-HdrOrdr: A9a23:DmWYw6i2h5e/HDUbr4CdDqAdWXBQXvgji2hC6mlwRA09TyX4rb
 HKoB1/73WYtN9/Yh0dcLy7V5VoOEmskqKdgrNhX4tKPjOHhILAFugL0WKF+VPd8kbFh41gPM
 lbEpSWP+eAaWSS3fyQ3OBhKadb/DBcytHRuQ4C9QYKcei3UdAa0+6mMHfnLqUYLDM2fKYEKA
 ==
X-IronPort-AV: E=Sophos;i="5.98,224,1673931600"; 
   d="scan'208";a="101436795"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJ99BwJIkBBwYI9FOQsA4QS0mVd8QPUqfaMQEl/8jHAk1QjWlp6aj9TDOqmhvlQ15JvtZ0Tu/Dh2fUmB+TqgzMpz9JvehaiJzGPDM7NgDuz5wrKF7Xz0Slg4vkdCSZrmhqva30bdeHGpSO4ic08EJM85RmswvP8xWfiy5EAMVQ4kDPu4ONRi5lCTDdyoXgyP5VkJrzxaz5YKbT4TpaJyNPph21Hmog2OxBP3Wmun0ypoxZrpIvbR4NxUB2qogTRlb/QOQ3YG3m/fVXP0I57s7ZkgqJJE+NYmTnW5WzlklMDaovbS17kPUzmSxnhJCzFZUCjVQc0oM+7dI5VKV8DKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyDq4tgG8c/dGgCmChWu9MmDNCIb7NVa3KtQ/Z9+Uws=;
 b=cYsZdzh87WhigYpN54cITHC7FkFMWbqvPrI/513D0aA1uPS95Tm03DXB0S79WuHPetl2VD8y+Ee2bNEwEi+SWZhrM6KCbKILabWhV8pGsw4Ach4zYQS/+LerhtuEgkgQR/IYAUVZJFZJBGtI6/rQBYxP+2FfC96o9+Ls5v0zlimRsVuMA1IbaZf7f2Pv958y3tkd6rQzzkuFsb5yl0zeI0XjJgDSK0sxlYwETL529y0265kzfdJYqU2YjXJy1yPE/auU8+rzFhnpl60aXjazF4cR7Ism1GQSFwQrXoSzUn8jLm0V/QBbYZsH21Z807w0BcSUL4BrTIrIx0fZN076Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyDq4tgG8c/dGgCmChWu9MmDNCIb7NVa3KtQ/Z9+Uws=;
 b=CSMIj31RlNZZgZWHOQ1IM5JFIJj61RSYx7RHZ5sKs+tz3p63sGNbA6x0L24mazFVR8l1HMsgmCt6sPPIdtki2BRJM5X0t34ckf4kcfkFgfngCdS3k5g1+irCD4yhja5WuxMFW7UiAQD6tZxENVKRtSFEStG1QbZd3rEhc8RA95c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3f45d953-fea1-355d-0366-35f63958184a@citrix.com>
Date: Wed, 1 Mar 2023 13:05:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
 <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
 <aa326f9a-94ca-75b9-6d4a-ab6fdf992c29@suse.com>
 <2fec6c39-f73c-719b-7bc9-02e1ec3f195b@citrix.com>
 <5e623eaa-ce32-e3ac-2089-68bf8125b5db@suse.com>
 <18b9b99e-1d93-73d8-f9b8-873f44287c5c@citrix.com>
 <60252bef-c732-b061-8ec0-c4022eb41255@suse.com>
 <dc6b36df-f46d-0903-0789-5dda74490eca@gmail.com>
 <491961e2-f9a3-2bd5-e757-a094577ed068@suse.com>
In-Reply-To: <491961e2-f9a3-2bd5-e757-a094577ed068@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0563.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e1d7ce-7d95-4367-c878-08db1a55a712
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2PqCG60/N3E6ns2g3iU75OotjaGDKRCfN7sU94AmehQi0hO1Wb7h6yWexqVCdZEN8AJtW7y34hTWh0eARF4Sg+DJ9ckbshIwCsFFWj0Q2p03bM4VrbDfUryXUCqsWN5WmNTYyF3W6zwk9VQTQx3l5MtcMgo1ZCxOKJyOv49gGubU5bDhrb/9N/NOmN2LrdNkmknmIs17YlpCRc4FQatuKhBWJXkKFmbblb1r+KXkWOmpFpxweyID4P/xtJhErg2+YIXd459ubQeWnyYr8RiomS3CpOnTLp7iVngk5DRhhFQKBLC8XepS2jpn5FpuKYHhHJHYytgrraeXii37T3JjKpOo+ned4dp4yo2UZWU6Pdhr8UsuaArrWQHTbNZcdDgADHWqa9llYZGeodc+8DDl8qfH0s6aZhjA/Juu3/lljwE4OcKbdCCOL6fK5c5aYfzCPWY4KTIkVu/wKcYCJaXVCyKR3dd4JpMkCL+Smq7aTZdB4yTJBYLowa9D+gTI//csWs91kYoxb3f/GwVlOqPkcoWm31izggTluold5Unhcx9k6JOF9ZwcGrSRy82KkeOhVTA9n06crfREobTTqGSi830tH4aCgQzyEctnIv3Rmek2wBwYG1vWaBQaLcXoW2Om1njnIsRjBAl4/TxNz4EienPD51JIMdrdqEx6cLORjhyefjqwpLb4WFDoJvVN3b6WDXMJEDTgFJ9yqzTLrM4KdRYAztYJMxitA3XGvlrGSvI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199018)(86362001)(31686004)(31696002)(2616005)(5660300002)(110136005)(8936002)(83380400001)(54906003)(41300700001)(186003)(6506007)(26005)(6512007)(8676002)(66476007)(66556008)(66946007)(82960400001)(4326008)(478600001)(316002)(6486002)(53546011)(2906002)(6666004)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmkxTUJpbWV5L0hMTXlESEkxbHg1eWFweGoybVFMUHo3VHZPODhRVmorNnI4?=
 =?utf-8?B?YU8wSXl0cVVEc0x1K0RtWDdTSDYxSmZsM1F6WmZmU0g0WHp4UXhmY0djYVMr?=
 =?utf-8?B?Q2xldWVDN05qa2ZidFZMY1Vla1JHYVBLSHdjbVptODZNYTRITXRZbGZHNmpq?=
 =?utf-8?B?WjljSFg4ZW42ZXl1TlBqc0VHRGhYM0FtMitNcTF1MXJlQVE3WGZlbmxHa3Vv?=
 =?utf-8?B?SmQxaW42d2ZSblJwUjRZeDZ6VmJab1ZMdklYZ3RMbm1EQ2VBelI4QjFtUHFT?=
 =?utf-8?B?cmQ2SUErcndJVFUxOVNSNldqNDNEeEpSblRyUFVvQ2I4MU9mTFlBK3BzMFdJ?=
 =?utf-8?B?YnFjdjBxMGgwRnFPcWVnem1FdDFnc3cvNkFia3R1MUIzd2xLNnVueWh3Y1c1?=
 =?utf-8?B?Q0JCcUVCbThaelhsUmlpa01ScmVmdFltcm1iOVlHUTVOMmJTWmpCWUw5d3I5?=
 =?utf-8?B?eGhjQUNhNzdrVjVseXUwOE0rTFlNUXc3Q2VKSE5HUloyQkVkOXZJZnFmVmFK?=
 =?utf-8?B?bnpIVzFQMVN0NWtMMDRVY2Fhb0hrbXIrYWwyU3U4Y09EWkVFV0hwZlhVWkhP?=
 =?utf-8?B?OU5WWVdlTHlJR01sdW5LekdOdWRDczBGdDhNbk1WYXc5dUc4cFZTMCszYnhs?=
 =?utf-8?B?bk0vY1BLVC9mNDR6S2xoWnp5aUpUVTk5VEZpRnBUUmdzOUNxc0NjS29GV3Za?=
 =?utf-8?B?aDNmb1c3Nk5jbXBaWWdML3ZHbUVPMEVPbW1CUGhmTHVaaXhkTldYRDZpeGRT?=
 =?utf-8?B?TFFXaUhkcStKSVE4L052RW5iM1N2cWJVNFJvNVl0elh6UzhpOW5JVWdqd09R?=
 =?utf-8?B?TjlsbFkyQlNYc1NRUmp5b2ZaMlhpUXZ4ZmFIY1F3aVdsaWVyMTAwSXZIdlV0?=
 =?utf-8?B?bWxQTHd4YkpTVnpxVDNiMjJVRGR3SDZkSlpwcEJzVmNUcFBkL1IrNzl5Ym43?=
 =?utf-8?B?SWNLRGZvMk5PRDRRbXhHR3hwcEh6RlIzNHRRSG1tN2s2NEtqM1BzUTFXV0pw?=
 =?utf-8?B?TUZXV01wQk1MTVVUamY0L3VlZzZ5SGlyVkpscWJITlRuMnFkVW1uVTVoZSt0?=
 =?utf-8?B?THoveExBbC9pT2t2Z28rZ0tzR3pzQVcxYVBkWkR0NFRQdDVkNXVLay9sZTlu?=
 =?utf-8?B?WXJOT1F3UkZBeFN6MTNQVGJQdlltT05YR3IwNWtnQmJUVkRGT0FudE5vdnd3?=
 =?utf-8?B?R1JNKzBWQUJsZ3FtQnQ4aUo5Qk41bFkrdjl3eDV4Q296azVwR1AxTGVXcU1O?=
 =?utf-8?B?cytMNG5sYnJvQkVGMDV4amJuN1ZyalRRV3ZWclNTcEdxYVdMNGdpUFUvZkdk?=
 =?utf-8?B?RnkyNUpEMnJOUVhaSjM4RzgzSzZWT2ZiWkRsdlRlMm1LYmtTQ29abGw2ajU2?=
 =?utf-8?B?M2NrYkdwQmZHd1JiaWFZR1kyYURZVlZkNUhDREtyZGNGdVh4cWxYYmFydkJR?=
 =?utf-8?B?YWdxOStJcHdISFZsTURhTWgzV240cVRjTUFyMEhxZGZxMXVvUGQ5aFhMYjdt?=
 =?utf-8?B?ZmhoOXFSc0hodUNJSW1vSWRuc1VBWDNXTVhuMkhWTzFlTDZLOVMxM1JlR3hW?=
 =?utf-8?B?SjVUek5aT2FlSWdSWE9MdGc0blFBTWhJLzNBVklKQ3RZa2pDb3pGeW05TjRI?=
 =?utf-8?B?N2Q5SHZ3dXJuL1RjcC9GY2lzb2RITndLdlVoMkloYTdFY09zbzNlS1RpcEwx?=
 =?utf-8?B?MllvczlUM1BZVlpWMitRYXpvRVRRQXNGSW9EQk9QVTE4enBERTJUL0o2a1BM?=
 =?utf-8?B?c2VaNTFnREcrWFpmNVdtK0QxZTJ1N3VPb2NvL3BTeUxNRlM5cGxWR0xJdW9D?=
 =?utf-8?B?dGxUTzZDZ1U0QUJDYVI2MGpHcDU5TW12NUFZL1QzaC9PZSt3TjZ6RUZSLzRm?=
 =?utf-8?B?eEZ4eEc5bDJsVlJnbllzaGVuKzl6aXhPczVmdWo4dHhOMXhIdVBEdTkvNUJ6?=
 =?utf-8?B?QVBMdzRmeCtLcFZDVk1wNEhpM2hYcXIzRXRJWFp3TXZQdERlOWZ2SjJYMG9T?=
 =?utf-8?B?eHNVeFZsZno2L0N6VWJRdFRWa0VrM1dYMmJudWFBT09XdXM5bVBia1FSaTJu?=
 =?utf-8?B?dDZGdzZWOTliR0xXWnVWZGhIR2NVa1liaUJSdm8xZmFzVmdna0cxMUwwRXZ3?=
 =?utf-8?B?OHdITEIxWUlFdlRxM1hUU3hYZVRxUTNCRXlrbEltbm9vdms2MkN3YjkyVkQ3?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CTKBchZNR255sUC5UfZUsu4Eg22K+R3W6NYGTCvduTW8wEs5rm4igAwg4XJ9iGTrEU45ERykMaHJ6ByFYgMTJg7gqxcRUPlOgqyeMR5o6IkqLeRfqyQOXyB9VKHEJFQsRb0eWfFihXoKIhQ5qaLxmHWgQYy4vX8i3zOgHbIG/dy9NqoEWXJ2FymsGZmbTORNYIwrgmk1anAamQbmfS6u08gdgpw7eSH5O84H9ytZHFTvXVlMRIhUY5VZk7v7nV1qbZd+9Ln7vEpSc3+quTPYlwQkU4BYWxNSgOT9Twse2wHEKAiFu+HHu99couxsj52D84VCzsk8cRiG3RHTYnALhwxhLlQWL8hSGL5KyMNfF3ul+i+ArbVa//oH3IiSSlaDP5PrU6/HP1GMvtZEy0X2olkoDvElxPC1UZ00xpjZavYtC97wYjzAiOZG5w/LjhxLz8ey0ZO2s2pcrPoe/SffKJOR1+nCfWc+nyyLoFwSGMsUOexg+whDNGNgMwGqya+RLxYqEIldVLAdQkl1I6e/9V4cmFmc7w8843J7lJHxSP6vxAB94zliTgrpuboOMJInc8r4fUNWbiiufa1Oox0IMMHNDEMIxsH1+eEuDlDB+SbuwFmfck1Ltq7KFGQy5pRDXFeoWanR99+tZXdvE8dRMj8RYniem/LxuD/IUqMnzr3oe2zJDkPLmtl4h/bx7B/5Jdfuuug2vQLgwsg4iC9aQgCusFy1dNn4k33yp73p1AqQEDjx9+X3Fvcqn4I9rNsgchi0ol9g+4jgqTUVsaEB4TACjM4soy7oAfsEzm+/N2x9RIFhGJZWQuIcCiUqvz34nHPvx1Y+Eg54XrbR13BnmE2ZmI/w6E6VggIQcwRvpXu9i688Mcz0H3Z9mwfyUkh0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e1d7ce-7d95-4367-c878-08db1a55a712
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 13:05:38.2656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+LRrVok5qCFmjUKJx/E7ifbY5CodYlCUxgW8lEKpxSyhlRfT3DVNHG6VIvXb45la9YUQBKQzt/2gTvh4oHSu+Gk+fADkd/k233RymDNOhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5198

On 28/02/2023 7:11 am, Jan Beulich wrote:
> On 28.02.2023 08:09, Xenia Ragiadakou wrote:
>> On 2/27/23 14:17, Jan Beulich wrote:
>>> On 27.02.2023 13:06, Andrew Cooper wrote:
>>>> On 27/02/2023 11:33 am, Jan Beulich wrote:
>>>>> On 27.02.2023 12:15, Andrew Cooper wrote:
>>>>>> On 27/02/2023 10:46 am, Jan Beulich wrote:
>>>>>>> On 24.02.2023 22:33, Andrew Cooper wrote:
>>>>>>>> But I think we want to change tact slightly at this point, so I'm not
>>>>>>>> going to do any further tweaking on commit.
>>>>>>>>
>>>>>>>> Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
>>>>>>>> updating the non-SVM include paths as we go.  Probably best to
>>>>>>>> chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
>>>>>>>> only got one tree-wide cleanup of the external include paths.
>>>>>>>>
>>>>>>>> Quick tangent - I will be making all of that cpu_has_svm_*
>>>>>>>> infrastructure disappear by moving it into the normal CPUID handling,
>>>>>>>> but I've not had sufficient time to finish that yet.
>>>>>>>>
>>>>>>>> Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
>>>>>>>> disappear (after my decoupling patch has gone in).
>>>>>>> Why would you want to fold hvm/svm/nestedsvm.h into hvm/svm/svm.h?
>>>>>>> The latter doesn't use anything from the former, does it?
>>>>>> It's about what else uses them.
>>>>>>
>>>>>> hvm_vcpu needs both svm_vcpu and nestedsvm, so both headers are always
>>>>>> included in tandem.
>>>>> Well, yes, that's how things are today. But can you explain to me why
>>>>> hvm_vcpu has to know nestedsvm's layout?
>>>> Because it's part of the same single memory allocation.
>>> Which keeps growing, and sooner or later we'll need to find something
>>> again to split off, so we won't exceed a page in size. The nested
>>> structures would, to me, look to be prime candidates for such.
>>>
>>>>> If the field was a pointer,
>>>>> a forward decl of that struct would suffice, and any entity in the
>>>>> rest of Xen not caring about struct nestedsvm would no longer see it
>>>>> (and hence also no longer be re-built if a change is made there).
>>>> Yes, you could hide it as a pointer.  The cost of doing so is an
>>>> unnecessary extra memory allocation, and extra pointer handling on
>>>> create/destroy, not to mention extra pointer chasing in memory during use.
>>>>
>>>>>> nestedsvm is literally just one struct now, and no subsystem ought to
>>>>>> have multiple headers when one will do.
>>>>> When one will do, yes. Removing build dependencies is a good reason
>>>>> to have separate headers, though.
>>>> Its not the only only option, and an #ifdef CONFIG_NESTED_VIRT inside
>>>> the struct would be an equally acceptable way of doing this which
>>>> wouldn't involve making an extra memory allocation.
>>> That would make it a build-time decision, but then on NESTED_VIRT=y
>>> hypervisors there might still be guests not meaning to use that
>>> functionality, and for quite some time that may actually be a majority.
>>>
>>>> Everything you've posed here is way out of scope for Xenia's series.
>>> There was never an intention to extend the scope of the work she's doing.
>>> Instead I was trying to limit the scope by suggesting to avoid a piece
>>> of rework which later may want undoing.
>> Can I suggest to leave hvm/svm/svm.h and hvm/svm/nestedsvm.h separate 
>> for now?
> As per before - that's my preference. It'll be Andrew who you would need
> to convince, as he did suggest the folding.

Please fold them.

I have strong doubts that they would actually be unfolded, even if we
did want to make nested virt a build time choice.

(I'm not actually convinced that the existing nestedvcpu structure will
survive first-pass design of a working nested virt solution.)

~Andrew

