Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952474554E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 08:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558006.871769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGCly-0000PU-1y; Mon, 03 Jul 2023 06:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558006.871769; Mon, 03 Jul 2023 06:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGClx-0000Ni-V5; Mon, 03 Jul 2023 06:10:53 +0000
Received: by outflank-mailman (input) for mailman id 558006;
 Mon, 03 Jul 2023 06:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hCK=CV=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGClw-0000Nc-1t
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 06:10:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ad9e684-1968-11ee-8611-37d641c3527e;
 Mon, 03 Jul 2023 08:10:49 +0200 (CEST)
Received: from DUZPR01CA0349.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::14) by AM0PR08MB5428.eurprd08.prod.outlook.com
 (2603:10a6:208:182::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 06:10:45 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b8:cafe::8f) by DUZPR01CA0349.outlook.office365.com
 (2603:10a6:10:4b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 06:10:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17 via Frontend Transport; Mon, 3 Jul 2023 06:10:45 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Mon, 03 Jul 2023 06:10:44 +0000
Received: from de3b029c99cd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DAE93B2-94F7-4F47-96A2-10DFF62EC42C.1; 
 Mon, 03 Jul 2023 06:10:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de3b029c99cd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 03 Jul 2023 06:10:38 +0000
Received: from AS4P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::8)
 by PAVPR08MB9794.eurprd08.prod.outlook.com (2603:10a6:102:31e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 06:10:33 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5df:cafe::46) by AS4P250CA0006.outlook.office365.com
 (2603:10a6:20b:5df::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 06:10:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.17 via Frontend Transport; Mon, 3 Jul 2023 06:10:33 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 3 Jul
 2023 06:10:32 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 3 Jul
 2023 06:10:31 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Mon, 3 Jul 2023 06:10:29 +0000
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
X-Inumbo-ID: 5ad9e684-1968-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ddtpptgBVErJpYyc7OJBm5OKLGxklqjneMQV/9ZNmc=;
 b=pNBCxvFim+SSCiorsnRFvq8c5vKRR49g9u1eNO9N70uzImE+aCzqCz3OdZxESw8WU1tPmC10mfOm/cKraLuEO2z1P4/HN3nrWClszixLvOShKYixhtcLvAqh+5QOHHltJVSqYuitKouIrAqIzCO9je1EfF+lzlY02KXusIaADoU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cda4d3550265ad68
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTyA86J/FX6FJqcXzTN8eWEC4r0nt17sys+ZT5fM/1VuIVQr1mL045mQ3zqMkuSr5oXzer3FEFyLgYFO4mztKXF/eJwKOT42fHANy2uwWokI0lw8EaKfYBy6pWRpenE6OmwqXFRm2pQMusSCXjh9MC71tqEv2vNd4WJzmfmOpWL7xL8Y5aF5rkhaPbv6lZ2V79tvb//4BdFBE6/2KZpJvE6fGLVK/pnO1JrO8zWzvkSM94Be4RVhDdk14GfBiV8ZqM/p7PZhEoAOX7dXBFTFwxqQb1vlIN8/Ago0nx6C3joAfksIzv0ZWeF3XsBNaqAiwmjbuebKXs3IeQQ89O/Ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ddtpptgBVErJpYyc7OJBm5OKLGxklqjneMQV/9ZNmc=;
 b=M/ukbSpRiajz2vEIrsqCgLXP1Wzj8LRkT23vnN9e5VlihRRRWThN3q6Peq0A8adsNGdBDbMjQuKC09mmllUlZ8OBQLRk8b6vZgtPKJ61n22yFcAiSDGhbi8KrNwQ2HT2fZIbwtEGsiNYVdAwK1EgoiScqdAgHdhbaR5fCYy8SpQsAYjJPkCjFTfKTC3urNeNWcvogDdnP0op17NODQUAzsrWU1clSP6TtGqZUaIMK/8qrGOlad5Kr+r4OIHyf7tccKflNUd1W4SlybDL8B02NDiqjXONVThxpCgBBmLC7FGaqcH8FvV5VBb2auFay48XrgXTjPOEMx8UcQ2EsKzFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ddtpptgBVErJpYyc7OJBm5OKLGxklqjneMQV/9ZNmc=;
 b=pNBCxvFim+SSCiorsnRFvq8c5vKRR49g9u1eNO9N70uzImE+aCzqCz3OdZxESw8WU1tPmC10mfOm/cKraLuEO2z1P4/HN3nrWClszixLvOShKYixhtcLvAqh+5QOHHltJVSqYuitKouIrAqIzCO9je1EfF+lzlY02KXusIaADoU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <db707ef1-cc91-bc7d-33d2-bf804ece2226@arm.com>
Date: Mon, 3 Jul 2023 14:10:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 33/52] xen/mpu: initialize frametable in MPU system
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-34-Penny.Zheng@arm.com>
 <ee709651-a6fc-2485-ae2b-edf0306fbc13@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <ee709651-a6fc-2485-ae2b-edf0306fbc13@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT030:EE_|PAVPR08MB9794:EE_|DBAEUR03FT052:EE_|AM0PR08MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: 620ba86c-7b40-4578-5170-08db7b8c3cec
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9aSGM2pI99lv6gTqc/HpxKf7+RMe+ugoSO7vITA8I/HZxxaEycGSNwVSY2Y70q0C1HMgnde2d33gnUDjn8BKYpv5RHeQPCyK+XfSToJplXf8ah6zzHwg5KEHAwxOArahlzoTZ/i/cJ6H5i1Tfh3OZkFZzhYaAIywTzsB/4jZGnCWhMUDf9PMciRwMqnWa1e0PmCmw9Q4Fdxi8UdWpJ99dJ5v49aoylES5voFowdgkvKkkpp58fLWCBnXEoJ8h2mDNpUYyxmcfXLG6/HmAhn8R2uer8a119qfdH2S4ffChoe9/FdBXKc7PzjxOmWigL2ZBDajNJ7ZcVMPj67j+YJJWYTQ2PJ5h4rMyZmhUO1SSQc6pOUX2+syAmO4itztnJZnXddUqnU5fjGDatcgXDEapN1tWwFWEZcfYW7NRFdYy/0qyfsp2XQN6Su+sEp/1FXjzTnmgT7jCdbTx+nGbPjmiqwRSmqQ9XdcxD3e2UarHu/TKqH0dWUaCc1fWUZhTvlREbQulYGe+tFhe4wQBzwSEQzmDmyaKlqA7TwFc8AWnfppQXi6zcyyFn9g8dUEh7IQltgMVuvFDQfqxNkzZZxPwiQCq7UFe3bCnrwqZovsZknEBMV0Xr2rvuIX8eeN0UUYq0lsKUuD0AJ1Kz8iVi3I8md7xP3CRtyV1EApG0R7CvLesrzVaKwLXgIknh9wWsrgfrY/ngHMjhyL1niLThnJc8ESsqVZasos1p/rIII/rCk1kRI9k8fib0LgoG1rZ4N/DLbm7N9PpxBnMzfged8XWWf59b+gnVPIXsVeDbreY4MeInSGtU7YA/7PfaHbWAX/3sbNdWxU4L8TRmgNa5B4dQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(26005)(31686004)(478600001)(82740400003)(86362001)(31696002)(2616005)(186003)(36860700001)(81166007)(16576012)(54906003)(70586007)(4326008)(83380400001)(356005)(336012)(110136005)(426003)(53546011)(70206006)(316002)(47076005)(5660300002)(8676002)(8936002)(44832011)(40460700003)(41300700001)(2906002)(40480700001)(82310400005)(36756003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9794
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d8a6176-5f70-4d7f-8025-08db7b8c35c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t3U7Btl2goS0gYCbWpR7Qt3+g6Vu6MyVFIXpZdU1bPEvH/wxtUHM1CigWH0I1XRrp3siunfSnkRbtW9QY0HcKlr2bhRDjRYY/ofjVogH7IKdEtnvB5eQUnucSq1yU5+bS5yOfP4qZi7yRAkME012wi5sjpzefQp5aCoqjvhtaVP6QksPWRP32/T+BpIkDA+B2nZQmfh3yRulPZSEyBkjOauCLL/p7EqbtWDcWpy2iEbEgzJXXx6AAbpKwITavifDtNiXcLQ5j/szALfLJBRKjL7+Gyrulss+keXpFKdC44zNp4za22hQA/Xq1Ss3qCt/eTJXzWTxHwf66kKTIRhL9vZ7G5e0T9P0ybLUYSg0IzAOi8Rr3TbytdsbsYJvWcpFzwLhJ7bJOvklixSWcbY1q1SsTxfMZWWkcFjRMeNakMTUOpqOabX51HxIveCMn956miOYWtJtTCYDdZVSGGVFMBKXbm8p6iIUkUfdgixj+MWazc99+iZBzaVcI06+fNqWC1Pv3jSkFlSUQYAfSdtSloV7N0mOS1Z7TNLavnLxlnHXx0lBICtkvCgQR5jNbz+X6gDHyJMznvMaVpwD1CgZUQjizb+63sWAPBaw1avsVSyFVcBguZp+Kdj9ctvnVAYvNRDSNSY0DN433tOjeSL+NVL9E70WWqA+YQFa58tTATOS9u8b6hD1ijwJcV2ZfSxA/kjsMUmYVlVR3G14CcyC7rMsSzsEZSozvKN70WSVDRWzTGip+S1Bw3lqEm9f16HAMTBjCn/Kyy6UvaEwM3Cs3vA4S/7nJfH2EjSIuDcPUmgvOCYMZ1WCZhNheMqKO4Ss
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(41300700001)(5660300002)(44832011)(8936002)(8676002)(82310400005)(36756003)(40480700001)(86362001)(31696002)(478600001)(83380400001)(47076005)(426003)(336012)(36860700001)(186003)(26005)(53546011)(31686004)(2616005)(54906003)(110136005)(16576012)(82740400003)(4326008)(70206006)(70586007)(81166007)(316002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 06:10:45.0659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 620ba86c-7b40-4578-5170-08db7b8c3cec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5428

Hi Ayan

On 2023/6/30 23:19, Ayan Kumar Halder wrote:
> Hi Penny,
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> Xen is using page as the smallest granularity for memory managment.
>> And we want to follow the same concept in MPU system.
>> That is, structure page_info and the frametable which is used for storing
>> and managing the smallest memory managment unit is also required in 
>> MPU system.
>>
>> In MPU system, since we can not use a fixed VA 
>> address(FRAMETABLE_VIRT_START)
>> to map frametable like MMU system does and everything is 1:1 mapping, we
>> instead define a variable "struct page_info *frame_table" as frametable
>> pointer, and ask boot allocator to allocate appropriate memory for 
>> frametable.
>>
>> As frametable is successfully initialized, the convertion between 
>> machine frame
>> number/machine address/"virtual address" and page-info structure is
>> ready too, like mfn_to_page/maddr_to_page/virt_to_page, etc
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - add ASSERT() to confirm the MFN you pass is covered by the frametable.
>> ---
>>   xen/arch/arm/include/asm/mm.h     | 14 ++++++++++++++
>>   xen/arch/arm/include/asm/mpu/mm.h |  3 +++
>>   xen/arch/arm/mpu/mm.c             | 27 +++++++++++++++++++++++++++
>>   3 files changed, 44 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/mm.h 
>> b/xen/arch/arm/include/asm/mm.h
>> index daa6329505..66d98b9a29 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -341,6 +341,19 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, 
>> paddr_t *pa,
>>   #define virt_to_mfn(va)     __virt_to_mfn(va)
>>   #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>>
>> +#ifdef CONFIG_HAS_MPU
>> +/* Convert between virtual address to page-info structure. */
>> +static inline struct page_info *virt_to_page(const void *v)
>> +{
>> +    unsigned long pdx;
>> +
>> +    pdx = paddr_to_pdx(virt_to_maddr(v));
>> +    ASSERT(pdx >= frametable_base_pdx);
>> +    ASSERT(pdx < frametable_pdx_end);
>> +
>> +    return frame_table + pdx - frametable_base_pdx;
>> +}
> This should go in xen/arch/arm/include/asm/mpu/mm.h. Then you don't need 
> ifdef
>> +#else
>>   /* Convert between Xen-heap virtual addresses and page-info 
>> structures. */
>>   static inline struct page_info *virt_to_page(const void *v)
>>   {
>> @@ -354,6 +367,7 @@ static inline struct page_info *virt_to_page(const 
>> void *v)
>>       pdx += mfn_to_pdx(directmap_mfn_start);
>>       return frame_table + pdx - frametable_base_pdx;
>>   }
> Consequently, this should be in xen/arch/arm/include/asm/mmu/mm.h

The reason why I don't put virt_to_page()/page_to_virt() in specific 
header is that we are using some helpers, which are defined just
a few lines before, like mfn_to_virt(), etc.
If you are moving mfn_to_virt() to specific header too, that will
result in a lot dulplication.

>> +#endif
>>
>>   static inline void *page_to_virt(const struct page_info *pg)
>>   {
>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h 
>> b/xen/arch/arm/include/asm/mpu/mm.h
>> index e26bd4f975..98f6df65b8 100644
>> --- a/xen/arch/arm/include/asm/mpu/mm.h
>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>> @@ -2,6 +2,9 @@
>>   #ifndef __ARCH_ARM_MM_MPU__
>>   #define __ARCH_ARM_MM_MPU__
>>
>> +extern struct page_info *frame_table;
> If you define frame_table in xen/arch/arm/include/asm/mm.h , then you 
> don't need the above declaration.

It is a variable only in MPU. In MMU, it is a fixed value.
"#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)"

>> +extern unsigned long frametable_pdx_end;
> Also you don't need extern as this is only used by xen/arch/arm/mpu/mm.c.

sure.

>> +
>>   extern int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned 
>> int flags);
> 
> You don't need extern here as it should be used only in 
> xen/arch/arm/mpu/mm.c
> 
> Currently, I see the following in xen/arch/arm/mm.c,
> 
> int map_pages_to_xen(unsigned long virt,
>                       mfn_t mfn,
>                       unsigned long nr_mfns,
>                       unsigned int flags)
> {
> #ifndef CONFIG_HAS_MPU
>      return xen_pt_update(virt, mfn, nr_mfns, flags);
> #else
>      return xen_mpumap_update(mfn_to_maddr(mfn),
>                               mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
> #endif
> }
> 
> int destroy_xen_mappings(unsigned long s, unsigned long e)
> {
>      ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>      ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>      ASSERT(s <= e);
> #ifndef CONFIG_HAS_MPU
>      return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
> #else
>      return xen_mpumap_update(virt_to_maddr((void *)s),
>                               virt_to_maddr((void *)e), 0);
> #endif
> }
> 
> int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int 
> flags)
> {
>      ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>      ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>      ASSERT(s <= e);
> #ifndef CONFIG_HAS_MPU
>      return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
> #else
>      return xen_mpumap_update(virt_to_maddr((void *)s),
>                               virt_to_maddr((void *)e), flags);
> #endif
> }
> 
> It would be better to have 2 implementations for map_pages_to_xen(), 
> destroy_xen_mappings() and modify_xen_mappings() in 
> xen/arch/arm/mpu/mm.c and xen/arch/arm/mmu/mm.c.
> 

I prefer them staying in the common file, using #ifdef to go to the
different path.

Since if not and when anyone wants to update map_pages_to_xen(), 
destroy_xen_mappings() and modify_xen_mappings() in the future, it is 
possible for them to leave changes in only one file.

>>   extern void setup_staticheap_mappings(void);
>>
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 7bd5609102..0a65b58dc4 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -27,6 +27,10 @@
>>   #include <asm/page.h>
>>   #include <asm/setup.h>
>>
>> +/* Override macros from asm/mm.h to make them work with mfn_t */
>> +#undef mfn_to_virt
> Why do we have to do this ?
>> +#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
>> +
>>   #ifdef NDEBUG
>>   static inline void __attribute__ ((__format__ (__printf__, 1, 2)))
>>   region_printk(const char *fmt, ...) {}
>> @@ -58,6 +62,9 @@ static DEFINE_SPINLOCK(xen_mpumap_lock);
>>
>>   static DEFINE_SPINLOCK(xen_mpumap_alloc_lock);
>>
>> +struct page_info *frame_table;
>> +unsigned long frametable_pdx_end __read_mostly;
>> +
>>   /* Write a MPU protection region */
>>   #define WRITE_PROTECTION_REGION(pr, prbar_el2, prlar_el2) ({    \
>>       const pr_t *_pr = pr;                                       \
>> @@ -513,6 +520,26 @@ void __init setup_staticheap_mappings(void)
>>       }
>>   }
>>
>> +/* Map a frame table to cover physical addresses ps through pe */
>> +void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>> +{
>> +    mfn_t base_mfn;
>> +    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
>> +                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
>> +    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
>> +
>> +    frametable_base_pdx = paddr_to_pdx(ps);
>> +    frametable_size = ROUNDUP(frametable_size, PAGE_SIZE);
>> +    frametable_pdx_end = frametable_base_pdx + nr_pdxs;
>> +
>> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
>> +    frame_table = (struct page_info *)mfn_to_virt(base_mfn);
>> +
>> +    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
>> +    memset(&frame_table[nr_pdxs], -1,
>> +           frametable_size - (nr_pdxs * sizeof(struct page_info)));
>> +}
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> -- 
>> 2.25.1
> - Ayan

