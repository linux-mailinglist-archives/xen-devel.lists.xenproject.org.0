Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFC07CAD19
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617745.960678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPIo-0007pZ-84; Mon, 16 Oct 2023 15:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617745.960678; Mon, 16 Oct 2023 15:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPIo-0007nB-5D; Mon, 16 Oct 2023 15:14:42 +0000
Received: by outflank-mailman (input) for mailman id 617745;
 Mon, 16 Oct 2023 15:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPIm-00070S-Iq
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:14:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9eab082-6c36-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:14:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:14:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:14:38 +0000
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
X-Inumbo-ID: b9eab082-6c36-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYn8/a1z8Tr5HVmC5BWevbOvLoTAW+W/qboJ/KAStu8TG/Uz694cnuK5uszM1loZt/hVvTadIFplFgDrWwE7EBv7k2JkNKNB3CSMIrMOUHwEd59Lzbkb4ObtBGQxG0R/EF9648YrigSH/Xpbhkn92giaSUxtbuhF2yOLwvpAt70JHih1/2EczlR6xtnLn6i4hcx0OCFiTi4hXbWZC5Ubq44GUh7UILecIucsFTwy+IQY/pU9bRBPgRwo9k91B3TGkbwxFQ1e5qhKcQuYVkHpD3NV29yqYd2uq/IfHUSNy4Ew0DUVe5fJbuYaw8jI94gjsX5Vqgby/wCe0GZquwrLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHxRTEq3Uy5olVaZeFhz53ckU63frvU9NSt/3W7YXrM=;
 b=BHVSbetIe0Qw4kds88iqEYqw43TCDRAgvc58CLj6aBBUlTFpezqyllSlO43sU5MF+cfN1Ah+3T83gaFZI3PVtHqFyU3AbvpBymwyhKl0GqdmF9/ClEEIfkuKDT8HCe7SirWngyYOeeN5zEhY4jaMSGlEMx2whwZ2+T0Y4E4UeNQeycA9eE3E5cG74TVNYm2s21YdfMY7oWIaRP3KhObLKUch8IN7GMuUUcVKVIMrR/VCezL88TRbXVkA3TC5tcn8Yv7erf4w65nICm+UdskW5BVB0u0mDSFO914Cp4a0nvdbhvuZzNvBY04ywY3ZEa6zPMJv4KF9mZVIMIhChlNvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHxRTEq3Uy5olVaZeFhz53ckU63frvU9NSt/3W7YXrM=;
 b=rD9cxbHpEPxPnYlftvQcUy4IUDV4NaCnKfTYTicSWsckPIEWGWSFYphw9pLt7NN+rnueZlWluOf6kBf1MOq/7cYajm9D5066H9yOB8hvV35HpO0oeU151fhilyIispsImO2krJW7ZjwIdl3OQojehok77f3/UsprxZ/x/0K79uAuhbPRkEheoFNlfzBZ9In8nO9v1q/kz6g8tGNQeshmaeUkV+rhnzvIPwgeZDbTxPYQKopAsHyLBqWhDMmTQPe0WeFyptEdfm/Jzq4FRjp8EEtuPuVj6apgifCKSsAH102a/VHOTzNDahPSwaRUvBldRLEpbmtM0qukJFwEiNnqRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee0fe22c-399e-70c6-830c-92617b987abe@suse.com>
