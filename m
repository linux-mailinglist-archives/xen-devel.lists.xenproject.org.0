Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341B1F7BD4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 18:52:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjmuW-0004WA-Jm; Fri, 12 Jun 2020 16:52:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lj+H=7Z=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjmuU-0004W5-Jr
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 16:52:06 +0000
X-Inumbo-ID: 0bb2d45c-accd-11ea-b5f2-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bb2d45c-accd-11ea-b5f2-12813bfff9fa;
 Fri, 12 Jun 2020 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPewpLDBkXyUSU8g+/jsWn8aWCQ+Lv8yHI+l5mVWrjc=;
 b=fL5oEOSUgA1tF+blub+wLIituONe8gtJm0Q05cL8xsMv0YCNVRsHTpBXfITlSVU6X8XevuhTTD4jnRbIiK5C94VwM9qv3GfvlFXozk7tcszZL4n6Fu4s7tldjKBHnfb0NhcefrEDOV4XvNk04xbut31+hrxmwaW5cvQMrlxXk38=
Received: from AM6PR0202CA0061.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::38) by VI1PR0801MB2096.eurprd08.prod.outlook.com
 (2603:10a6:800:8b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Fri, 12 Jun
 2020 16:52:04 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::b4) by AM6PR0202CA0061.outlook.office365.com
 (2603:10a6:20b:3a::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Fri, 12 Jun 2020 16:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Fri, 12 Jun 2020 16:52:03 +0000
Received: ("Tessian outbound 4f5776643448:v59");
 Fri, 12 Jun 2020 16:52:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65e3b85bbf713158
X-CR-MTA-TID: 64aa7808
Received: from d28af9e08478.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 716D0625-D6BF-4518-B8E3-FDD8ABB97328.1; 
 Fri, 12 Jun 2020 16:51:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d28af9e08478.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Jun 2020 16:51:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQ1e1HNesZ9xs6Efw7b+b/+Bgk4EwUrRXQIMzh7VZtBFWvlhXKDTieNyHme4iQxfMn+csJPIQ/nWeqsiU0/qNRm5RrYJgzvN7PEyRBlltWiMueuyDORVfrg/cAY8uKjUPT7INM2MSKsxJSq4abdd5Im9mxpnjsFZ4CvMG+/4z2EteZs0kecHI3exMqi4RUEgKPM+LgY8SXBPwF5PlAB2M82OMcG4ifWqDQXtDNgc4TskBsbjaDlRXT/INj40RLR9XC5eX8byF2wHLk5Sjt70wT8AdITshYHpMmGLw/lMwk4vQxDnKZmIwFZ0fA0Wqz4qx34qc1MfOv140xWabTArrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPewpLDBkXyUSU8g+/jsWn8aWCQ+Lv8yHI+l5mVWrjc=;
 b=UypFposC7dCEfm/d2umWjZoXqCyOzdTSDBdr9vU4V65pFbay/U8JNDCv223oTXRZhY33fnb/UWSeXxTjyCMBEcvNDkP3W4wmt5Ljnti3rh57kz7h/PYhpSpMgsmhrNvM2rvZlXyYiWNklXwHGcMYhdaOw8/+x37QGhAaXrIYH2CCLzJ/iZo6QYhohj2OcQJXxutkbQWvR2vCFkRI75ZXBmjWqBh7oofE0XpIBHL7wugrMkaz0TTPB/EKI2GYsFcoGVgBhxylTS4c8bErk7xhBh3OOZRvwjSYpCJangjZeWYiiw3mG5DJKDDttL1bM9eil08tbRuf1HwQf0gh+yO14A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPewpLDBkXyUSU8g+/jsWn8aWCQ+Lv8yHI+l5mVWrjc=;
 b=fL5oEOSUgA1tF+blub+wLIituONe8gtJm0Q05cL8xsMv0YCNVRsHTpBXfITlSVU6X8XevuhTTD4jnRbIiK5C94VwM9qv3GfvlFXozk7tcszZL4n6Fu4s7tldjKBHnfb0NhcefrEDOV4XvNk04xbut31+hrxmwaW5cvQMrlxXk38=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3018.eurprd08.prod.outlook.com (2603:10a6:5:20::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 16:51:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 16:51:56 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWP+e0l1aGgjLKI0+XFOOVnv/iZKjUz6iAgABkF4A=
Date: Fri, 12 Jun 2020 16:51:56 +0000
Message-ID: <71F7AE7B-BB12-4D3B-8337-3FA6040CA632@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <974bf796-d410-9dd7-9e60-873987cd8434@xen.org>
In-Reply-To: <974bf796-d410-9dd7-9e60-873987cd8434@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b7e4d39-5556-458a-0ffd-08d80ef0ef0d
x-ms-traffictypediagnostic: DB7PR08MB3018:|VI1PR0801MB2096:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB20961DDA48FD8A6C472D090A9D810@VI1PR0801MB2096.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: W5IgFPoQfh03WcTuA6laODJ/0slOEirTmPZELOdU2wW3OyxOEZZwOleN79cFPULtym8WVuzE/UprotDiCAMrv1lFUBZwRBtl3fcizdOS0v6wZ/PWrhjX7Y4Qo7pABrAwKGK1VoKqofpqqi0fRRIotjZv7UKbLH6Mkhw7OlXGFSghzChbFC54llD2eRIxQeFtljgcCN9VtZCivxRMZGO0uRydMjms9tBRTSqfAwBWtpTHS1BgySbKcwYA1TXq+cHxNfOlbkzBGtpqOKXD1u/SIo7LS/5XxQhvck9irqjK9gRlM9zYgRMDTYs5W+JaBvK+iRHaWr8uh7u9926e8OA/xQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(5660300002)(66556008)(66446008)(33656002)(64756008)(66476007)(86362001)(91956017)(76116006)(2906002)(66946007)(6486002)(7416002)(478600001)(6512007)(316002)(8676002)(36756003)(71200400001)(4326008)(186003)(83380400001)(8936002)(54906003)(6506007)(6916009)(53546011)(2616005)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nsV+5X/X4wv0qc6dDplK7F0DwwVkzcQ9Oog0jbFXHScDdtnTXdP8CrLf0Zkspi5Gx4ijigAHYbl2aaU5Zn4Qy4zTtJDRZukFbZnuURBbfBvzldKaTumu178v+YjH3sgvNPo0JPFBIn+QU3Sh1nPyBTCJBe14ji3X0VI0DHYdpJgbNuU5GgIS7Ap3jBfApkVplYwhHVsmN+jIJqBT7EzXHH+F0DKFHneEsKCTu1ebFgkkenM06AQ17aoFEfVt9uBOgedNOiFKqBO+KBTAqPwS27N96Z4sdonH6gkEvgJRM+9uJRQTdAhYH+I9YnAkmgdfbLdHlc/bLsYqAcRP2FEgdqh7tjN2X+fiFZfJN3CC1FqwezWht23hdZw1CXj+rewPDKzC9YOghYs+IyLTdQl+HpVmXvIdSXBGz/5EC02qKBHHwLL71Jogqc8FVgfI9iUSaAnH1IY8UPV+3hzym3SBtvVdj6zHRGK683jV/59VlXVu4IdP2T3I6if/Ycs3HK2B
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3DFB93478A72BA41BCC96EDDA6C52830@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3018
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966005)(81166007)(83380400001)(36756003)(82310400002)(356005)(8676002)(6512007)(107886003)(6862004)(8936002)(6486002)(5660300002)(2616005)(33656002)(336012)(478600001)(4326008)(36906005)(2906002)(54906003)(316002)(70206006)(186003)(86362001)(26005)(70586007)(53546011)(82740400003)(47076004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c4753ced-f649-4b6f-6dc7-08d80ef0ead3
X-Forefront-PRVS: 0432A04947
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6osSh7LsY2UgnvEm/dc7KfNVg/WDKXTC/Vjg3bpXIp5cAXW2jtg8lKSoO7cwGWhy3GNz3oe3Kbg4coB1gg9CMc+hYputE0r/BXWKrRrdauIpLQbqJGUEFq9OPMeL5mB3k6z/Acu5sJp0Q+/jm8BBJ377kjf3vlGdL6i3DHGb/sLlbJA9wqG3+Q3tYNlPiJ+N6tpnl9z6C8aFlcowOX9FNJkDFtWl3wzftwXksnHyPSVlWNHFwDR2DuIzIXWZl0OTxnPCjer39P/JBNp2b+GPtRXxuShdYtL55uTwROjbMuLiEMW7o9rmSC+wltxCA7wkykNVQu+y73x3ceHaDXZhgHDJeBhCh0c7sr7eQFgGEoDQnqOCo0I2pq06+slFnKfLDMQljlN9asnp7O9x8Qv9fg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 16:52:03.7297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7e4d39-5556-458a-0ffd-08d80ef0ef0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2096
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

> On 12 Jun 2020, at 11:53, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 11/06/2020 12:58, Bertrand Marquis wrote:
>> At the moment on Arm, a Linux guest running with KTPI enabled will
>> cause the following error when a context switch happens in user mode:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>=20
> I think you want to add a bit more context explaining the reason on the f=
ailure. I.e. this is because the virtual address used by the runstate is on=
ly accessible when running in kernel space.
>=20
>> This patch is modifying the register runstate area handling on arm to
>> convert the guest address during the hypercall. During runtime context
>> switches the area is mapped to update the guest runstate copy.
>> The patch is also removing the initial copy which was done during the
>> hypercall handling as this is done on the current core when the context
>> is restore to go back to guest execution on arm.
>=20
> This is explaining what the commit does but not why we want to translate =
the virtual address at hypercall time. More importantly, this doesn't expla=
in the restrictions added on the hypercall and why they are fine.
>=20
> Note that they also should be documented in the public header.
>=20
>> As a consequence if the register runstate hypercall is called on one
>> vcpu for an other vcpu, the area will not be updated until the vcpu
>> will be executed (on arm only).
>=20
> The code below suggests the hypercall will just fail if you call it from =
a different vCPU. Is that correct?
>=20
>> On x86, the behaviour is not modified, the address conversion is done
>> during the context switch and the area is updated fully during the
>> hypercall.
>> inline functions in headers could not be used as the architecture
>> domain.h is included before the global domain.h making it impossible
>> to use the struct vcpu inside the architecture header.
>> This should not have any performance impact as the hypercall is only
>> called once per vcpu usually.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/domain.c        | 109 +++++++++++++++++++++++++++++------
>>  xen/arch/x86/domain.c        |  30 +++++++++-
>>  xen/arch/x86/x86_64/domain.c |   4 +-
>>  xen/common/domain.c          |  19 ++----
>>  xen/include/asm-arm/domain.h |   8 +++
>>  xen/include/asm-x86/domain.h |  16 +++++
>>  xen/include/xen/domain.h     |   4 ++
>>  xen/include/xen/sched.h      |  16 +----
>>  8 files changed, 153 insertions(+), 53 deletions(-)
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 31169326b2..739059234f 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -19,6 +19,7 @@
>>  #include <xen/sched.h>
>>  #include <xen/softirq.h>
>>  #include <xen/wait.h>
>> +#include <xen/domain_page.h>
>>    #include <asm/alternative.h>
>>  #include <asm/cpuerrata.h>
>> @@ -275,36 +276,104 @@ static void ctxt_switch_to(struct vcpu *n)
>>      virt_timer_restore(n);
>>  }
>>  -/* Update per-VCPU guest runstate shared memory area (if registered). =
*/
>> -static void update_runstate_area(struct vcpu *v)
>> +void arch_cleanup_runstate_guest(struct vcpu *v)
>=20
> I would prefer if this is name arch_vcpu_cleanup_runstate() as this is pe=
r-vCPU and not per-domain information.
>=20
>>  {
>> -    void __user *guest_handle =3D NULL;
>> -    struct vcpu_runstate_info runstate;
>> +    spin_lock(&v->arch.runstate_guest.lock);
>>  -    if ( guest_handle_is_null(runstate_guest(v)) )
>> -        return;
>> +    /* cleanup previous page if any */
>> +    if ( v->arch.runstate_guest.page )
>> +    {
>> +        put_page_and_type(v->arch.runstate_guest.page);
>=20
> get_page_from_gva() is only grabbing a reference on the page. So you want=
 to use put_page() here.
>=20
> Note that we don't have type reference on Arm, so it equivalent to put_pa=
ge(). But this wouldn't be technically correct :).
>=20
>> +        v->arch.runstate_guest.page =3D NULL;
>> +        v->arch.runstate_guest.offset =3D 0;
>> +    }
>>  -    memcpy(&runstate, &v->runstate, sizeof(runstate));
>> +    spin_unlock(&v->arch.runstate_guest.lock);
>> +}
>>  -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +int arch_setup_runstate_guest(struct vcpu *v,
>> +                            struct vcpu_register_runstate_memory_area a=
rea)
>=20
> The indentation looks off here.
>=20
> Also, same remark for the naming.
>=20
>=20
>> +{
>> +    struct page_info *page;
>> +    unsigned offset;
>> +
>> +    spin_lock(&v->arch.runstate_guest.lock);
>> +
>> +    /* cleanup previous page if any */
>> +    if ( v->arch.runstate_guest.page )
>>      {
>> -        guest_handle =3D &v->runstate_guest.p->state_entry_time + 1;
>> -        guest_handle--;
>> -        runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - =
1, 1);
>> -        smp_wmb();
>> +        put_page_and_type(v->arch.runstate_guest.page);
>=20
> Same remark here. Although I would prefer if we try to have a common help=
er to cleaning up the runstate. Maybe cleanup_runstate_vcpu_locked()?
>=20
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
>=20
> In the current implementation, 0 was used to unregister the runstate area=
. I think we want to keep that feature and not throw an error.
>=20
>> +    if ( !page )
>> +    {
>> +        spin_unlock(&v->arch.runstate_guest.lock);
>> +        gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");
>> +        return -EINVAL;
>>      }
>>  -    __copy_to_guest(runstate_guest(v), &runstate, 1);
>> +    v->arch.runstate_guest.page =3D page;
>> +    v->arch.runstate_guest.offset =3D offset;
>> +
>=20
> In the current implementation, the runstate area was update with the late=
st information during the hypercall. This doesn't seem to happen anymore. I=
s there any specific reason?
>=20
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
>>  -    if ( guest_handle )
>> +    if ( v->arch.runstate_guest.page )
>>      {
>> -        runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>> +        p =3D __map_domain_page(v->arch.runstate_guest.page);
>> +        guest_runstate =3D p + v->arch.runstate_guest.offset;
>> +
>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +        {
>> +            v->runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>> +            guest_runstate->state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>> +            smp_wmb();
>> +        }
>> +
>> +        memcpy(guest_runstate, &v->runstate, sizeof(v->runstate));
>>          smp_wmb();
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - =
1, 1);
>> +
>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +        {
>> +            v->runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>> +            guest_runstate->state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>> +            smp_wmb();
>=20
> Why do you need this barrier?
>=20
>=20
> [...]
>=20
>> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
>> index 4e2f582006..3a7f53e13d 100644
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -11,6 +11,7 @@
>>  #include <asm/vgic.h>
>>  #include <asm/vpl011.h>
>>  #include <public/hvm/params.h>
>> +#include <public/vcpu.h>
>=20
> Why do you need to add this new include?

Sorry I forgot to answer to this one.
This is needed to have the definition of vcpu_register_runstate_memory_area=
.

Bertrand


