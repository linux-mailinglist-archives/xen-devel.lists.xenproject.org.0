Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388291F750A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 10:09:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjejQ-0006m9-J0; Fri, 12 Jun 2020 08:08:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lj+H=7Z=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjejO-0006lC-7k
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 08:08:06 +0000
X-Inumbo-ID: d73eec72-ac83-11ea-b5ab-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d73eec72-ac83-11ea-b5ab-12813bfff9fa;
 Fri, 12 Jun 2020 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI0D4WK3ZZoPQKZo56XN11J757dcoA2QPzgTlbGiM4I=;
 b=6F3s6Zz7HjHJ6IfIFnGl0qV3YTHm8Ypu6IGcF1VACdRlqVZUOPdvh+0bNBSMrSCQQc21s16UWk32AOruMm3Gk//oagIjChsCZ/Eke6Brc4hh6dpSjSX0f90wQw9fEQ5EM8OSiwOltr/DLHcAHpkCY//UWxgQtfUqW4YlPrW3Nl8=
Received: from AM6P194CA0066.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::43)
 by VI1PR08MB3503.eurprd08.prod.outlook.com (2603:10a6:803:7a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 08:08:01 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::53) by AM6P194CA0066.outlook.office365.com
 (2603:10a6:209:84::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20 via Frontend
 Transport; Fri, 12 Jun 2020 08:08:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 08:08:01 +0000
Received: ("Tessian outbound 3e82c366635e:v59");
 Fri, 12 Jun 2020 08:08:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69a1fdb861356eb9
X-CR-MTA-TID: 64aa7808
Received: from dbca1b61fe23.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 941DC016-8AE6-4ED5-AE95-3DCFD275119C.1; 
 Fri, 12 Jun 2020 08:07:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dbca1b61fe23.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Jun 2020 08:07:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHq31x/AHsnB9MQl3pU/APQGBtQjltM2zlgIR9rDUGgcWyTG/GMxjOR/82R7eVOASxDTujhjFOpux9+94vt0+MAFwJt3Kg2GX6zkrL02jU9ALML2vxgV5FxHxAlVhjBO2MfjRHivvvJc7SFppRvbmPrFnK1/pMAaDzDeJ8ffzgLgrzrM8pM6gMr6zVOxjYgQ8ni+ALwmhYx8Efu5Z6NxfcHnGcKfiWduvHLi1DALKSQVXfQ6BiuVMOGOQmE0vhJ2OQSKNYNTWAZKdLuX/OR5LjahhFRUIKedzBmkbaJtxK1+aUqIQZq/rUI3k8uW7z+bNwLbMD/t5p8yhqAm1NNPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI0D4WK3ZZoPQKZo56XN11J757dcoA2QPzgTlbGiM4I=;
 b=EtIx+pEcfvuz3moyfe4vIfpMMvj/OKlPSqZX4t81vYuuZkBzhJkHVZXlHNa8usJmxKdzuNcL9MSU5VRFzE/x/cgEsIQCIdZem9QCDUk+1WsqMR1NFYgQ1i6DWUMeo9TArJ2KXzxrNeQS910oTlQFwppfLp0Rp6u3NC3db+YqsuO8C+10Uj8brRfGinNCUCBlY8yIeotF8/9beHOGzCT1qnqhfTFkGiyGA6n28ZJzPxMxxi7inRPPRvz555PxrGaSOVa8ysyDM5AdObt7WUQ7gghlOXIPFgbCVrVuxlWObrlJy5QncrPwHdJOVNDIeBq6GQaqIzxxzxzSt1iCvQrQSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI0D4WK3ZZoPQKZo56XN11J757dcoA2QPzgTlbGiM4I=;
 b=6F3s6Zz7HjHJ6IfIFnGl0qV3YTHm8Ypu6IGcF1VACdRlqVZUOPdvh+0bNBSMrSCQQc21s16UWk32AOruMm3Gk//oagIjChsCZ/Eke6Brc4hh6dpSjSX0f90wQw9fEQ5EM8OSiwOltr/DLHcAHpkCY//UWxgQtfUqW4YlPrW3Nl8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3147.eurprd08.prod.outlook.com (2603:10a6:5:1d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 08:07:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 08:07:54 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWP+e0l1aGgjLKI0+XFOOVnv/iZKjTuR6AgADoN4A=
Date: Fri, 12 Jun 2020 08:07:54 +0000
Message-ID: <50E28FC8-23BD-4821-8C90-99D99F5B9C30@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e45e2bd-62e0-4d2b-56ae-08d80ea7b9b7
x-ms-traffictypediagnostic: DB7PR08MB3147:|VI1PR08MB3503:
X-Microsoft-Antispam-PRVS: <VI1PR08MB35035E7E0D9A56B1882E732F9D810@VI1PR08MB3503.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: h8JqfCfwOksZU3nfJxjcbA11PToyK5Q6KKYUzEzz9szP/6W4gnkRTLHqnNSDrbZWZ6LJgHA/vpYHdaqJwMFSmDaEoTheKaudv5A5yYgPSE83CABDW8/GLA5eCIXzWQKYts3jQTmzkxM7/uUjBlPr2obGjteqLU8X70E7UXnvhx44is23xIgX/hlxlyKl2wzanLg7fXjb85rrEEjbMmj8CTj31XjoznpsVCruQKyiHkiaKHqLlxf6szph+MYcYBRR55jJDH/DfbhsLvOtrI/ofx3V+BPoh/CL+U4mDqTkEw/GElBigepcGzDb0aITGme526EjUihacWZ3qfzzg2Ja8Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(7416002)(86362001)(8936002)(83380400001)(30864003)(33656002)(54906003)(316002)(4326008)(6486002)(6512007)(6916009)(64756008)(26005)(478600001)(66556008)(76116006)(6506007)(8676002)(186003)(53546011)(5660300002)(66476007)(2616005)(66446008)(91956017)(66946007)(36756003)(2906002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 9olJMDahjEQnJ88KLdTMW9kXHH6wYkDHJX21b5pFs5baensdjxS5mtcKWzbTWJTKMdc8zXSI3oS8OIph8CWgRuPIQxpPMH6YNMIn5i3Fa9e6oBtpD95RHyS7D34k+SPwumpVqtoD56stkZQo3DfOWsxFN/HismuVKJQeuqdl+dKpGPsJYXZp2JM8f6LRLZPvnqAWGzUfQmwW8Sio8oLZPkW8/638F+Z2BhXANM+v0bWAyplg2H+pBJGJ/6EuXt+NijZNCiRpD5sdjLnf9NFAGUsoQBu3yn/Hm/QaZ4b0GaJhikvkfaZkfQJ7YaiRZXqb/ouEeBWeo+CAxmaZtIKqnDxKkWNs/GY1bpTT2/lG0Byzuqf/iSeTLDdJVp5eIC/r7gexcDITCDlpoCp/0KSb3pi4Z+kkkQxWQ7bFJT+D92Xs9ED2JSUskIG8CCcDa+KOqywnx47Yn265dhl8ieYZp14cPpOwWHIduSalibfRdo0GPipshGl500C27C3Mrvuo
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <66DDD5A14A7D654DBB32604D7FE99C19@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3147
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(356005)(83380400001)(478600001)(30864003)(33656002)(47076004)(26005)(86362001)(82310400002)(2616005)(336012)(70586007)(36756003)(70206006)(186003)(53546011)(6506007)(81166007)(82740400003)(5660300002)(6512007)(8676002)(316002)(8936002)(4326008)(36906005)(6486002)(54906003)(107886003)(2906002)(6862004);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 08da0780-1984-4cbf-2349-08d80ea7b5c0
X-Forefront-PRVS: 0432A04947
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lcmPGlNMESZleIJs6FOpav4gmF5n48iAIum2uouxzKdoUTFigdZBKNQ+7Y7YA4hMk7NvL8TEcXjWYYvpIP/maGR8A5arvBlvlT4dNDKolrMj6DSzX9fKHQf3MsJijhdyqhZHdtXyVMcMeymRvQeIzqQ51jNzBwc9hQkzvsAAV61626koYpRzLr4qAFePkKaCtrGpB58yA45qwaYD8AAod4cdOrQfknvLTgiFWwm4UaD0o5MhmrAGnZBrn9/jkgTc2c/zrTB46lJH9RCt0z3WIn40MqS1ze2kyeMi5C8KPJOd6DhNWEUcx7ecozbIKNuA+HL6hbPzPDN2vuiOicJRMVY715c9GTgfmJn4yiJOz8L/6G8r83gmlP6lJX/yDk4Sv3wsXp1QZqMWqHNufFQ/9A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 08:08:01.0333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e45e2bd-62e0-4d2b-56ae-08d80ea7b9b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3503
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 11 Jun 2020, at 19:16, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 11 Jun 2020, Bertrand Marquis wrote:
>> At the moment on Arm, a Linux guest running with KTPI enabled will
>> cause the following error when a context switch happens in user mode:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>=20
>> This patch is modifying the register runstate area handling on arm to
>> convert the guest address during the hypercall. During runtime context
>> switches the area is mapped to update the guest runstate copy.
>> The patch is also removing the initial copy which was done during the
>> hypercall handling as this is done on the current core when the context
>> is restore to go back to guest execution on arm.
>>=20
>> As a consequence if the register runstate hypercall is called on one
>> vcpu for an other vcpu, the area will not be updated until the vcpu
>> will be executed (on arm only).
>>=20
>> On x86, the behaviour is not modified, the address conversion is done
>> during the context switch and the area is updated fully during the
>> hypercall.
>> inline functions in headers could not be used as the architecture
>> domain.h is included before the global domain.h making it impossible
>> to use the struct vcpu inside the architecture header.
>> This should not have any performance impact as the hypercall is only
>> called once per vcpu usually.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/domain.c        | 109 +++++++++++++++++++++++++++++------
>> xen/arch/x86/domain.c        |  30 +++++++++-
>> xen/arch/x86/x86_64/domain.c |   4 +-
>> xen/common/domain.c          |  19 ++----
>> xen/include/asm-arm/domain.h |   8 +++
>> xen/include/asm-x86/domain.h |  16 +++++
>> xen/include/xen/domain.h     |   4 ++
>> xen/include/xen/sched.h      |  16 +----
>> 8 files changed, 153 insertions(+), 53 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 31169326b2..739059234f 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -19,6 +19,7 @@
>> #include <xen/sched.h>
>> #include <xen/softirq.h>
>> #include <xen/wait.h>
>> +#include <xen/domain_page.h>
>>=20
>> #include <asm/alternative.h>
>> #include <asm/cpuerrata.h>
>> @@ -275,36 +276,104 @@ static void ctxt_switch_to(struct vcpu *n)
>>     virt_timer_restore(n);
>> }
>>=20
>> -/* Update per-VCPU guest runstate shared memory area (if registered). *=
/
>> -static void update_runstate_area(struct vcpu *v)
>> +void arch_cleanup_runstate_guest(struct vcpu *v)
>> {
>> -    void __user *guest_handle =3D NULL;
>> -    struct vcpu_runstate_info runstate;
>> +    spin_lock(&v->arch.runstate_guest.lock);
>>=20
>> -    if ( guest_handle_is_null(runstate_guest(v)) )
>> -        return;
>> +    /* cleanup previous page if any */
>> +    if ( v->arch.runstate_guest.page )
>> +    {
>> +        put_page_and_type(v->arch.runstate_guest.page);
>> +        v->arch.runstate_guest.page =3D NULL;
>> +        v->arch.runstate_guest.offset =3D 0;
>> +    }
>>=20
>> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
>> +    spin_unlock(&v->arch.runstate_guest.lock);
>> +}
>>=20
>> -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +int arch_setup_runstate_guest(struct vcpu *v,
>> +                            struct vcpu_register_runstate_memory_area a=
rea)
>> +{
>> +    struct page_info *page;
>> +    unsigned offset;
>> +
>> +    spin_lock(&v->arch.runstate_guest.lock);
>> +
>> +    /* cleanup previous page if any */
>> +    if ( v->arch.runstate_guest.page )
>>     {
>> -        guest_handle =3D &v->runstate_guest.p->state_entry_time + 1;
>> -        guest_handle--;
>> -        runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - =
1, 1);
>> -        smp_wmb();
>> +        put_page_and_type(v->arch.runstate_guest.page);
>> +        v->arch.runstate_guest.page =3D NULL;
>> +        v->arch.runstate_guest.offset =3D 0;
>> +    }
>> +
>> +    offset =3D ((vaddr_t)area.addr.v) & ~PAGE_MASK;
>> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
>> +    {
>> +        spin_unlock(&v->arch.runstate_guest.lock);
>> +        gprintk(XENLOG_DEBUG, "Runstate is crossing pages\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* provided address must be aligned to a 64bit */
>> +    if ( offset % alignof(struct vcpu_runstate_info) )
>> +    {
>> +        spin_unlock(&v->arch.runstate_guest.lock);
>> +        gprintk(XENLOG_DEBUG, "Runstate pointer is not aligned\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    page =3D get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
>> +    if ( !page )
>> +    {
>> +        spin_unlock(&v->arch.runstate_guest.lock);
>> +        gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");
>=20
> I would make all these XENLOG_WARNING or XENLOG_ERR, they are errors
> after all. This last one I'd say "Could not map runstate point" and also
> print the address.

Ok I will fix it to Warning and change the message like this.

>=20
>=20
>> +        return -EINVAL;
>>     }
>>=20
>> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
>> +    v->arch.runstate_guest.page =3D page;
>> +    v->arch.runstate_guest.offset =3D offset;
>> +
>> +    spin_unlock(&v->arch.runstate_guest.lock);
>> +
>> +    return 0;
>> +}
>> +
>> +
>> +/* Update per-VCPU guest runstate shared memory area (if registered). *=
/
>> +static void update_runstate_area(struct vcpu *v)
>> +{
>> +    struct vcpu_runstate_info *guest_runstate;
>> +    void *p;
>> +
>> +    spin_lock(&v->arch.runstate_guest.lock);
>>=20
>> -    if ( guest_handle )
>> +    if ( v->arch.runstate_guest.page )
>>     {
>> -        runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>> +        p =3D __map_domain_page(v->arch.runstate_guest.page);
>> +        guest_runstate =3D p + v->arch.runstate_guest.offset;
>> +
>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +        {
>> +            v->runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>> +            guest_runstate->state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>=20
> I think that this write to guest_runstate should use write_atomic or
> another atomic write operation.

I will answer at the end of the discussion on the subject.

>=20
>=20
>> +            smp_wmb();
>> +        }
>> +
>> +        memcpy(guest_runstate, &v->runstate, sizeof(v->runstate));
>>         smp_wmb();
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - =
1, 1);
>> +
>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +        {
>> +            v->runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>> +            guest_runstate->state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>=20
> same here
>=20
>=20
>> +            smp_wmb();
>> +        }
>> +
>> +        unmap_domain_page(p);
>>     }
>> +
>> +    spin_unlock(&v->arch.runstate_guest.lock);
>> }
>>=20
>> static void schedule_tail(struct vcpu *prev)
>> @@ -560,6 +629,8 @@ int arch_vcpu_create(struct vcpu *v)
>>     v->arch.saved_context.sp =3D (register_t)v->arch.cpu_info;
>>     v->arch.saved_context.pc =3D (register_t)continue_new_vcpu;
>>=20
>> +    spin_lock_init(&v->arch.runstate_guest.lock);
>> +
>>     /* Idle VCPUs don't need the rest of this setup */
>>     if ( is_idle_vcpu(v) )
>>         return rc;
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>> index fee6c3931a..32bbed87d5 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1642,6 +1642,30 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
>>         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>> }
>>=20
>> +int arch_setup_runstate_guest(struct vcpu *v,
>> +                             struct vcpu_register_runstate_memory_area =
area)
>> +{
>> +    struct vcpu_runstate_info runstate;
>> +
>> +    runstate_guest(v) =3D area.addr.h;
>> +
>> +    if ( v =3D=3D current )
>> +    {
>> +        __copy_to_guest(runstate_guest(v), &v->runstate, 1);
>> +    }
>> +    else
>> +    {
>> +        vcpu_runstate_get(v, &runstate);
>> +        __copy_to_guest(runstate_guest(v), &runstate, 1);
>> +    }
>> +    return 0;
>> +}
>> +
>> +void arch_cleanup_runstate_guest(struct vcpu *v)
>> +{
>> +    set_xen_guest_handle(runstate_guest(v), NULL);
>> +}
>> +
>> /* Update per-VCPU guest runstate shared memory area (if registered). */
>> bool update_runstate_area(struct vcpu *v)
>> {
>> @@ -1660,8 +1684,8 @@ bool update_runstate_area(struct vcpu *v)
>>     if ( VM_ASSIST(v->domain, runstate_update_flag) )
>>     {
>>         guest_handle =3D has_32bit_shinfo(v->domain)
>> -            ? &v->runstate_guest.compat.p->state_entry_time + 1
>> -            : &v->runstate_guest.native.p->state_entry_time + 1;
>> +            ? &v->arch.runstate_guest.compat.p->state_entry_time + 1
>> +            : &v->arch.runstate_guest.native.p->state_entry_time + 1;
>>         guest_handle--;
>>         runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>>         __raw_copy_to_guest(guest_handle,
>> @@ -1674,7 +1698,7 @@ bool update_runstate_area(struct vcpu *v)
>>         struct compat_vcpu_runstate_info info;
>>=20
>>         XLAT_vcpu_runstate_info(&info, &runstate);
>> -        __copy_to_guest(v->runstate_guest.compat, &info, 1);
>> +        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
>>         rc =3D true;
>>     }
>>     else
>> diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
>> index c46dccc25a..b879e8dd2c 100644
>> --- a/xen/arch/x86/x86_64/domain.c
>> +++ b/xen/arch/x86/x86_64/domain.c
>> @@ -36,7 +36,7 @@ arch_compat_vcpu_op(
>>             break;
>>=20
>>         rc =3D 0;
>> -        guest_from_compat_handle(v->runstate_guest.compat, area.addr.h)=
;
>> +        guest_from_compat_handle(v->arch.runstate_guest.compat, area.ad=
dr.h);
>>=20
>>         if ( v =3D=3D current )
>>         {
>> @@ -49,7 +49,7 @@ arch_compat_vcpu_op(
>>             vcpu_runstate_get(v, &runstate);
>>             XLAT_vcpu_runstate_info(&info, &runstate);
>>         }
>> -        __copy_to_guest(v->runstate_guest.compat, &info, 1);
>> +        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
>>=20
>>         break;
>>     }
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 7cc9526139..0ca6bf4dbc 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -727,7 +727,10 @@ int domain_kill(struct domain *d)
>>         if ( cpupool_move_domain(d, cpupool0) )
>>             return -ERESTART;
>>         for_each_vcpu ( d, v )
>> +        {
>> +            arch_cleanup_runstate_guest(v);
>>             unmap_vcpu_info(v);
>> +        }
>>         d->is_dying =3D DOMDYING_dead;
>>         /* Mem event cleanup has to go here because the rings=20
>>          * have to be put before we call put_domain. */
>> @@ -1167,7 +1170,7 @@ int domain_soft_reset(struct domain *d)
>>=20
>>     for_each_vcpu ( d, v )
>>     {
>> -        set_xen_guest_handle(runstate_guest(v), NULL);
>> +        arch_cleanup_runstate_guest(v);
>>         unmap_vcpu_info(v);
>>     }
>>=20
>> @@ -1484,7 +1487,6 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_=
GUEST_HANDLE_PARAM(void) arg)
>>     case VCPUOP_register_runstate_memory_area:
>>     {
>>         struct vcpu_register_runstate_memory_area area;
>> -        struct vcpu_runstate_info runstate;
>>=20
>>         rc =3D -EFAULT;
>>         if ( copy_from_guest(&area, arg, 1) )
>> @@ -1493,18 +1495,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN=
_GUEST_HANDLE_PARAM(void) arg)
>>         if ( !guest_handle_okay(area.addr.h, 1) )
>>             break;
>>=20
>> -        rc =3D 0;
>> -        runstate_guest(v) =3D area.addr.h;
>> -
>> -        if ( v =3D=3D current )
>> -        {
>> -            __copy_to_guest(runstate_guest(v), &v->runstate, 1);
>> -        }
>> -        else
>> -        {
>> -            vcpu_runstate_get(v, &runstate);
>> -            __copy_to_guest(runstate_guest(v), &runstate, 1);
>> -        }
>> +        rc =3D arch_setup_runstate_guest(v, area);
>>=20
>>         break;
>>     }
>> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
>> index 4e2f582006..3a7f53e13d 100644
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -11,6 +11,7 @@
>> #include <asm/vgic.h>
>> #include <asm/vpl011.h>
>> #include <public/hvm/params.h>
>> +#include <public/vcpu.h>
>> #include <xen/serial.h>
>> #include <xen/rbtree.h>
>>=20
>> @@ -206,6 +207,13 @@ struct arch_vcpu
>>      */
>>     bool need_flush_to_ram;
>>=20
>> +    /* runstate guest info */
>> +    struct {
>> +        struct page_info *page;  /* guest page */
>> +        unsigned         offset; /* offset in page */
>> +        spinlock_t       lock;   /* lock to access page */
>> +    } runstate_guest;
>> +
>> }  __cacheline_aligned;
>>=20
>> void vcpu_show_execution_state(struct vcpu *);
>> diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
>> index e8cee3d5e5..f917b48cb8 100644
>> --- a/xen/include/asm-x86/domain.h
>> +++ b/xen/include/asm-x86/domain.h
>> @@ -11,6 +11,11 @@
>> #include <asm/x86_emulate.h>
>> #include <public/vcpu.h>
>> #include <public/hvm/hvm_info_table.h>
>> +#ifdef CONFIG_COMPAT
>> +#include <compat/vcpu.h>
>> +DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
>> +#endif
>> +
>>=20
>> #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
>>=20
>> @@ -626,6 +631,17 @@ struct arch_vcpu
>>     struct {
>>         bool next_interrupt_enabled;
>>     } monitor;
>> +
>> +#ifndef CONFIG_COMPAT
>> +# define runstate_guest(v) ((v)->arch.runstate_guest)
>> +    XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest add=
ress */
>> +#else
>> +# define runstate_guest(v) ((v)->arch.runstate_guest.native)
>> +    union {
>> +        XEN_GUEST_HANDLE(vcpu_runstate_info_t) native;
>> +        XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
>> +    } runstate_guest;
>> +#endif
>> };
>>=20
>> struct guest_memory_policy
>> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
>> index 7e51d361de..d5d73ce997 100644
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -63,6 +63,10 @@ void arch_vcpu_destroy(struct vcpu *v);
>> int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>> void unmap_vcpu_info(struct vcpu *v);
>>=20
>> +int arch_setup_runstate_guest(struct vcpu *v,
>> +                            struct vcpu_register_runstate_memory_area a=
rea);
>=20
> NIT: code style, the indentation is off

Ok

>=20
>=20
>> +void arch_cleanup_runstate_guest(struct vcpu *v);
>> +
>> int arch_domain_create(struct domain *d,
>>                        struct xen_domctl_createdomain *config);
>>=20
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index ac53519d7f..fac030fb83 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -29,11 +29,6 @@
>> #include <public/vcpu.h>
>> #include <public/event_channel.h>
>>=20
>> -#ifdef CONFIG_COMPAT
>> -#include <compat/vcpu.h>
>> -DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
>> -#endif
>> -
>> /*
>>  * Stats
>>  *
>> @@ -166,16 +161,7 @@ struct vcpu
>>     struct sched_unit *sched_unit;
>>=20
>>     struct vcpu_runstate_info runstate;
>> -#ifndef CONFIG_COMPAT
>> -# define runstate_guest(v) ((v)->runstate_guest)
>> -    XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest add=
ress */
>> -#else
>> -# define runstate_guest(v) ((v)->runstate_guest.native)
>> -    union {
>> -        XEN_GUEST_HANDLE(vcpu_runstate_info_t) native;
>> -        XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
>> -    } runstate_guest; /* guest address */
>> -#endif
>> +
>>     unsigned int     new_state;
>>=20
>>     /* Has the FPU been initialised? */
>> --=20
>> 2.17.1