Date: Mon, 16 Oct 2023 17:14:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/irq: address violations of MISRA C:2012 Rule 8.2
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <fc077d4dba9c37d9d81cea5d184e59f00c3cdcd4.1696242264.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310021545060.2348112@ubuntu-linux-20-04-desktop>
 <F8ED4DE9-CE9B-4B51-B702-893D062EFBB7@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <F8ED4DE9-CE9B-4B51-B702-893D062EFBB7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: c5390716-931e-46a8-e419-08dbce5a9d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4EVFnImz/BNfvjCEbmMUDcJ1DzM82VBBQ+KPOQ51byaFPV/FQRaS69l0lpkhn6WumiLAwxOIRNsFScjCCLnsjm5ROk3OZMOdyXkihsn7W0r/aCxuMwIXX95xAVNeobHEbZssGQY+SoSW23gYTVYpC/pXV5SCqy5uRLXLej1y0KYt9P3PpKacm3zg/QkxEjcI7LM8Km9SrwmZ5KYSrR/K/LXb5x72MNSI0bb5h/AuxyzmlY7uEyKiFcF+CinoBpNP1Tmvh2GTwYFMnEKKQ1aDuhGdrKkOrKU1s3/aomZS4sXoj23wfCUhpaJrCcBwH4HBhYGvJmYcMhTTeoaEtBM1sKZdSTxIRHfLg1eji1jQCEaQLyjpINbXj27UXD3GuMBw+2+H22SLjo26gEQPRJPNZliCb7W9cBSvN4H8P5cjUnUAHSDqxjIKA5iFNUwhsEAHvFyqZP07whc0o7y5oIkhbTv6ApZ4v6/E1l7o5w2QeF0GIkK1+W8P7si1+v2V0i2uoDYJaV6L9XDzylrJHGZe2yRgnsNXKPBt+9DDWlg5yoLS18MLYtMaJ/UOCRFPSUOMiWimzZgqYhlYzfMm/hlkDSIjvHC8GYHcugWu/657hz/oogTqK/hhDIxN+Q5UAm11NzrdQc0OJlaTQkkLYeAvJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(7416002)(4744005)(41300700001)(6486002)(86362001)(478600001)(31696002)(66476007)(66556008)(36756003)(54906003)(53546011)(66946007)(6916009)(6512007)(6506007)(316002)(8936002)(8676002)(26005)(2616005)(31686004)(4326008)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDl6dUxSbmpSTGphRUt2YWVkZ01aejJ6amdBdTBqTVFLWk1HUlpUdzlLKzlk?=
 =?utf-8?B?ZUdiYnVYa2pYRlNaYVZCZTloZmlDQmw1MTdXZFJSd2dnenRwdXY5SytyWlhQ?=
 =?utf-8?B?eC90RWhvUXplczRXeGtjVGhnYmhJazFyNUQxeTdtMHJjMzBjYzFuZ1pnMEpF?=
 =?utf-8?B?YnhhdURPek9nQlkyNE81dWtxQktPUHNBeHBwdlhzRmlkcmxXWlRxZXBUR0Er?=
 =?utf-8?B?OWw4cGdhcExXQjZlWU5YWmthd085M2lqV3FZL1hFa1RGd04vWTI5aFI0dTN1?=
 =?utf-8?B?Z3V0eXNwUm5vemFCS2QvOVdHNTNiT3FWSWdnT0pTRVVmYitIL3lKVkVzMmhq?=
 =?utf-8?B?ZWF2MFVmaGx1R2F4Nmo4aHFlSEN1aVNYdXhmdjMzMHlZaU03Q3RZc0NacUp2?=
 =?utf-8?B?MmZOMmdjQTBUcUJKVXUvUE5KZytXNGlvUUhQUWlNeG5UQUpadlFFQkNYT1NQ?=
 =?utf-8?B?QWNRcTJZQWt2cXRGUW9ROExPbmJDdzJxZEt4OFE4NlNIYURaVjR5T0d1WHFJ?=
 =?utf-8?B?UXk3eExVd1lwVHQ4VUFIMmxXVkFvODRjVmdvY2U4SzFXZ1VRY0plUHROMjl5?=
 =?utf-8?B?RjlWUzJLYlNId1I2ZTc4V1ZYTmVwWnpBNGN2NDJ2THV5MGNEeVl1SWk0aEx3?=
 =?utf-8?B?TmF2SlJJa1FXWlc1VUxhY1NBK3M2WU9rTHhuWEE2Sm1OOVFoSXRYYjZKNTNk?=
 =?utf-8?B?ZE9IY200MlMvQzFIYTFROVMyUGVHVTRJK0FLbERVcUh6OWlucll3OEFldFBK?=
 =?utf-8?B?K0tsYU9MNlNtaVl5ZmtnWTB1V20vL0grejFkT083Um4yYXdYbWk5ajJPczcv?=
 =?utf-8?B?Sk5iZU5IYlBvaU0wRHE0cHV5REpkblpORVN5RVRxQmpTN0xGcGpuTVZFSVIr?=
 =?utf-8?B?cGdwcU5lVUZpK3lBYVdrdmVWWmdVYnh4b3lQQVpXVlBTTktZR053SVd6K0Jz?=
 =?utf-8?B?bUtaWllrdnJVOFF0bnFldi9uNFRGbHlkNnhHWGtzcnVKc05XRFNYa1crTnkw?=
 =?utf-8?B?NmduN1lZTTlhMGZ3ODVyQUFscU1xSTN3MEdvMERRUjV4Y29KazhqdGFWU20v?=
 =?utf-8?B?aXF5WTlJVVhzejdSdVN3em1WZkxEVXFFRlRFMXl4Q2VwOFZlTWhjUFhPM3BB?=
 =?utf-8?B?aVpvOUd2TFUvNHV3Z3FrREdEdEh0bkMyQURhMThWQnhmYVdrbWh6NWptOWJw?=
 =?utf-8?B?MHB5K2lKRTVRTlZDK1JkOEl6K05nS3dXVkEvejd2ZVJkSUtuUnNlRzBBRlM0?=
 =?utf-8?B?YmZVQUluaHozc0RLYkRONnNVYXM5TEZKR2tCUlRHc3B5WFVTdVl3ZWx5WGg4?=
 =?utf-8?B?RzlScWRtZkNqTEM1b1NoS2NsQUNRKzlldDdpRUNEVEZIVm53SUZjcW9HRkx1?=
 =?utf-8?B?TFBkZ0tYNWtBQVcwcExubXo3NXJmb3I2SHR6QzRhcjZxL2NkYUYrTk9meUVm?=
 =?utf-8?B?NGVuOElJWGQ1eWZZN0hmNzdrNFVkemxHc0YwY210SHhpTkdZNVloRjltOUtZ?=
 =?utf-8?B?a21BdWNrL2cvMGxCbkdLOS9yek90dGZGMC9JemxtSXBVU0ZSQzVpZ3N1YzQz?=
 =?utf-8?B?YmFwMklJdGdqMW5mNGZnSVFNemsxSzI5QUtkNElDN3dqZzE2bUVQc01xL2la?=
 =?utf-8?B?bXF3cnI4WXRad01NV0JTanVoTjVLZDFFVmpCSFMyaExOL2JFTnVIaGxRcWt5?=
 =?utf-8?B?S0F6RnZzakpicXlrMmhhNjNhMjFXZHUzZ1Z0eC9TalRkYjA5SG8zenRYM250?=
 =?utf-8?B?dEpxSGp1bjdvbkU1R09ManJYWTdsdEpaVWl4Z3F1RDlKN2YwTFRZTWw5REZD?=
 =?utf-8?B?Y21OR1hqZi9CQW1odm9zTTBEaUluRjJLemh5SE1qS0c0dmNtNmF1OXlqUU4z?=
 =?utf-8?B?QUZQWGtWVUFsK2dvbG5jM3p4eHowR2VVUi9lL2V1amlpbStWK0I1N0QrNUty?=
 =?utf-8?B?bGNZOVl6TWZzbUtxSGN1cFQ2bS9tY3cwYndSNDByVWpxd3NqbitjMENRalk2?=
 =?utf-8?B?TjFDSW5xV1RGUjd6Ukc0eVF2cVcxd1ZmbE83K01XcGo2NlVWUVRDWWE2RFRQ?=
 =?utf-8?B?WlpQY3g2ZkZWN3dzdmV2VzAyV2N3ck4vVGZxamVvTXR6WEhJWmQxTjBuN1dn?=
 =?utf-8?Q?rTodx0QKCjd0/N0DkFCmxH8Wa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5390716-931e-46a8-e419-08dbce5a9d51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:14:38.5736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZViUvRM4dSdXYb1CirzHOn8zmyQrGV2bpNYIQsccT77o3MBHol6EEYk5iJCe/VKIOujuzLQB58EtFdWQyal3hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

On 03.10.2023 02:19, Henry Wang wrote:
>> On Oct 3, 2023, at 06:45, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Mon, 2 Oct 2023, Federico Serafini wrote:
>>> Add missing parameter names. No functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Same question here wrt applicability now that we're past RC3.

Jan

