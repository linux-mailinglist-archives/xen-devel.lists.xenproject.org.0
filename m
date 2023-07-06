Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083F07495B4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 08:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559610.874728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIbu-0002Q4-M1; Thu, 06 Jul 2023 06:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559610.874728; Thu, 06 Jul 2023 06:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHIbu-0002O1-JE; Thu, 06 Jul 2023 06:37:02 +0000
Received: by outflank-mailman (input) for mailman id 559610;
 Thu, 06 Jul 2023 06:37:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUoY=CY=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qHIbt-0002Nv-Ep
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 06:37:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81549c54-1bc7-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 08:36:57 +0200 (CEST)
Received: from AS9PR05CA0057.eurprd05.prod.outlook.com (2603:10a6:20b:489::35)
 by PAXPR08MB6461.eurprd08.prod.outlook.com (2603:10a6:102:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 06:36:54 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::ef) by AS9PR05CA0057.outlook.office365.com
 (2603:10a6:20b:489::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 06:36:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 06:36:53 +0000
Received: ("Tessian outbound 7c913606c6e6:v142");
 Thu, 06 Jul 2023 06:36:53 +0000
Received: from 05d1cc8144b2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 386F99E4-E37A-4316-A6A8-7D24537EF831.1; 
 Thu, 06 Jul 2023 06:36:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05d1cc8144b2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Jul 2023 06:36:46 +0000
Received: from DU2PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:10:232::17)
 by AS8PR08MB9551.eurprd08.prod.outlook.com (2603:10a6:20b:61c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 06:36:44 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::eb) by DU2PR04CA0072.outlook.office365.com
 (2603:10a6:10:232::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 06:36:44 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.24 via Frontend Transport; Thu, 6 Jul 2023 06:36:43 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 06:36:43 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 6 Jul 2023 06:36:41 +0000
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
X-Inumbo-ID: 81549c54-1bc7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Rhbf8WQggoKCKape9Ne6KIQIcBJ2Fl5IFRmJBlqXPM=;
 b=Ipvxf2IcTDl0nkY0yz2/2X3Rt2vMdw3klfkE5aSwYxqR0PBrVk/G7aEYhLS4VTjEevhAlwnZi8KkQ2RY9UyIzbclC1DcD3itV3yHsMBygxc/+i5D/+cQg3yk2UmQNwWWbMOXC6PrfEap/j3KiDnInQGmvD2NFgK37YUeyWjLiHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fcd4b463adf9b175
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIgLWGncblDhjMPIYPR1n/trAgwLJN46pfXWNy+Q0Xn19AzXWV5CYq5LYWVqh4nP/qzimPcQ+HGo83nr5P/yrFYKJrXOqSnaUa9kScRhDhxnWx6Zspdk+xecEOT6WsP+wd2FD5yOFl5jT/Tmma5R6DSNjrG2Hkwb1f9pEHjq9XPfPOsTCK/0yKfG34zNUapCV6/WEYhmiZeeZ48P3dcdmKvDs1so1WV8sJqnFOWEeDl7vE55x+d//VXJYboAUjK2lAXHp8koiGYKpArRG0DTtZrR9iUSuvgoPSuX1YacsWPtEBSfcOAapkOV+MtKT7JaUgTGh6BH5Bb2Dj/ZyrO6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Rhbf8WQggoKCKape9Ne6KIQIcBJ2Fl5IFRmJBlqXPM=;
 b=Uayd2Mk+otZuIG1adfdPNaTJeLsB4iuQnL4dsqLNlfq+YVzzO2Lsd9Vd9ZbVo5AWcBdo4NAKmCrwDXeqg8eR6bvqrATlD12Bp1GZl9hP3tNs+ryVtwZvIgD8GGCT3TLeggUtd8bmheW5wKPLFgrz2QQw25GQ0gShZspcx3ScMjgvr2M6bBXFVSlmFldxQRkn0IeCfbWhqD4gSlFzVkO51fI1KIbp1S4Y20+/L6lQVGpWYzwnPuoJZE6ibhvZgw3zHt45Q5DUrHbvt+CcJfYfVvqjmluAm60HoPs1OClWGwhah6lwAoGWWmANnkc2GWuI8LqEQ0hAlQm7sSjuX7gOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Rhbf8WQggoKCKape9Ne6KIQIcBJ2Fl5IFRmJBlqXPM=;
 b=Ipvxf2IcTDl0nkY0yz2/2X3Rt2vMdw3klfkE5aSwYxqR0PBrVk/G7aEYhLS4VTjEevhAlwnZi8KkQ2RY9UyIzbclC1DcD3itV3yHsMBygxc/+i5D/+cQg3yk2UmQNwWWbMOXC6PrfEap/j3KiDnInQGmvD2NFgK37YUeyWjLiHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <528c968e-f6f1-eda2-4e16-55b32f400814@arm.com>
Date: Thu, 6 Jul 2023 14:36:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 03/52] xen/arm: add an option to define Xen start
 address for Armv8-R
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-4-Penny.Zheng@arm.com>
 <cb7e3d34-bbb8-e5df-f87b-0fcac4b65378@amd.com>
 <77c64929-514a-ea67-cf8b-176c895ff971@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <77c64929-514a-ea67-cf8b-176c895ff971@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT006:EE_|AS8PR08MB9551:EE_|AM7EUR03FT038:EE_|PAXPR08MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 142cea54-6d63-4adc-d192-08db7deb6324
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ignhynuixOuoCUaNnK8sil1Vvej8gYQM9YvwSK6pt4hyhZn0cPm/qqZKmwZ9xIzNkiRfjJ/xgjcnCcs2uCbVcWG0PSTYSgfke9xqhd6ccy6rImBswGtDcFzzbLWxqDbSYSAvedEb6iPIwiwGaVy0L0yGm02bOi5GU5inz/CmTIMD6rbhWp8VoSUcg6IroOs5fu+/JGZ0aF6we3Rk0ejkoMkiqiVQZVrlY9tSkwi8HSeAB2+xj7S3Ow/ovxm5cdZI/O7NhRIQGGbCJF3k+yhu+uaN9IfGQXEwZ/I79IHEZSIaAQQl8YkCAU4SdvG3PbuldBA9zlQ85rsBPO732MNw8ZeSx16Cfw+T4+Gqku+fjPE6go5bIh7N0YbvxxUc5sf1HGpYlh/6S26/uLBEfgY6K/xnimIl1h7AdiI0Iu+KP1r0E6cCn2S9ogMI4PIjgmABGH1NQTT+VlN24fNQPvu7WkJXvoEmXDVzWwelTTGkwbm1soqvPnr3Kvh3Xkpnlz3KdKNfrvtrhI3FOQNezQaY/cG5wDeG6zZKwjNc0gxk7HYMSeIyvyZGOK+Kquk8E5H/NecSCfaYLcB+oey7yMzH+asczD7GyRKJAWRsSUiVQHN7fJwDMIle2vKMpHZBZG8cUBHflwnDv4I5JyUaNiIwpio115eigtfaNHrmTakfSbS0se2to1Y/P2Ronp9oyWpqRNtIEq0evxmagPLKazU+LP7jydaHM6IiPs39YKySGRizAziaCMbMEUxfqbT//J88koZcFt7vWgEPGjN7JM9WsZlCQj87yQYofEJkEORpoFqXXDXvz92/NrvUhDqQ14v3
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(31686004)(70206006)(2906002)(82310400005)(44832011)(36860700001)(336012)(2616005)(86362001)(40480700001)(31696002)(8676002)(8936002)(54906003)(26005)(186003)(478600001)(110136005)(16576012)(966005)(53546011)(5660300002)(81166007)(426003)(40460700003)(83380400001)(356005)(47076005)(82740400003)(4326008)(36756003)(70586007)(316002)(41300700001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9551
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d11d9ae6-7090-4403-1495-08db7deb5d51
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jv7r9KzE5x/EYzKPc4LCAwbwtTQNaEiUfAZCvleHj+x8ckNdMiFp8ZXAOuDPt/2IfZngDIVVJCIFAxO1LjwmMAItAicjqywE1xNZO4WA2OqcU94SE45Ei1Z54uVS+k4Tn61WWYLlDU+nR2eHFrOiVl4CMmwYsH3SmyhOWHVJnlNbzeXru48r2y9jZmajhfRIa8Q+6CzqhrmA4zUkQhAYySUnSznw5fFWJAr5DEKXJkX8o+DJOcruop8FfwIAGUHKmDAmrahaeHpEKh067iMhJsevRDeDdCRv9dCGmwGBEnke4kwLBht0gyme6FUT+bnmA3jVPFAlL4nzSM/oaTWKJWhrs5G/hawjGs70QX87DVE6f5KpPE5fcFYdp8XGGymSVOxzasjF0+1LUTTots8mUH2MslupYFJ5cIwl1mBXXkqsM44RHKLItedBgWoZ3/4Kxu1Rupj7AGYFwk81fEJvgAKtqUNfy43iSTRZpFVGXk21rZSRRniM4/GipMQWoL3zMXKrRQUsHnuOna1LnULcLTbb9vL2leJYGCKG3uZQ4DhjXnfJUCqKHzEH1Xx+DNEaafE7aK41tilAxbzMl2ZSofAqOeFugyDKLzx3z0K4XutMP6OQUfev9I1deUfDHofDSxXyttvfaguzLwPGJj/zQlG5U39KUvKryaBEkBF2wp2QGJYQUeXJBpFI48nrgZc8yH4Tqb2d/yefuiO9DZC9WcQ3ikqA0EtG26cdtR/F/J/226+1eZ45NBZQrRD46ZcQd4a5KIPyAPgAetfZErGcc1YLndZWGlfeMkPFaWseC3A=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(41300700001)(40460700003)(82310400005)(53546011)(107886003)(82740400003)(2616005)(81166007)(83380400001)(186003)(336012)(26005)(47076005)(110136005)(36860700001)(966005)(40480700001)(426003)(86362001)(31696002)(16576012)(54906003)(478600001)(2906002)(316002)(70206006)(4326008)(70586007)(31686004)(36756003)(5660300002)(8936002)(8676002)(44832011)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 06:36:53.6576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 142cea54-6d63-4adc-d192-08db7deb6324
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461



On 2023/7/4 19:47, Julien Grall wrote:
> 
> 
> On 04/07/2023 11:36, Ayan Kumar Halder wrote:
>> Hi Penny,
> 
> Hi Ayan,
> 
>> On 26/06/2023 04:33, Penny Zheng wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> On Armv8-A, Xen has a fixed virtual start address (link address
>>> too) for all Armv8-A platforms. In an MMU based system, Xen can
>>> map its loaded address to this virtual start address. So, on
>>> Armv8-A platforms, the Xen start address does not need to be
>>> configurable. But on Armv8-R platforms, there is no MMU to map
>>> loaded address to a fixed virtual address and different platforms
>>> will have very different address space layout. So Xen cannot use
>>> a fixed physical address on MPU based system and need to have it
>>> configurable.
>>>
>>> In this patch we introduce one Kconfig option for users to define
>>> the default Xen start address for Armv8-R. Users can enter the
>>> address in config time, or select the tailored platform config
>>> file from arch/arm/configs.
>>>
>>> And as we introduced Armv8-R to Xen, that means the existed Arm64
>>> MMU based platforms should not be listed in Armv8-R platform
>>> list, so we add !HAS_MPU dependency for these platforms.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>> v1 -> v2:
>>> 1. Remove the platform header fvp_baser.h.
>>> 2. Remove the default start address for fvp_baser64.
>>> 3. Remove the description of default address from commit log.
>>> 4. Change HAS_MPU to ARM_V8R for Xen start address dependency.
>>>     No matter Arm-v8r board has MPU or not, it always need to
>>>     specify the start address.
>>> ---
>>> v3:
>>> 1. Remove unrelated change of "CONFIG_FVP_BASER"
>>> 2. Change ARM_V8R to HAS_MPU for Xen start address dependency
>>> ---
>>>   xen/arch/arm/Kconfig           | 8 ++++++++
>>>   xen/arch/arm/platforms/Kconfig | 8 +++++---
>>>   2 files changed, 13 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 70fdc2ba63..ff17345cdb 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -181,6 +181,14 @@ config TEE
>>>            This option enables generic TEE mediators support. It 
>>> allows guests
>>>            to access real TEE via one of TEE mediators implemented in 
>>> XEN.
>>>
>>> +config XEN_START_ADDRESS
>>> +       hex "Xen start address: keep default to use platform defined 
>>> address"
>>> +       default 0
>>> +       depends on HAS_MPU
>>> +       help
>>> +         This option allows to set the customized address at which 
>>> Xen will be
>>> +         linked on MPU systems. This address must be aligned to a 
>>> page size.
>>> +
>>>   source "arch/arm/tee/Kconfig"
>>>
>>>   config STATIC_SHM
>>> diff --git a/xen/arch/arm/platforms/Kconfig 
>>> b/xen/arch/arm/platforms/Kconfig
>>> index c93a6b2756..75af48b5f9 100644
>>> --- a/xen/arch/arm/platforms/Kconfig
>>> +++ b/xen/arch/arm/platforms/Kconfig
>>> @@ -1,6 +1,7 @@
>>>   choice
>>>          prompt "Platform Support"
>>>          default ALL_PLAT
>>> +       default NO_PLAT if HAS_MPU
>>
>> I am a bit concerned about this as we will be introducing R52 specific 
>> platform in xen/arch/arm/platforms/
>>
>> (For eg 
>> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/platforms/amd-versal-net.c )
>>
>> Thus, we will have to remove this line at that time.
>>
>> Can you remove this line, please if it does not cause any issue ?
> 
>  From my understanding of the discussion at Xen Summit, most of the 
> platform specific code would be moved to something similar to bootwrapper.
> 
> So do you still actually need to have code in Xen for setting up the timer?
> 
> Cheers,
> 

