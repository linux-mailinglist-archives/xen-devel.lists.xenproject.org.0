Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA706E5210
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522316.811567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVlW-0003yE-8W; Mon, 17 Apr 2023 20:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522316.811567; Mon, 17 Apr 2023 20:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVlW-0003vx-5W; Mon, 17 Apr 2023 20:47:58 +0000
Received: by outflank-mailman (input) for mailman id 522316;
 Mon, 17 Apr 2023 20:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOAz=AI=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1poVlU-0003vr-Dm
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:47:56 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ef00dd8-dd61-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 22:47:53 +0200 (CEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33HJ0eMf024457; Mon, 17 Apr 2023 20:46:36 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pyjuc46nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 20:46:36 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33HJZjLu031978; Mon, 17 Apr 2023 20:46:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjcanu0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 20:46:34 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SJ0PR10MB6423.namprd10.prod.outlook.com (2603:10b6:a03:44d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 20:46:31 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::70ac:313b:544d:4f45]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::70ac:313b:544d:4f45%4]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 20:46:31 +0000
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
X-Inumbo-ID: 1ef00dd8-dd61-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 to : cc : references : from : subject : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=Dik3CTs5kluBXXW+c9tt0GXpgHx50LBCrVssZ6qybKQ=;
 b=pe8762NDrY1nqd9QBmeYSOJh5lX/B1dyiwIg1X1QGfSaKOTZJhO32r6uNW/uJZIWKmZo
 lhrsBVolwdorsGwTRJY7qIWC8HtYpLzSDWB1/La6CGBGb5lH0o8IL6jelPuwwUTmETBD
 kUPSwQkCpqfRTl5XsVfK0N/FBGq8sO/XXeopE9HWaflUV02EunjUafWYToq0SBX8G3LQ
 sBhQlGBTp5vBIua+nUCKZl7HBVEfQzCBD2lSjXp47Q7TXddfytiM0LucLFE2XXdawqTT
 zAJ2qYih4Wm8OKV3Pr1DhY8Jn01mdiAMqLAMP3YZbMvK/rsPg11SosgmfzuBlvQEIakV zw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nn9CnRSrGrUV0+/hmoiicoEn4H/hle7r15VGUKaRpXRn4RccPgNw8qZfgpm8DZvUlzS0tgWgRyJHnqt2TjhlDx1hrmAaDHbIIAxAlmLWvGJTkXbOyvUPg5Kxq5a6rdXpUiOUL5qRjHca9KUEzV7DvxWXvRQEr84YeQnJsCheKQq2TLJ+37wCzee5/zQmMSQXI7/KY2gaJY9MidlgSvGzA5GpPIPen4+M4mj0sOB+wTW5mmwToEhvnz0KWwZDoCAiQXPO+QoSUQc+Tte1fhTBODcTBZ8CZjhGoK+F73TwUH7MM07C9C92a9GmA9xlA5zla202MaZXRGuGZiSxgwIC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dik3CTs5kluBXXW+c9tt0GXpgHx50LBCrVssZ6qybKQ=;
 b=ZT4DpdDDcvU4A9+glvi+/tu6b3tKMFV58LPM01tqFW4Y6RNhBAR1437BmYwdhcDXuVbl9WYatHPzeufFfwl6Joq0bGuZJgvNXY4EnM8QysE0O/XtYKS+V0zt4ss+S9waIDzG4zwB8PKn2koXIvTUH1OUdzIExv0ltXCmWaA5fAjFc84qN+iM5yO5gmJtYYHuypOJ00V6bIlHZiFWOJ/OBmBPJAJSoHxi+mFhnA5ZjdajSOEcctaoF99XJ+sUMk/EWJ6xvatYiqywg5vgR00MCqjThKMX/n4GI2JVWWfa9dCqY1jT8PK2WI/UUGnOyZYEhkCAd8YcjFupKgVEs+0FzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dik3CTs5kluBXXW+c9tt0GXpgHx50LBCrVssZ6qybKQ=;
 b=MOdN8AzLNIqVngZFV8fsxRYyftGAS9xS5AjTIJ0mdPvCYqKW4KR0vjOUiPMARKIfssSBP74g1it8yrIjASzSpTkUl0qWrWSv1BQyAXJlv67Y1pPx2ZrEeFCmrU8kcL5d+xJ3AcvbWHCbjBgT0ovRcriywBuJ/CPun11nDrjN1T8=
