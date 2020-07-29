Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A665B2319C4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 08:49:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0fsK-00078u-O9; Wed, 29 Jul 2020 06:47:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kSGO=BI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k0fsJ-00078p-Pf
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 06:47:39 +0000
X-Inumbo-ID: 64090fe0-d167-11ea-a982-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.58]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64090fe0-d167-11ea-a982-12813bfff9fa;
 Wed, 29 Jul 2020 06:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kA/oPnFXLs8cMzNjrSsVvWanCdQPpok16aLCIZbi+8=;
 b=xVQxwiMqVudEriXiv9Ki8QLz7gciarvTjJmhclPqITgsg9RTA9CQaQZnulrBgSBx1OLjFZLtiURf+l0ws7aLSh6cvdvf5OUlVbuFJXrCsDZMfu08Ix0heHLqvWbE/cQymUl/U73TLu6pvavjwgYCp4p8iVHTmptwD1+BDn8DB2A=
Received: from DB7PR05CA0072.eurprd05.prod.outlook.com (2603:10a6:10:2e::49)
 by AM4PR08MB2932.eurprd08.prod.outlook.com (2603:10a6:205:e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Wed, 29 Jul
 2020 06:47:35 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::9) by DB7PR05CA0072.outlook.office365.com
 (2603:10a6:10:2e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Wed, 29 Jul 2020 06:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 29 Jul 2020 06:47:35 +0000
Received: ("Tessian outbound 7de93d801f24:v62");
 Wed, 29 Jul 2020 06:47:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b9d694e94dda080
X-CR-MTA-TID: 64aa7808
Received: from c041395dfa92.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F86F3AC-E8D1-4615-911A-E6C82B2BB5B2.1; 
 Wed, 29 Jul 2020 06:47:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c041395dfa92.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jul 2020 06:47:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4WtfENfwqtK+uLDu+LvgJ/eZuv0UJoIxTdHM1ke8SkbkBqETeS6L/oXZcgKW9rdbq2IUZKjeYj+7kjzPFQ0YdcKZ6vdoyb00jaKtpeGDuYU528Vs8rJoAVBLrwWDXu/BK3vgW5GHTKPOUFzJgY0sMCzwo9pA/NDYwYs7DAmjUIX8fyyhHdg+dJkxQ6fDeHEHn3sZUJp6mZfqGkRayUCTMGSWgboHnLx5AfGQemHiRL7m27dVfPUB1kU9515JLRk6QKOp9mp0QpCALFEc0GTdeZ1Ic6XqOGrYeWyBJl2tx7LlfLmgsZEET1UlnEkwr+3hlASlt3bD5zK6fN4B1SH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kA/oPnFXLs8cMzNjrSsVvWanCdQPpok16aLCIZbi+8=;
 b=abCh4e/DhWnqBCGJFVi+hMRpYp9sKlQWnfYnA5/83Alvc2I38HNbsbyJXRXIEICNUkvQuwONTKDah2b5BbemtEwkLt4xi5cYtU4Q0+fu/nbXqf0SEB66DeTTNB3a1PdQNyCcEXhuB+IqseVMz8CFnp1nY5lIFAb4GrGNKcH6A1KMp8u09G5oMrPjvVAIzB1vbE+SVThxlFi62Vv8a8WhXjj0jPcrkWiouul2CpzoNlt1O9PMw2elf5jGQpMei7UL7rGQcB3p4NNVjcLFtl/IJXZ7X1LH/jAZqXSfZvalC4SX9TndTmnvLnvBRJbOPUL2xhdgaUwtNhlXvuC/G0F1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kA/oPnFXLs8cMzNjrSsVvWanCdQPpok16aLCIZbi+8=;
 b=xVQxwiMqVudEriXiv9Ki8QLz7gciarvTjJmhclPqITgsg9RTA9CQaQZnulrBgSBx1OLjFZLtiURf+l0ws7aLSh6cvdvf5OUlVbuFJXrCsDZMfu08Ix0heHLqvWbE/cQymUl/U73TLu6pvavjwgYCp4p8iVHTmptwD1+BDn8DB2A=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4251.eurprd08.prod.outlook.com (2603:10a6:10:d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 06:47:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3216.033; Wed, 29 Jul 2020
 06:47:28 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v2] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZPcpcJdIAbXhcEqLxJ7JubPXUKkdWeGAgADEb4A=
Date: Wed, 29 Jul 2020 06:47:28 +0000
Message-ID: <AAD684DA-CDD9-4251-A296-5612F1B53013@arm.com>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2007281153110.646@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007281153110.646@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:cb10:b9:6f00:456:e93c:a708:a06e]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9f2ec3e6-7b9b-4257-e43a-08d8338b46f0
x-ms-traffictypediagnostic: DBBPR08MB4251:|AM4PR08MB2932:
X-Microsoft-Antispam-PRVS: <AM4PR08MB2932FE16F0D142C68754E57A9D700@AM4PR08MB2932.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MYwHLzXmLrsa0427IZRSslURvsAGUQs2vpqxe9gsnXYfSStsSuugvZJoi/kcdp70gaebDVLSOxmoFh27JONca6ioaQ6O8oQWDSskqjAUODoWYPMcS8RVMC+eG6ia6kf2ma7jM1+stjTO8B63aBPyl/7sTkpyTlnx0Jm+97b/TYt34x8Zs7LKdTLsJh0aY+uAo1I1ZaJ66+8QS1awvrlRZCLMkaOVRNTkwvo2VGCOJAVR+eL+1ECUvA+ZF8gG7drRPSP+5moohm5yj+0tPP9L5GyuYaKfWeB/oqbIEjEnOJufJT83h6F7Xs2Hdajg7ba7bHyk0j0FjWiK3TbR2y+fB0tEPMOR+ZRIDzGAFOgcdViK93u2YN1YTkqTMyvMxQwe3r0xG/pDWjV61a5U4Y5BAXW8q4L5COTWs8o25smsyobGXZ/moxBB0I/KLjl5bMXj6Noa+l9rLvUppgEkCpSURQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(6506007)(4326008)(6486002)(54906003)(53546011)(66476007)(33656002)(8676002)(2906002)(66556008)(66446008)(66946007)(186003)(64756008)(6512007)(36756003)(91956017)(5660300002)(76116006)(2616005)(316002)(86362001)(8936002)(83380400001)(966005)(478600001)(6916009)(7416002)(71200400001)(6606295002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: SIjZNUEiNddQirtL54jo4TqOMiC0GYznRRBS56IPB9LnYptTWtWlYC0FQxuzvSs0tSaZlpxhCKVrkAmeNpzWujwSfe65pbu0FtJzty31mkxxa1TdAZd7pA1W1nuz5HsZZv8lC3RLAJ6cH8MXA8sZDUZrP1MLZVnFrE1IHYSiyRaoyUJUY7oU4Y0yGpQXg+sEF0aIHjXGbENI0GmUHy3jVxikFEmyeLoecqYcT2ehQciymhgyXvfal9825oD0MVk2d4rMACOzpxuuiDK+gf/l7rgkD6Eucs7CXKeCTAuWtuF3kunqVRT4dEev+cf/FyXhIHuJuwUtn3Ui5lgsiJeNOj+d39lkVk130cXbcotRAr2BQrcwnPXV7E6WIxLAaOSLZL/O+jxFLAP8EIcuUPZwBdiXIYpEFnvsb1TZG4M6TD1cWMo8Z+d6zCRI4ZPAKVmdjT51o8je7NdxpM1g+HD9i6BQY267tu5jF7n8hK5gHD5Q/dMX7zJhuMWr5EFnU3zJ88C+JRLjqypyW6Sl1N9Vq23h/TJhM7YyrAUhhWFR0BA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E14399C20AE5954B82A4FEBBFD0DA417@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4251
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 66f3df0d-6e1d-40a4-0fb3-08d8338b42e6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p4nKnrVaTft+Nr37KK4lLGqhwGXIRfVC1wDqd1EXH4+lZb7spEgNWHsGLWSVlF5F3e7c38zpv01A/lw+t0nL21+Sq9ksrqu0Wr4bJ9X0gU2TpaR4DXo0IlmsxnfgbZW0s4bPKf0++hvIFDzSqEQB6I1VVlV7fHtbRNTBglpCzisstHWxYn7p0CBqaAaptPKXvTPtzNjM2vk5CkdLIYPldmgt8rFb/K5MRc/vI5Je/Ffoqez5s7wA71QgJABdisRNCvqs4l9TPdwiHaDOZN51lyxLfR0QvNNSdxFzumNGSddNO+k1qDU4WUNe6xR/dnjPeCphtouJfQDVAwb7cyjplO2OM11ObwIiLhNa8wGdM2hzADgpJrhMEei94c8BXTIkjEnMkbjRL1lDydAii+jpWYLQVeqsoJJunOM3hEl2iNpc7BTkLGml7EddKOPEw9buEEgXX6jbwRjtWw2OxxN5Ja6AVx5dIMwIw9wsSCb11CxdYFFNLUr3RyDCTYAL9Bmv
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(6862004)(8676002)(36756003)(6512007)(2906002)(966005)(316002)(70586007)(70206006)(82310400002)(107886003)(478600001)(356005)(53546011)(86362001)(8936002)(186003)(33656002)(54906003)(2616005)(83380400001)(82740400003)(47076004)(81166007)(26005)(5660300002)(6486002)(4326008)(6506007)(336012)(6606295002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 06:47:35.6508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2ec3e6-7b9b-4257-e43a-08d8338b46f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2932
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
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 28 Jul 2020, at 21:04, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Tue, 28 Jul 2020, Bertrand Marquis wrote:
>> At the moment on Arm, a Linux guest running with KTPI enabled will
>> cause the following error when a context switch happens in user mode:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>=20
>> The error is caused by the virtual address for the runstate area
>> registered by the guest only being accessible when the guest is running
>> in kernel space when KPTI is enabled.
>>=20
>> To solve this issue, this patch is doing the translation from virtual
>> address to physical address during the hypercall and mapping the
>> required pages using vmap. This is removing the conversion from virtual
>> to physical address during the context switch which is solving the
>> problem with KPTI.
>>=20
>> This is done only on arm architecture, the behaviour on x86 is not
>> modified by this patch and the address conversion is done as before
>> during each context switch.
>>=20
>> This is introducing several limitations in comparison to the previous
>> behaviour (on arm only):
>> - if the guest is remapping the area at a different physical address Xen
>> will continue to update the area at the previous physical address. As
>> the area is in kernel space and usually defined as a global variable thi=
s
>> is something which is believed not to happen. If this is required by a
>> guest, it will have to call the hypercall with the new area (even if it
>> is at the same virtual address).
>> - the area needs to be mapped during the hypercall. For the same reasons
>> as for the previous case, even if the area is registered for a different
>> vcpu. It is believed that registering an area using a virtual address
>> unmapped is not something done.
>>=20
>> inline functions in headers could not be used as the architecture
>> domain.h is included before the global domain.h making it impossible
>> to use the struct vcpu inside the architecture header.
>> This should not have any performance impact as the hypercall is only
>> called once per vcpu usually.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  Changes in v2
>>    - use vmap to map the pages during the hypercall.
>>    - reintroduce initial copy during hypercall.
>>=20
>> ---
>> xen/arch/arm/domain.c        | 160 +++++++++++++++++++++++++++++++----
>> xen/arch/x86/domain.c        |  30 ++++++-
>> xen/arch/x86/x86_64/domain.c |   4 +-
>> xen/common/domain.c          |  19 ++---
>> xen/include/asm-arm/domain.h |   9 ++
>> xen/include/asm-x86/domain.h |  16 ++++
>> xen/include/xen/domain.h     |   5 ++
>> xen/include/xen/sched.h      |  16 +---
>> 8 files changed, 207 insertions(+), 52 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 31169326b2..c595438bd9 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -19,6 +19,7 @@
>> #include <xen/sched.h>
>> #include <xen/softirq.h>
>> #include <xen/wait.h>
>> +#include <xen/vmap.h>
>>=20
>> #include <asm/alternative.h>
>> #include <asm/cpuerrata.h>
>> @@ -275,36 +276,157 @@ static void ctxt_switch_to(struct vcpu *n)
>>     virt_timer_restore(n);
>> }
>>=20
>> -/* Update per-VCPU guest runstate shared memory area (if registered). *=
/
>> -static void update_runstate_area(struct vcpu *v)
>> +static void cleanup_runstate_vcpu_locked(struct vcpu *v)
>> +{
>> +    if ( v->arch.runstate_guest )
>> +    {
>> +        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_MA=
SK));
>> +
>> +        put_page(v->arch.runstate_guest_page[0]);
>> +
>> +        if ( v->arch.runstate_guest_page[1] )
>> +        {
>> +            put_page(v->arch.runstate_guest_page[1]);
>> +        }
>> +        v->arch.runstate_guest =3D NULL;
>> +    }
>> +}
>> +
>> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
>> {
>> -    void __user *guest_handle =3D NULL;
>> +    spin_lock(&v->arch.runstate_guest_lock);
>> +
>> +    cleanup_runstate_vcpu_locked(v);
>> +
>> +    spin_unlock(&v->arch.runstate_guest_lock);
>> +}
>> +
>> +static int setup_runstate_vcpu_locked(struct vcpu *v, vaddr_t vaddr)
>> +{
>> +    unsigned int offset;
>> +    mfn_t mfn[2];
>> +    struct page_info *page;
>> +    unsigned int numpages;
>>     struct vcpu_runstate_info runstate;
>> +    void *p;
>>=20
>> -    if ( guest_handle_is_null(runstate_guest(v)) )
>> -        return;
>> +    /* user can pass a NULL address to unregister a previous area */
>> +    if ( vaddr =3D=3D 0 )
>> +        return 0;
>>=20
>> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
>> +    offset =3D vaddr & ~PAGE_MASK;
>>=20
>> -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +    /* provided address must be aligned to a 64bit */
>> +    if ( offset % alignof(struct vcpu_runstate_info) )
>>     {
>> -        guest_handle =3D &v->runstate_guest.p->state_entry_time + 1;
>> -        guest_handle--;
>> -        runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - =
1, 1);
>> -        smp_wmb();
>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: =
"
>> +                "Invalid offset\n", vaddr);
>> +        return -EINVAL;
>> +    }
>> +
>> +    page =3D get_page_from_gva(v, vaddr, GV2M_WRITE);
>> +    if ( !page )
>> +    {
>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: =
"
>> +                "Page is not mapped\n", vaddr);
>> +        return -EINVAL;
>> +    }
>> +    mfn[0] =3D page_to_mfn(page);
>> +    v->arch.runstate_guest_page[0] =3D page;
>> +
>> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
>> +    {
>> +        /* guest area is crossing pages */
>> +        page =3D get_page_from_gva(v, vaddr + PAGE_SIZE, GV2M_WRITE);
>> +        if ( !page )
>> +        {
>> +            put_page(v->arch.runstate_guest_page[0]);
>> +            gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%=
lx: "
>> +                    "2nd Page is not mapped\n", vaddr);
>> +            return -EINVAL;
>> +        }
>> +        mfn[1] =3D page_to_mfn(page);
>> +        v->arch.runstate_guest_page[1] =3D page;
>> +        numpages =3D 2;
>> +    }
>> +    else
>> +    {
>> +        v->arch.runstate_guest_page[1] =3D NULL;
>> +        numpages =3D 1;
>> +    }
>> +
>> +    p =3D vmap(mfn, numpages);
>> +    if ( !p )
>> +    {
>> +        put_page(v->arch.runstate_guest_page[0]);
>> +        if ( numpages =3D=3D 2 )
>> +            put_page(v->arch.runstate_guest_page[1]);
>> +
>> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: =
"
>> +                "vmap error\n", vaddr);
>> +        return -EINVAL;
>>     }
>>=20
>> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
>> +    v->arch.runstate_guest =3D p + offset;
>>=20
>> -    if ( guest_handle )
>> +    if (v =3D=3D current)
>>     {
>> -        runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate=
));
>> +    }
>> +    else
>> +    {
>> +        vcpu_runstate_get(v, &runstate);
>> +        memcpy(v->arch.runstate_guest, &runstate, sizeof(v->runstate));
>> +    }
>> +
>> +    return 0;
>> +}
>=20
>=20
> The arm32 build breaks with:
>=20
> domain.c: In function 'setup_runstate_vcpu_locked':
> domain.c:322:9: error: format '%lx' expects argument of type 'long unsign=
ed int', but argument 3 has type 'vaddr_t' [-Werror=3Dformat=3D]
>         gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
>         ^
> domain.c:330:9: error: format '%lx' expects argument of type 'long unsign=
ed int', but argument 3 has type 'vaddr_t' [-Werror=3Dformat=3D]
>         gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
>         ^
> domain.c:344:13: error: format '%lx' expects argument of type 'long unsig=
ned int', but argument 3 has type 'vaddr_t' [-Werror=3Dformat=3D]
>             gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx=
: "
>             ^
> domain.c:365:9: error: format '%lx' expects argument of type 'long unsign=
ed int', but argument 3 has type 'vaddr_t' [-Werror=3Dformat=3D]
>         gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
>         ^
> cc1: all warnings being treated as errors

