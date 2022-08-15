Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D3592A02
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 09:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387056.623143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNU69-0008MY-Ne; Mon, 15 Aug 2022 07:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387056.623143; Mon, 15 Aug 2022 07:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNU69-0008K5-Kd; Mon, 15 Aug 2022 07:01:17 +0000
Received: by outflank-mailman (input) for mailman id 387056;
 Mon, 15 Aug 2022 07:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNU68-0008IU-6k
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 07:01:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60065.outbound.protection.outlook.com [40.107.6.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d60e33c-1c68-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 09:01:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4228.eurprd04.prod.outlook.com (2603:10a6:208:66::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 07:01:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:01:12 +0000
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
X-Inumbo-ID: 0d60e33c-1c68-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=at9Xd66gCaMnmC20yZYUbSomHU1HzQvccTLdJ2VLFMoj0dVYdH0eEIjgZzhgSnTEk58Aq84Z6ZUv3oyN0gKYFACPX0W1WbZgwukM+mmb2VYIMQR86INz8ZUndVvFPZU4sgLi+5C0CUAJB1MlGp8U7plrEacJpU3e/hBz2xdQ9E+wIwJsH9/0FljfbH0yfTKG7rqA8UQn8pZ3PiJA4eAFExCynnvgAneQEAQkbKRx1Lrpbol0RGRXo+4HlsPDc+OShNkWeSRL03eNWJ31aXvZoiq+4SDowHH7Z9ZWRJ35+bqPpZ8jklZFvg9GTiYKkV6XPPe/4buSNVoKH2tYXDB2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RxZ1qf8jJnsSrdbqn8FAJT2nGJ8q3HEcvgumOgc0TE=;
 b=bOc9xjmbuBGUOpfkUdO6BawxpOMz4S3nUCpgyGY55na7v0RZ3QiWqYth6icjE7KB+T5xHtIfAdCud93iDOAOp5gCEoVmSLHgcYQdjVv0aQ5xB7HaxLNzhxitmimUNe0PV4pRPai1LTR/zt6/MKluG/iARQITZKd0QgRJ1rE3x25HctBmet3mh4AvyD6eu9ryrVt+PZEIVTaOm0Z3z/gnHWKS3h+K7tc61aIDvkPmbo7d7IwOLiO5RgSLqu/KBuKB1eISkRJb55WoQDjoksijXyM6eMSTuNuKCdmx9WAsmo98qqwfms9RdBqGchScJaNzjN8SzlgD7FCkUJwuXzn9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RxZ1qf8jJnsSrdbqn8FAJT2nGJ8q3HEcvgumOgc0TE=;
 b=XKhhiLbrFyRhMLTdTnR5vib3G9bicLKFPk0PxLA1Ve3p7DuNsm7LYkpgPLndW+l45sYS25iirA1NAndvKUbP7vFJCvFFk6TwoM7lZgidNoiqt1YCirg2UI9BycqZubB6l9yUh+68RlOmxx1EpWK2uC64DzUhGH8W4ueZP+5ukKS6z2tpFDnvFfCNMRP+54qML8ifFb5RvypmrPtZyMl4/pphsQJfhCIkmJ7eNXhLz8YHL/hOXBKv6O2nZlCQqzaTTdfsYV5VnW+5ztB3j+7nEjQs6yNXAMVSrytcn3l+7OeoNjm8X9Wk6GAUHR7xioWYN6bXj9SnB10AmNd7Lv/ueg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7b84136-d9f7-0bfb-f998-5aebece60b5b@suse.com>
Date: Mon, 15 Aug 2022 09:01:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH v4 00/32] Toolstack build system improvement, toward
 non-recursive makefiles
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Nick Rosbrook <rosbrookn@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 David Scott <dave@recoil.org>, George Dunlap <george.dunlap@citrix.com>,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20220811164845.38083-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70cd8e37-14af-43fc-c889-08da7e8bf063
X-MS-TrafficTypeDiagnostic: AM0PR04MB4228:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5rM4YwcYhBbyQAUV2jK5VdPbXND8UWNe3JuX49fT5abUPxquT6XvmE1B3oygI0k1z8DKqgqfhoyruWLSsYUkwORMdM7pcrOSU399dZo5nthHgnvo/60C+gAGubd8LsXgsNP6MJFxoGBBqSg4nHS/yjAtcBbqoVWuE03GLUYDWXR8+46QUdxwUNFhhCbRWuoEja5kl3DfJuwTABD+lK4BwDYKF9378KedkGEATcyyHgzBKXnfZbD9lLRIUuzazpwlcPhVkbZGDqZAUPSuaeBL/PILrtdlSVwoxsNsKCtt8jWgExHdCObub/KSV5XJ52KtL0EZq/9wpmARL17HGEB9NoX51tE5KDJ+8rpLLCmRqe/yHfyDDmICoZ2/DXUVqEyEo9h2gsMGUe+s4zClQ7l1B4SmO7n2360CSrTawO2q2/HrU6HDKJ9zZ44reMlnDyipFctOfSKblaWssRBKaxQx8gkETP2Ayxt7xpNldXL84Mzi0iu+tJ0JvnPIinlpmHOga/gAlK6s4gWYtnrzljo0DodMm4tNBVuO6Qjbg9sBqp/2YNTqkWu8/M+xCGjyBO5u+wERRKGlIGXJdtSm3izMYAhmANlUQWQ6VwvMVbtuv7h7ltRPt+g8H3TvKvRH3iyfqwPZTVlsR8rR/qEEE4IMP6t18sY70zsi84aIaXfHGjy00Zt9+S8toQgjdnq4oRSAJ0IBUrcb14lWVgLTketgl3wvKFZBrwbtAyKNUTU+FTi1JxA7NY5pK6K4N0wz3yPj6AyJJZ8CPiXlSciP50XDroSBierZiUcnLpfXjJLyN6eZ2+e4YO6pIaEoDatsiMauaZbR1S5pQxVcqy678rK4yU3Yq+aGI+TFkcUNWeeBSS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(346002)(366004)(136003)(396003)(26005)(31696002)(86362001)(31686004)(36756003)(53546011)(6512007)(2616005)(186003)(6506007)(6486002)(54906003)(41300700001)(316002)(4326008)(966005)(8936002)(6916009)(7416002)(8676002)(4744005)(66476007)(478600001)(2906002)(66946007)(5660300002)(38100700002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Si9rdXUyalltNEVkVkgzNEkwWmFJTjladmt5VFJGSkc2d25hVDQxL3hMMFln?=
 =?utf-8?B?ZkdjL3ZQVlg0eVZQT3hERklYdkFONTFTUnROcEh4VnU0QkJqOVBkeG1kQUYy?=
 =?utf-8?B?TmJ2YUZ3ZjdYeGxydGo4VVJWcy8wMU5TQzFIZHhRMjhhODNsT2tvWEs5ZWFT?=
 =?utf-8?B?N0paZlJiT3BiSWJSa2xBQzFGYnJ3SWE2Y0ZnNnNjRi9HQWpVWituRWgrMDhI?=
 =?utf-8?B?Rnp2WUVCNng5ZVFqU3RYV2FXQ1lFakhDb0hZUTJIdG1GaUJyL1RoYThjUEJW?=
 =?utf-8?B?Rlg0UFZvTS84dDBxbjJSS0xxT1dnTXpNeWk1a1JFaTlDZ1ovZ1h0MzNHV3FQ?=
 =?utf-8?B?YTFFVnBuWVo5SHBockt1U1VzYlpxY2I5QTRIN0xVaTJCQUF4WHhsU2UyRkla?=
 =?utf-8?B?M0NWVHJkUUJXbEdVLzVBNFRIK2xuZDFoWk91ak9Rc1pleGxkYnlaMVBReEQv?=
 =?utf-8?B?cEpOUXZDSXFjZXdheXRMMWJhWlJ1WGFNc21PTkZWTGZ0YTdiNkw1eGYvQWts?=
 =?utf-8?B?TWIyd3BjekxKNFA4dUtFWHo2aFdYN3lTYkFoVzdHSE5nNlpTWVduS09sWEVu?=
 =?utf-8?B?YXdURS9UTmEvVzZvN2tXei9OL2pVWUtZQVZRVnRBempFckdXYjFNTE93bytB?=
 =?utf-8?B?cERhOGFwSWNTcjUwcUVBSVR6emdjWmZZYS9pejl1VERCYm84dmZFcWdvV0U1?=
 =?utf-8?B?RjNtV0MzZ3c0WGFSUTBXdlk2SG4zeUNUQjhxdk9kL3dUemZyYVVmK00yZUxt?=
 =?utf-8?B?RzRuV1JPUENQSXpIQnRJd2NEb3hNQ1FiaEVjNy9QWEJZbytsaHRKVTZ0U1Q0?=
 =?utf-8?B?SHdiazBxMUM3Vlg5ZXRpcnpjejgvMWd3Tmh0SXpFR2FpZFk5aWdMLzdjUDlN?=
 =?utf-8?B?L1pOTmhVenp3VkpSUHhGNTNFWjh1ODg5bXZGQTV2c0RzYi84TVJTYk1WcTdK?=
 =?utf-8?B?WkUwbk9tR0YzLy80NWplUUUrZktBRTBnelByR2FodUtxbmk3RGxzTURqWXlO?=
 =?utf-8?B?TTkxQmdqcXFidVVmSHVzeWp1NXVzRVRHNm1PUEhoQXptMFNQZllzL0g1MFU0?=
 =?utf-8?B?YWFzTEI3c21pUjhQRTM3T0ZVV08zZzhxTGJCbEtkQUtPWVpudUlrYjgwY20w?=
 =?utf-8?B?VGorOVZYbldpSDZHWno0N1p2RDdaSGdpUEFsV2JnMjhKekRWV0d0RWIvUGtB?=
 =?utf-8?B?b3pURGovKzZoUjIvcTl0YTVPRXZZYUVlMHk1NitPQTl0QlRVZE9pNnZnYlFI?=
 =?utf-8?B?RGljdkxDUFl3SER0MkhmVmdIUk1wQ21ibWJ0dTFOeFM3VVp2Z1VuSC9BODJW?=
 =?utf-8?B?dEVEb1BrQzdlU0dvS3BkM0VBbHdKT08reDRtb2ZJeWdWTjJHTjRaOGcxc1Jm?=
 =?utf-8?B?OW9hakVtK3FNdnFqZk8rcStqbG9ib2FvVCtiOWpLMWhVTCt2SzhTeWgrTm5Y?=
 =?utf-8?B?UEd4eEpIc1VRZ1FHQjZKUDMxUDdqSnlmT3B6N09Oc1A0YlNQZk5aaE50WlNX?=
 =?utf-8?B?YWlJZXNUWDlobjUzK2xDN2oreWdsOHpRanFRUHk3VnJWTUppUVRBRWdHdlhY?=
 =?utf-8?B?K2RDSDN3NFF2SjQvcXNweUZwZXdsRmJLTWlBbzYyZjFTaWorTmpuSmsraGYv?=
 =?utf-8?B?MERkbHNJdThzRTQwQ0t1cVlyZE10ZzJPS1drOGRycFNpUGIyM2U2VTFDaUl1?=
 =?utf-8?B?RUtEbDdlWW1TZklWVW00MGUzanBrbVptWmlQbnZpbTlFU05WNHRNaWFtUW1i?=
 =?utf-8?B?SGpXUHdjWFNETnpuSXE3TDZwOUp3TU9lQXZGeUlaUXdIRU9JRE9jVitOK2Fi?=
 =?utf-8?B?UnVPRmtzdFEwalJTQVZjTjAzcXlrc3RFQVNHcDI2cUxEZXNrSS9qN1pNTDN5?=
 =?utf-8?B?bURpNHhaUUNpQVhyb1lUMGR3d1d3RUhMRXBNVElUbDZoMmRuS3Z3VnJoNENh?=
 =?utf-8?B?cFBRWitSV21QM3RYNmJlYzJOdFd3M3pxSXV5MnlOVk96SUxwdThoU0RmU3lH?=
 =?utf-8?B?c1E2ZGRPTVZDTkZ2OE85UllWYXZpZTBWaFBjVGVrTUpNRjVWdldsT3JyVlNx?=
 =?utf-8?B?NytIVUlXV1dZcFdTa2FkWFI1QlRDL3NVeDA4dldZYW5ySnY3VlZhSy94RXRT?=
 =?utf-8?Q?MLlOUInVdd8QKeeaAXY4uHSNZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cd8e37-14af-43fc-c889-08da7e8bf063
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:01:12.6221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGYqfrdKABAM7FxocG/y1GM+mDf3nzKMkm38pbTsxwkhet8O0cut/TV1YQPvh+NlNetC18rdeL/NbnksR89IEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4228

On 11.08.2022 18:48, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.toolstack-build-system-v4
> 
> Changes in v4:
> - several new patches
> - some changes to other patches listed in their changelogs

I've committed a non-contiguous initial part of this series, omitting
patches where acks still look to be missing, and hence only up to a
point where I could be reasonably certain that the skipped patches
won't interact with later ones. If you can indicate which further
sufficiently reviewed/acked parts of the series are independent of
earlier parts which aren't fully ready yet, I'd be happy to throw in
more.

Jan