Message-ID: <9914d517-cf10-a06b-c782-c74d2f24ad46@oracle.com>
Date: Mon, 17 Apr 2023 16:46:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, David Woodhouse <dwmw@infradead.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Brian Gerst <brgerst@gmail.com>,
        Arjan van de Veen <arjan@linux.intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul McKenney <paulmck@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Sean Christopherson <seanjc@google.com>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        David Woodhouse <dwmw@amazon.co.uk>,
        Usama Arif <usama.arif@bytedance.com>,
        Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.194293270@linutronix.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [patch 16/37] x86/xen/smp_pv: Remove wait for CPU online
In-Reply-To: <20230414232310.194293270@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::20) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|SJ0PR10MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7e9894-5935-424c-27d6-08db3f84d314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hp78QesZsk+ufzGrNhzZAke4U6ifyKKuUkHUNPc4Acr6oW/0KXdGfLJM+phFO/7LaVhHeAnYs2ih/L2Wj0eeI2JYJpKleeudxdxaGXkUHOo77A6ioXvzq+vhvZwEeVZ8gwxUtf2Mj5J6L9Z4j2YLN4vJwzYnOtkOp2k7Thjx/674eZr4njHRofPwCfr2VO2Vn+zPuyIGpoY3//eKc2jAKbnr0HAMJiG1OyVC0itF8YsQJ033x3HSfoh1YZmBSekdhAbB4+Cw62ey+W2Vkp2rMRxlm0ZEc/n//WmBEp0CZcz3nrYTu72wsxbabrZ0VvvlJtFS5LwXfI8RvpdahP/TrXj6E4jnrAeQqofp/vrMnXnFSpNIW/yTmXFPycF6MltSMhFVrZo2mOqLWG3MmpMRkdbpYZ3RhsCC19G+6FVkDzCNBkz55AnMsW6nJq/nTTIujgIDGjlPJBzCnk1zHzHALzFWlVSBa8GeXeIrYpjKGNB7i4ejcP6N3qyJK7TCMP2u5KnmbEo/EQQ0ugKk1dDE9Y1vAyGj7KAekpJthswoX7WSVvgMMDiOPldEgHx+6eP0jwX7C39eOO2z/BusV26CCIcLh7BToFVWIp9wtrtJddCOY8wXKE8x6xwt2ZYs24Oi4ln1MpOF3UdJyhbmrZAvHg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(86362001)(31696002)(83380400001)(36756003)(53546011)(6506007)(6512007)(26005)(186003)(2906002)(44832011)(7406005)(7416002)(2616005)(6486002)(31686004)(5660300002)(38100700002)(6666004)(8936002)(8676002)(478600001)(54906003)(110136005)(41300700001)(316002)(66946007)(66556008)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QS9rMnNESnl1NVZkVGFxNkdPU3ZDUlZETGtzT3NhVll0UmxqeWNIb3AyalNx?=
 =?utf-8?B?SGU3K05kR05jVEVLOFlDeUdxNFNuMXNIWHd1c2laWml6OEszZ1kzRFkyMUhp?=
 =?utf-8?B?R3ZaMDZibURuY2JYbXRUMGd0RDUvVnJlQmN0QkgxdWlxMkl5OUN6RkJyTytt?=
 =?utf-8?B?T1c4TXJJUkJ3YWRTa0ErZ1NYa09TbmE4SXErSUYrTU1lTXlJNG03TzJPUURQ?=
 =?utf-8?B?T2w3a29JdUlSMHJWU0ZHb3psYUNUaVpUa0hkZzdMa0NCUzBQMDV2Z09qVHM0?=
 =?utf-8?B?b0lkd1p0YUhkdXhuMmFrN042ek1QU1dsbk02cFc3WWljSG5nVWUwbzRIOVNu?=
 =?utf-8?B?ZXgyVkcrREgrb1NUdmJQUzJVdkRNUHlmN2FhSUgyTlVvbk1QVFYzTCtOZFNt?=
 =?utf-8?B?bHVlenNvU2ZnVDkzMDFtSzB6U2QyT2k3bXFFdS9kMWUwdFRCOHI4MU9wUEYx?=
 =?utf-8?B?WmMyQnlmYzEvYXNEVFA1S3VYVHRBdjVKK1VYV2ZHUWtoa3NydWVaYUxOSXFO?=
 =?utf-8?B?NUFvaUpCTnhxM1R6KzRySFpHcm5FcENnU2JhTmJYVzBEem5rK04yZFdNQXh3?=
 =?utf-8?B?MVllZXNsSnp2VEhRYk9vUVo3YlJmZ1MwN01zNyt3SVpESUk4aTRrZzNxcFZT?=
 =?utf-8?B?WWtuRUE4b2lVRXVPczZPOWFGK3MzS1J0eENlekJkdUtRckNUS2lDWTYrV1VL?=
 =?utf-8?B?OVdLSlpjTEkxZnZkL1V3TE5JRGZaVnYwemYrbzZMck5nNStVd0NVbzgrZGxv?=
 =?utf-8?B?OE9CNXNUblNKbDVVUnBKUDR3ckRSOENFWW1BQ0U0clVtUFhOWFlSY0dmUDQr?=
 =?utf-8?B?MFB5eG8wY1pleDhNZlRkZXJrbXE1VFM1cFNyUXhJZnNXR3JCMFpzNmlSTnN2?=
 =?utf-8?B?Sk43d29YMnM4UVg0UFNSemFJQ0R3MGhqYkhzWjY5WithTGVtVnowL0ZNR0pz?=
 =?utf-8?B?SWdVQ3ZMbyt0TW1BSmRMenY2R1hERWRzcjVwYStnWXQ4L0wwM3lXWUFia2I1?=
 =?utf-8?B?SU4vanlTK2t5VlV3UC9KMFNzVzZDd1phV0t1UTVadTN0eWFMYmNDdlNKR2li?=
 =?utf-8?B?NTJoaFU0TDB3emdGTjZwVmxzdVU3NGxNbVBDMGJaek5QMEUyK25vNHdJOENE?=
 =?utf-8?B?d3Vxb1hvUnZyQXAwVzBWV0RHQ0JxdDYxa2syQWl6UXo3N2xpbndRNm5tQU1P?=
 =?utf-8?B?WG15NUI2K2NyRFhUK2lxQWFMWWxZZGxrcXplalpGZTFQdFRYWUkvZFFyelhj?=
 =?utf-8?B?enUzTVYxR01WZUoyaHNVQ2ZCMWtmeW1yZG1ZckNvS0oxUDI1WjhqWEtYcE5U?=
 =?utf-8?B?ZEpEVzBSeFBBcDNtek1TeTFCQmxnVGtWRlhwemNyM2hyMUo0aTFwSG5EbEkw?=
 =?utf-8?B?TGc5NlpqL0Q5bnU1SW1hUkdoNFZabkNqU2lnZ3FDdHN1MmNsQjNCV3B5K2FY?=
 =?utf-8?B?dE1PNmdlbE02Q29IVW9QKzFucC9lUld5dGdvYk90ZlgwK3ZRYVJDWFhvUzc0?=
 =?utf-8?B?L1JUdE51alhsL3hZb2o5N3dvNGhLbXVPOUJTOFhTNUxaSGZiOWdVRnM2Y3dn?=
 =?utf-8?B?Y29CeDNCQmZ5Ums3MFA1bXNxV1VRWDhzQ0EyYnovK0EvS1hIa3dTVit5ZDZG?=
 =?utf-8?B?WFkzT0xtTjIzTUZVSXlScDZGaENnYlZNTlRGRVd6d3E4S3lMMklYRDlTcmhv?=
 =?utf-8?B?Z1JyUS83VmRJcGhwdmRTdE9nNmVHNldPc0g5VVF2UUZqa3ZxcEl3YU12L29J?=
 =?utf-8?B?Q0pLcXpiWmpBeTNaSzZvRGhFbTlUOU1vRGtEblJXRXhIMTA1dytjS0hZcEgx?=
 =?utf-8?B?QW9JZ0lRdU56NjZ0OXJwZUhBTWhDM0xQSjVJWEFiaHJDVDA5dDZER25uVThR?=
 =?utf-8?B?WFEzRFh4MXJYODY3eFYyTTF3OSsxUWoyNjlYOUkzVXFrWE5tRzRHdnZ4NFZw?=
 =?utf-8?B?a01EQ1llbmo0TU9Dd0hhQ3YyTUZWUHo2UmF2VXoxSFlzMndiRGJRaEdaSDBl?=
 =?utf-8?B?L3FMN2hrTlBoVTZqOU13YVhpOUhWT2lSRkhZRW9rb1RyWFR3ZW9uZi9LR3pQ?=
 =?utf-8?B?Zk1FRUZUSzc2eXhpREtVOXhQcFNWenhUN0ZGa3pzK1VGMGNWWXhsdzcvbWlm?=
 =?utf-8?B?NGlvWjI5TlFQNGdZS0E2ZkJyMUFLOHI2M1ExMjk0YmRhZ0MrS28zMUJMRDZH?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?ZkF6bWp3L0EyalFoSVgrMERuOWRLUGFScXp5UE0zQkJTVklHSFRqY1N2MkRu?=
 =?utf-8?B?NGRMVGhTUlZoQzlFTmt1UFM1RS9INlRJbFhQOFZ2L3pGYVNxcmltMm0vcEZU?=
 =?utf-8?B?Mmg0ajMwYkczTDBCcmlBSU5nY25ReUVvWSt4blI4aklUY2xBVWMwT01nOHlt?=
 =?utf-8?B?NzZ1b2srNFppeTV2S1czNWFOR0htOG1hcHJEY050ZjRZYitkMWQ1RGtjYjNz?=
 =?utf-8?B?MjB3TjJWaURraXdwdmVabFRUUFArd1A4OUI3aUNGY2RackpQWWRCM3FzQU5Z?=
 =?utf-8?B?Qnh5cy9QL3U4RCtiSGtzdTZDdHZnTnRWNFRUcHRLYU40aHJqMUFsajlqNXBi?=
 =?utf-8?B?cGNmVlVVTVlSblJQL015UFh5UlZXd0t5V0VjSkZFbFdjZVFXVXJRRmxPZHZE?=
 =?utf-8?B?WEZuVVhJTTBxaE1QQy9SNytKZURZdjBsVzBiQkdlK2hNRHBQbFhMdHNRQjk3?=
 =?utf-8?B?OWh0WnVUZVdQV3YwTGw4U25TSTFSbXlRL1VkYW93aWNpWlN5Nnd0L3NNWnlZ?=
 =?utf-8?B?RXBoT2FlRUxqUFRDWC9VWnllekZabk4vMjdCUXlBdTBSWXJSRWs3RGdTeFZV?=
 =?utf-8?B?bVNHcjdnQnhyYlNHdlRTVjFDQmsvU1ZpdzBRcnA4MFJVUFlPOFFrc2dDUEMx?=
 =?utf-8?B?c01hTWdoT0Q5ODFVcDZKTGZibkZralhFSU0wRHUxZ3hzRkg5alZBcm9tckV0?=
 =?utf-8?B?OC9kQ3NJWVM3Yi9CZzRIQnM1RFZ0TllFc205eG1xanorNUU5Nm1PQlBKNzZX?=
 =?utf-8?B?cUJWeG9iWnZ1QitJSVNJTXVqbS94N2pNZTgydkphTTNSQTA5M1JMV0djMVA2?=
 =?utf-8?B?RzJLMHdXMzh6RDVuS2VQd00vV2p5Rk5kK2YxTXRjZWtoVVkyeGs1MGtOaVpt?=
 =?utf-8?B?TmR3Z2RJS3YwVDhIZzRjSndpSEMvUFlMMWJEaDVuSVROcTV5MkEwUWdkbzlr?=
 =?utf-8?B?U2RnbVpTb0loYXBHKzlIaGpaYlpUY2UxQnpDWG9uMEtpY25JR2xNNnAxS0pP?=
 =?utf-8?B?L1FmVTJ2MWo3MlRJL0NTMVI4WWVqNElYcW5ic3dudnR2RVJLTnV0M1NMQ3Vw?=
 =?utf-8?B?enpjRFQwQSt1RzZhZXRSQ003MzlDdVdoRmMwY2t0a2hoaEdSQzRmKzRYOTk0?=
 =?utf-8?B?KzNqOFpYSUxrb00rNVNPVS9uRW9zS2FXQU5ZZnIrcm5MUmJIeStrZWVLZ05E?=
 =?utf-8?B?bFl6c0U5bmNKdThWOEpKV2J0dTVXUE1ZeDZpNTZ0SmlPZjM2S2FxNy9ndnRz?=
 =?utf-8?B?RnkrZGcrYk1oM2pIM2E5bWxXb2l6WWxtaFpVWjIyblMxWExBS3BYWG9BdFVp?=
 =?utf-8?B?R0k5TldSS05LYUJpd2hxVVUvVWVKKzNGS3lSLzBudTVJWXUrWDZWeVRlOUVP?=
 =?utf-8?B?TFQwek9qTCtXNC93MEhXdDJmSG9FbzRIY2F5bUxXQU9TVVdmUlFFN0tYZzZY?=
 =?utf-8?B?VlFaTHZqYkhTdHJqSE9VNFZBTlFlSmgzSE9IMVRDbWNzaVBxTm5KaWZxRXNt?=
 =?utf-8?B?ZmlqdzZpenNQLzVxbFA5MzlxSnFreDRyS1lod2tiM0tIakVUamI0azFLM2Za?=
 =?utf-8?B?bEcxMFFMcENvMDYrQ1VDYWtwb24wU0h0ZHpMdzk2NWtoVGQxVFJLMVI2U2RP?=
 =?utf-8?B?ODFZVkY1bGczUENoNzhsajJ5ZXVNZlk1V3N2MXFWbEg1Nm9FTjBCWEJRekRz?=
 =?utf-8?B?d2R6YmJNSXFPS0M3ZU55VEZaWmxVbWxpL01pWm11NFpiYTJJRjBrWGsrOGVy?=
 =?utf-8?B?NHRlcWFTa01jRk5EMEwzL3JrdVlDQmhsdzE0cExvV2R3czIzNzBGSmZkQmll?=
 =?utf-8?B?L2lvWis2THN5VUFDaXhyL0JET3dSOGcxclRYcWFodENlVE1kVDVMQUFaYnlN?=
 =?utf-8?B?Z1h1ak45T09CeVJWaXZCRlllUy9mS1pGaGh4VWhZdlNiWHA2eXpFRWw3OEYw?=
 =?utf-8?B?c0JtZFEvelp2UzRzQnJqWm1aMWlOYituT0VlSDkxVzEzdUJvenRsZGRlOENn?=
 =?utf-8?B?U2l5NzFFcVRqY01BM210UTlFZWNmeWQrS1JGMGpHK0NOT2srNjFPTmphL1JV?=
 =?utf-8?B?SjZuWEQvUndsMEZaR0xSWmRncDI3QlpxeUNlSCtvSm84OHZ4VU1oMDVlT01n?=
 =?utf-8?B?TGw5ajdlajlBNkV4akwwbFVmK3l0UWxSZnBlVXk1ZXBma0NIOFNLODBIREZu?=
 =?utf-8?B?aDlNSkVrSUpBamdqN1pHdXJOSS93ODBFRS9OdGFTT0o0UUVmZStJOFBhVXZT?=
 =?utf-8?B?cFZQYnE0dkhFUm52ZHJVK05ZRkFRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7e9894-5935-424c-27d6-08db3f84d314
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 20:46:31.5113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4xClfSDkM2poLEaUQXiLHA5qZIpYq/FGfjTvTEdKFD8DcSQn7SG2UmbwTGULCnlU8GWneUTA4M6YoAcSGDFJFxYakWP8xUMhL3fYbVGGZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6423
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_14,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304170183
X-Proofpoint-GUID: QmFEh5ZhXzphhqQeiblSz4L24eGPHOo4
X-Proofpoint-ORIG-GUID: QmFEh5ZhXzphhqQeiblSz4L24eGPHOo4



