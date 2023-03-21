Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBC26C31B0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 13:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512595.792575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peb5M-0001Yy-HF; Tue, 21 Mar 2023 12:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512595.792575; Tue, 21 Mar 2023 12:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peb5M-0001WW-Db; Tue, 21 Mar 2023 12:27:28 +0000
Received: by outflank-mailman (input) for mailman id 512595;
 Tue, 21 Mar 2023 12:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peb5K-0001WQ-UO
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 12:27:26 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe12::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbbc27b8-c7e3-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 13:27:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 12:27:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 12:27:23 +0000
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
X-Inumbo-ID: bbbc27b8-c7e3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WS+pBu/kzI2bXjJJe8H7VCdUP+ujSi7BUZhlmcJZAZSM0qYzg7EPW+PIqAVgLyOnOTqMwEXpu4QdFVopf9JR0mA/E83bry2PTIrBEMZaCP/cogdpesTcHGTlpYXu1HIaFXrLYPyoyPuO8SLWb/+Xtn8iMjX370ooADXYglQdT/hFOxO9daVxJirQh3Kx8IkF3DxXL/L1iaPlqEI6zDWZIwyibd2wEq6F9hnqWxANrSFsNul6Y9jvKJ008e/a3RvLI0YZe/QVkxz++tv+TNKBLNumOpwRCFArXH7l85BLZEkBsr26TlSMBUso68tIsVyl9/Jc7FnOBIKoV8gQA6H78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H1nQUHjmcghyj3QG0m+JVLw5INiVwQQhaFUDWyjJR4=;
 b=Jgqe8YDA+iLNCe/4QC3CE8R2nGdOM12lkmEsTerXbLf1I82w1gfRyJPgv9u164NqUiUjDNyCmiqAJrd0AFKoLBEotFslgBvMajI14aS5CU9KDvbXvajfAGSNHR4/uKhirBQgq54/sX4w0pjgwt/UEsMCqSlLZDL8HHr1itrCz/WO17GHvSKLspkOewHTjfxA/nji9mFG8IFJIIzHRZzbN/B5PFgmB05zvKHmKg3PXsJUMP1drFviw/5TJDJeQbcA25QFRSqA6RlhzsfxDsTE7GRB2VHCQgyAiQjv2n1ZxTIPJ/ZxbgoFmUS+/iRkcr+baQKtKLqDkLn9k0E2b+EVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H1nQUHjmcghyj3QG0m+JVLw5INiVwQQhaFUDWyjJR4=;
 b=Ndd1ImrtXfnzFR0NjKlAvufZkE2L8WkdUMTaGtJpCtRw0nHDXCiMmP57ln/zoVyfKGbUhRSWOE0AS88Z1N1dlRUUUE/c/t5LZ8WWGVGiE7UlT8ROq7TtCVx0LN6psPns2V8l6OtwT8drLv90SJaoac5AvUZGB4yJtISRdj/Kn8JBUEcrmlSJ4mzp4HtkppLgvh1IvY49pyf8SmsfB/Fchwlfa06K47NbJvqqvfGkNBGzCJfxzEt4iSetsBrK1iQnRPnJb8423NMh4bITk0GP0ib/E109/U6ydRUESS7CJszJFgStolduQO1iuoUQB2a931jEuad2X986vajyhZ1rxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5634fb6-fd41-6d42-603a-4df69adb929a@suse.com>