My bad. I tested x86 and arm64 build but forgot the arm32.
I will fix that.

>=20
>=20
>> +int arch_vcpu_setup_runstate(struct vcpu *v,
>> +                             struct vcpu_register_runstate_memory_area =
area)
>> +{
>> +    int rc;
>> +
>> +    spin_lock(&v->arch.runstate_guest_lock);
>> +
>> +    /* cleanup if we are recalled */
>> +    cleanup_runstate_vcpu_locked(v);
>> +
>> +    rc =3D setup_runstate_vcpu_locked(v, (vaddr_t)area.addr.v);
>> +
>> +    spin_unlock(&v->arch.runstate_guest_lock);
>> +
>> +    return rc;
>> +}
>> +
>> +
>> +/* Update per-VCPU guest runstate shared memory area (if registered). *=
/
>> +static void update_runstate_area(struct vcpu *v)
>> +{
>> +    spin_lock(&v->arch.runstate_guest_lock);
>> +
>> +    if ( v->arch.runstate_guest )
>> +    {
>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +        {
>> +            v->runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
>> +            v->arch.runstate_guest->state_entry_time |=3D XEN_RUNSTATE_=
UPDATE;
>=20
> Please use write_atomic (as suggested by Julien here:
> https://marc.info/?l=3Dxen-devel&m=3D159225391619240)

I will do that.

>=20
>=20
>> +            smp_wmb();
>> +        }
>> +
>> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate=
));
>> +
>> +        /* copy must be done before switching the bit */
>>         smp_wmb();
>> -        __raw_copy_to_guest(guest_handle,
>> -                            (void *)(&runstate.state_entry_time + 1) - =
1, 1);
>> +
>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
>> +        {
>> +            v->runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
>> +            v->arch.runstate_guest->state_entry_time &=3D ~XEN_RUNSTATE=
_UPDATE;
>=20
> and here too
>=20
> The rest looks OK to me.

Thanks for the review.
Regards
Bertrand

>=20
>=20
>> +        }
>>     }
>> +
>> +    spin_unlock(&v->arch.runstate_guest_lock);
>> }
>>=20
>> static void schedule_tail(struct vcpu *prev)