On 4/14/23 7:44 PM, Thomas Gleixner wrote:
> Now that the core code drops sparse_irq_lock after the idle thread
> synchronized, it's pointless to wait for the AP to mark itself online.
> 
> Whether the control CPU runs in a wait loop or sleeps in the core code
> waiting for the online operation to complete makes no difference.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>   arch/x86/xen/smp_pv.c |   10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> --- a/arch/x86/xen/smp_pv.c
> +++ b/arch/x86/xen/smp_pv.c
> @@ -340,11 +340,11 @@ static int xen_pv_cpu_up(unsigned int cp
>   
>   	xen_pmu_init(cpu);
>   
> -	rc = HYPERVISOR_vcpu_op(VCPUOP_up, xen_vcpu_nr(cpu), NULL);
> -	BUG_ON(rc);
> -
> -	while (cpu_report_state(cpu) != CPU_ONLINE)
> -		HYPERVISOR_sched_op(SCHEDOP_yield, NULL);
> +	/*
> +	 * Why is this a BUG? If the hypercall fails then everything can be
> +	 * rolled back, no?
> +	 */


In many cases this indicates either some sort of hypervisor internal error or broken logic in the guest, so it is, well, a bug. But I suppose it may also be some transient condition in the hypervisor (I don't see it now but it can happen in the future) so perhaps we should indeed try not to die on the spot.



-boris


> +	BUG_ON(HYPERVISOR_vcpu_op(VCPUOP_up, xen_vcpu_nr(cpu), NULL));
>   
>   	return 0;
>   }
> 