Date: Tue, 21 Mar 2023 13:27:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com> <ZBl6iU6T1CsWqVx9@amd.com>
 <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com> <ZBmDl8XjIos57EIy@amd.com>
 <cae4e673-65d8-273b-66b8-08d374797da2@suse.com> <ZBmZxnyZWrni57Ry@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBmZxnyZWrni57Ry@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 780625cd-289d-4b2a-5867-08db2a079f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nqw89zdRNjRY4LMe3eBJVKUaw02tcF6MgNMUDLrePFSkXYG4xw39lWy3sRUAKkv6K2rkiK8IFUwrFvs+1JUuJ0vxUfN8uJl3uT5vpgkgXfF324OYDULlfK2VN5cSHviayDOnWY9dkWzkdMLHR5tn2DMTolETo2z5UDd0lpEqNdWVNONvq3Hm49sX6RFaEZ0+Rm1JGGHLvImirJjmMRDO1i3otGHF46U9qiMS1eKpIuGgypvqF9SE78ya7/8bV89velgYXveVgWszzozkyfllhPic4CzBlEEha8UTql3sAkxHDvjJy5Y/Q9w4YHNGFrg3Jy3d9SSkBIPp2PHIpn8Q+BcnLQ+KgA7joa83665Ii4Ti2RZFqSPT73pvKscgBJTiMJKihB7xda41R311hdCIwDgbzMvsnkUE3qtJ3do07Q6UJYGEtIBeFUDwyTbceveJvYX+Loa1cM/WsfwCuowKZdugH92Gj7hrgDxXBsjN5tlZWMt8LVvXbXtmz5TMPwMyfUQkiAYSrPlH4o6I475UL79Hgin41DcbAFH/ofTSASVhwLRy5ajSCNHSZiJycBaWEx0GgLJRZuINjAzznZGhbmGIzEXriimtEAWbcXbjDUDclbelZzghQjKQvejutv2ZyGBleavt/oCWltZKvExYa1dAsI1p64zHSEvvwec8XKcRtOx1kvpiNlG9XcXm6Rv/0UQDvIkus4tUmcO2NnsJJNa8BBnAVu1JI1HqhuUFEWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199018)(6486002)(31686004)(41300700001)(54906003)(66476007)(66556008)(7416002)(6916009)(478600001)(66946007)(5660300002)(4744005)(316002)(8936002)(8676002)(4326008)(36756003)(31696002)(86362001)(6512007)(53546011)(6506007)(186003)(26005)(2616005)(2906002)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tng5YnZkUmxnRmoxUllUZ2xKR0hvNnZPWGZXY20yeVM1bk5sQms0ajVJY3VY?=
 =?utf-8?B?NjdmSHhNTW9Qc3QvNXBXYjNOcXBOQk82NGViazQ1bGZObUtZdG44Rml5bGp0?=
 =?utf-8?B?L0VNK0FIQmF0c0dzQkFFWnNvSmRicjIzUW5KcHowRGpnS0tlOTlpOFByS1ZG?=
 =?utf-8?B?R1NzUGM5cmZrRTFtUEhkMWJBZjA0N1MyNThqa2JqemJVa2tVVnpsV1RCcUxB?=
 =?utf-8?B?WVMySW5MWTBleTFHVnU4MHJoK1Jaakd2ZC9OMHQvQzU0c1N2ZjZzRkEwWXRW?=
 =?utf-8?B?QytrY3pDTHZFaUNoalJQM091d1hvdzlsdWJUckFWS0JMZ2RidytDNGdnYTFJ?=
 =?utf-8?B?UE1zbDFBdXBlRmV6OU8vYVlsbGNQcEl5MWNBWTg0WnJieGFZZ0RKSmRmMDVh?=
 =?utf-8?B?U1RpSUFsaWx6UnFxZFBUZHBuN2E2bWg4K1lKOTJUVDRXdWYzMDgzQnNsem43?=
 =?utf-8?B?QTFnenorTWREMDlwL3FUaUQ2TzFxQnFhRHFWSTZYZlFUWnhuRFArU2phRWd4?=
 =?utf-8?B?dVEwTlRxSjJXU014clBKdGtkc2ttUU8wVkNMenNvK3lpRFYyV0FQLzMrdmNQ?=
 =?utf-8?B?d3EzUkpOcUxXREVaTlhmY2Z3VmZsZ3pYaitDeUtFNHpCaTFjZXVIY3NiemhN?=
 =?utf-8?B?ZjI1bWxVUXJ4WGVsQ0hqdERjQXpzdklrdm5BMmx0NndRMm8rYnNrMG9BTVhR?=
 =?utf-8?B?QzBHRG9Na09EdjM5VlJCYWVNWE5uV1Nyb0ZySUJ4dWNPUFJ4QWJNQ1QzUHV4?=
 =?utf-8?B?blU1bkZHWWhoT1dpNnVJaHo2dU9RQzljVEFKWXJkaEd1N0dXZHJjU1JNM2Rt?=
 =?utf-8?B?SmVzVUVIL2RsV0hNOVZnOE5tWlhuSUZjU2lucXJiUE15c29PMmgyMWZlRnR6?=
 =?utf-8?B?aG1EMzFXa3RkazZnZzlhdnRxRmRCL0pmYUE5aGtWTUtEbjUzYVpVSmI3M1dz?=
 =?utf-8?B?UmdaNXNhU3dsbTdwU0YzSGQxcnlyQm1va1BGMW5PbnZHTWhiOGk3OFpjSVpL?=
 =?utf-8?B?S1kraTVTSm11Y0o5a3JjTDMxM1Q5MllvM2Q2OEtqZGRjUmxZREJjN0wwSnBj?=
 =?utf-8?B?Yy9hbk9pNHc4cHRVYTlhbFJaYURCeUdQcDVmdndqZGloUWYzU0JtQ3NoL29F?=
 =?utf-8?B?dVpXS1huVjFtaUR2dWM2dUIzVjlURjhXYjdsaEFXdE5QT0RnKzFLVXFyVW40?=
 =?utf-8?B?MWRXUUtBbG0vcTFrOGlSTnhEZUgzVGJSUGJXVFZoZ0czZzEwUGRzcTdFM29Q?=
 =?utf-8?B?RWNrZXllbW5waUh0M1VwNHUyTzk2cHA2OEdtNDBSOFNhTzdOci9FWE1HL2Ew?=
 =?utf-8?B?anE1YVRHUEpaVGJQVml6WEJ1aGMzRlJNWTUyYkRnUGZYVk9TbmtrQUh0ZkJV?=
 =?utf-8?B?ZWVuVVdydkFvRXl1Vk5rYnlZd2RDTTBxM0NQYzU5MEVTNzJZRFFjUU9sbE82?=
 =?utf-8?B?WkRsd3ZCQ2RuaDBHR2F2TU9BNGorc1BpZmw4WjN1eEttRkMrcXJEM0pqZTFk?=
 =?utf-8?B?eUplVG9nbW9seS9hZ1FzOWlMUTEyMjNWZ2lRZDhLckVvM0dpbTUyMW43UWF1?=
 =?utf-8?B?cTRTK3p0L1crZTg5Q2s4ZzhZbmFQVGZRY3ZlVDliZ2FUQ1luQUd2dWpXRDRq?=
 =?utf-8?B?YjFIUXdzamx2dEdJZlNTVXltbnd6L1JFRS9yT2gzVVpkbGdNanErT2paMFYv?=
 =?utf-8?B?R3gxWDNEdGFYVG9tOGxHQzl0TG4xVkVKSy9ld21sVWlnZWd6eExOS0JWYmRW?=
 =?utf-8?B?alVQTTZpVjN5NUZzKzg1KzRFUHVDSG52K1B3Yld4ZDZGRW9veE5zU055QWZR?=
 =?utf-8?B?WVFuS054bWdsb0pPWFUveU1sN2JCdE1NWFVaakM3aWtDYWlpUXNUNjZMM01i?=
 =?utf-8?B?YmhHS1p5cTNMSjN2ajFTQ01HME4wTWZ1TldSaEZzWTJNc1lqK1V1eE5tdzJT?=
 =?utf-8?B?eUNEUkxlMFptS3hwaE5BUVY2aC9wUU9hRGhpSEdKOUlLZkh1VkNycWlhVG9V?=
 =?utf-8?B?VmRHVldadE9PWjRpS21hMkxRUEwzSHpwb3F4bW9jL1hqOTQvdFEwZmhyNDk0?=
 =?utf-8?B?QkFOazFUT1YyeTF5OFAxV2Q5MGFMK1ArTlU4WW9ma05IUUdLeCtQMVIybmk4?=
 =?utf-8?Q?3kPPu+y8Z0+dau/Q9Ms03xrFz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780625cd-289d-4b2a-5867-08db2a079f95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 12:27:23.4965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNkbRwDZhWKBoZxAVN04rn0Szs4mAEWE/FhCMcF8wpskD41pfKXZ8glh9eNkPW5Qvh0xR6iufUEZDZuPC2VvXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802

On 21.03.2023 12:49, Huang Rui wrote:
> Thanks, but we found if dom0 is PV domain, the passthrough device will
> access this function to write the real bar.

Can you please be quite a bit more detailed about this? The specific code
paths taken (in upstream software) to result in such would of of interest.

Jan

