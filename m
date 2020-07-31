Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C313523464B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:53:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UXd-00022X-Qa; Fri, 31 Jul 2020 12:53:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1UXc-00022P-6a
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:53:40 +0000
X-Inumbo-ID: da8bb872-d32c-11ea-8e30-bc764e2007e4
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [40.107.12.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da8bb872-d32c-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBGgB3sBYTD44bnzZdQKadPAKk7WRa4mW5x1cnybI7U=;
 b=adgtTCrSCo9AwqtryZleebmUM0G30mTZNcZmOykXYbDmtbBSMr54mZlKKClaUjR+1qcqQyLcsDVIulOGEibHlCl5okT5tO/lAxGevpiSubUWHhIsFDe5Lsgs+RZkffamcuOUSnxKyuLAYrljBq20xM6jIZAemLNnyHpT7A3SrEk=
Received: from AM5PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:203:51::15) by PR2PR08MB4777.eurprd08.prod.outlook.com
 (2603:10a6:101:26::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 12:53:37 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::87) by AM5PR0701CA0005.outlook.office365.com
 (2603:10a6:203:51::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.10 via Frontend
 Transport; Fri, 31 Jul 2020 12:53:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 12:53:37 +0000
Received: ("Tessian outbound 8f45de5545d6:v62");
 Fri, 31 Jul 2020 12:53:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90ed80deb058d033
X-CR-MTA-TID: 64aa7808
Received: from cef4a5924d81.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A52DD1DA-2B31-40C7-ADCC-C061F744E92E.1; 
 Fri, 31 Jul 2020 12:53:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cef4a5924d81.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 12:53:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDLWS/O8sz6OVOyZ5HDLlm34ShBA7H+KbaNy5oMNmWns5zK1+BR47WwCA8iwOT58S8tzHd/jYLrywoCW04z5Fzw1okEm1DEWs+p2kdqxCmccpWC6o6z6Fi6dearhspe8PjDr381MrRNEOm/zqJBEerQ+ohrB7bEXHFZCbAB2j+kWP3V16i4vnXiTB6SCn59AQPJc5IzQC0uibx+9m18rtrCLz7ODus0He+od6mHQWiK9CULiynoSijLN1hDewRU4nfa5sPq85QQ7QVxvuysR4mpGk6kvFEgs+xgVvmN2Gz+e234onqtahKWL5/B9WY8k+U5n7cAiYyMykhU7gwdYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBGgB3sBYTD44bnzZdQKadPAKk7WRa4mW5x1cnybI7U=;
 b=k0ODCChKsNn4bZLgtJnY7G0K1/M8MV7LcTV8MK2cwr6nQOlpoZVsZIYRaOrO//XkXFhf1JhIVCiDuTx7ImsNrPhryAXmoWn1ly1N9t8Y4UrlZRPERQrAN5lNzQp/X3b2jH61kZSistMhnM8GF+UBCyF2dQzQMMwKF66NDeaUwwr1/oIp5sBiylbv7tqGkgwoa8+LhCVF0upWpat5D9deb14co4CDi9Wzm/vA32kBly6+ycHvWK5UtQAmIWj99YlhmU8zCGBg0sfvbGsuvsLyzmRFbV0TlzhUsbWGCrlBDYOILsyKKBy8Y81Gy+8AB01PgoiYy1UMmhfxYdrjM+LZiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBGgB3sBYTD44bnzZdQKadPAKk7WRa4mW5x1cnybI7U=;
 b=adgtTCrSCo9AwqtryZleebmUM0G30mTZNcZmOykXYbDmtbBSMr54mZlKKClaUjR+1qcqQyLcsDVIulOGEibHlCl5okT5tO/lAxGevpiSubUWHhIsFDe5Lsgs+RZkffamcuOUSnxKyuLAYrljBq20xM6jIZAemLNnyHpT7A3SrEk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4776.eurprd08.prod.outlook.com (2603:10a6:10:f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Fri, 31 Jul
 2020 12:53:29 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 12:53:29 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 4/7] xen/arm: guestcopy: Re-order the includes
Thread-Topic: [RESEND][PATCH v2 4/7] xen/arm: guestcopy: Re-order the includes
Thread-Index: AQHWZp4MdrEziqnOzkaNnp5sU1zHlakhpfCA
Date: Fri, 31 Jul 2020 12:53:29 +0000
Message-ID: <87E8FBB4-DFD2-4B10-9D90-D8628AB102F5@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-5-julien@xen.org>
In-Reply-To: <20200730181827.1670-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95c6bc2d-8e9d-42a5-46e4-08d83550bdd5
x-ms-traffictypediagnostic: DBBPR08MB4776:|PR2PR08MB4777:
X-Microsoft-Antispam-PRVS: <PR2PR08MB4777465A4B2CC697C77FBA319D4E0@PR2PR08MB4777.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2089;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: c9H7i67I7oJnIYdHs5QW068gsNz6SdQxPt156SlmjNR78ZsyCJnjjh7e3CxtS+Po4HgkSWG6wgp3Pz+/mQxMAx9cPsaOrx3C4lTLgSdR2LDdFy+G3GaT2Hr5WRagmSVRrj2W51Zbj0Jg+Na4Q0wKF7fNpuqEsur7ftg+4a6HQ4NZR/89LVquiHXzKP/2KSZwBCzp/kojya5gIiucJF1FZTfl+mEInAOwQNrbutE96mowPch2Ji5M28a7LyH+AiVebQzLFY+A2NthEIlw6AIGRtEJR1ne3oMy0urZnTYWyAeiP/BGGbMZysdftwUTP9hLw9q1AeCr6xF60xNzm7IOo4ANe4tDcYPBYVOLHh9NG6kfNMwtG4vHK4IJkkWVjB9u
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(76116006)(66946007)(316002)(91956017)(6486002)(2906002)(6916009)(33656002)(8676002)(83380400001)(5660300002)(26005)(186003)(6506007)(4326008)(478600001)(54906003)(66446008)(86362001)(36756003)(71200400001)(66476007)(64756008)(8936002)(6512007)(66556008)(53546011)(2616005)(169823001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: G1Lt3u5sBeJ5rsX+Xi2/X7/kELsxo3pDEWIVuxadIjIxWs43TdOKxYqH4107uwok3lrGB7sg/mMLQdg4dU7brqOlgH8BtUCzDAYFNfWCW7/raVubJq8bf9wkiLn4pEhxtXcxj0MCbM9yLgCsA6MwNpRAtQYN/pJTgfzI2/Dquurh2lL3hxtAiCk4s1TvouvYWXrXSWa8XseU6gF0koVMIsCxkoX/rvB1I1+U0miGTEJQbaB29IwrZLMg3ThbfpZ7YU3r/Q9cZyjsCZUgtf9GS0cno6vWrO+0jAg7rV1UrFo4lCRGIik0XNf6h/3ogJ2zyjU/fm/LPnRNfRGo9buqh66iWud4h4D6SbhdTp9NlN9VFH7YPOmTLN5QH0skB0lhLvNa7r14v3KIuR+69UWRdA7vgsWyJV7LXxhz6bIJe3yqq/oN2cgbQGd4qiqzJwv3a8BAJrjsIavOhS/dOZfEv6DKc9uhROdLRHQLo6aO8nu0Dxu+xQXFwd4IpUNDMoVK
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C40F41B2267044F88C879F30610E339@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4776
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0a361eba-f13d-4fbf-cc93-08d83550b956
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYlWOiUUzeGtsdRlU53pLj8TaJR+yd+trFR8R9iUtD7iWWQYOaZxZoADhPAVyiQoD9bWX+eyiXNMae+9NnIoLIpMxFF3XyWfXsYXO3YYdU4kiipB82Z4AKirAQ6n0M74d/nzVoUSMNe745Q+vpuDw0ZVYp67qth+2Txjejio3YK886LvKf5YQStQB+80DWO5zHVEqciCbai4nTlbFAK2HYR32DGZaknobUKKQpvAcXN/mzLGMDdov7sq5YQ7/3Ae9LL7S+JzNitpMiVkvOBlkIuf19HMJ1/adkh/6ZwSme3R7cUdnGkjORLRfx+0TmyDq5EJbQktvOw6Wc+NDcKDDIhKKA5h87DxUV1FCTP0zhN4u6Ey/k6NDu5EUEy04CH6HBewGP0n/UN9ykImdvCRaxGDkfLG6KCZ+jKsDOaBqj0=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(316002)(82310400002)(33656002)(8936002)(83380400001)(8676002)(336012)(26005)(5660300002)(6512007)(356005)(2616005)(36906005)(47076004)(81166007)(6862004)(478600001)(107886003)(6506007)(53546011)(36756003)(70586007)(70206006)(82740400003)(86362001)(54906003)(6486002)(186003)(2906002)(4326008)(169823001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:53:37.0352 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c6bc2d-8e9d-42a5-46e4-08d83550bdd5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4777
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 30 Jul 2020, at 20:18, Julien Grall <julien@xen.org> wrote:
>
> From: Julien Grall <jgrall@amazon.com>
>
> We usually have xen/ includes first and then asm/. They are also ordered
> alphabetically among themselves.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

This could have been merged in patch 3.

But anyway:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>


> ---
> xen/arch/arm/guestcopy.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
> index 7a0f3e9d5fc6..c8023e2bca5d 100644
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -1,7 +1,8 @@
> -#include <xen/lib.h>
> #include <xen/domain_page.h>
> +#include <xen/lib.h>
> #include <xen/mm.h>
> #include <xen/sched.h>
> +
> #include <asm/current.h>
> #include <asm/guest_access.h>
>
> --
> 2.17.1
>
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

