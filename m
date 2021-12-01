Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EE6464991
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 09:23:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235656.408780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKtk-0003fR-2m; Wed, 01 Dec 2021 08:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235656.408780; Wed, 01 Dec 2021 08:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKtj-0003dH-VV; Wed, 01 Dec 2021 08:23:27 +0000
Received: by outflank-mailman (input) for mailman id 235656;
 Wed, 01 Dec 2021 08:23:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msKtj-0003dB-0m
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 08:23:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f47d3d30-527f-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 09:23:26 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-caIcR8-4MpeZv2Diak0fJw-1; Wed, 01 Dec 2021 09:23:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 08:23:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 08:23:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:20b:48b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Wed, 1 Dec 2021 08:23:22 +0000
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
X-Inumbo-ID: f47d3d30-527f-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638347005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8WoZLuvw6Be1Wvo2zfIpdJ59RRLJlaWGE7mfQefSdU=;
	b=bGzDX8FdocHYb0x4NSdE04fXwbmXXHvnZHcEzcC633Qc7NWu/4iX7RBOoyt7mKOx59h6Iu
	/Jr2cObSuGvZUamKzskANA6Qh5yO/5+U7qZWeiHuc/92mvXYKRY3WSOwHe+UIxqAgVbvn9
	M1fEuZjIOqy1SIpr+62g7XWq1mLyzy0=
X-MC-Unique: caIcR8-4MpeZv2Diak0fJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiEsWaSLxqwcgDx79wP+621u3jlXCGyMo3hTbVlGSzG4JbEfo1LkWG4G5XOYiEbAZqsx8i41nOX2q0OxS+ZD7hB77N3uI7pYQEh/glZQRMS1qbdAVdvOVKFQUBHe0P6o9D43ojIDIkSg6YCeG0xzkw7rlT9h3phI3+3BYNHMxDycTAGZi+ydguE9a9JqmoDEo+1D3Ll9Ok8A7LM/dLvE7e+uVvIVGwSvPkonhv2r/aw6oippERolRfYxX0+g1051Im/PqMlFmTXJRmzzFr68/A+nZtEOHL92z3T4CQUebw8j6j0hia7Ul+ZBmwaFZ0xC+z5Ge982dNko8Ah3KCJz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8WoZLuvw6Be1Wvo2zfIpdJ59RRLJlaWGE7mfQefSdU=;
 b=TPt89Fp2Y8cEx5SYA7PzN2vAMDUx6YHGBgWnpd6F+NwOexob0M42ktvpjn/p0rTBWe2HPi1Kli3kUrqWymhPUWJjYavFiSVoXMiY7ghlmQthg5RV7VH7kloz9iAjvzj1WP3kIOm20p+ST8sF2tCT/PmVYZtnNdlUGy6RLsDBiRiX8kyG8g0seOpaUnEAzTxutc1h7LgO62nFjIZltgDO4p8POTXiXHH0C4s6N+kiBf39ZBF3GqKmFs6O55FdAFHGD+z0QLOiLYtIK/PeaIz2bKrCD80UUkwuzN/TyAMAwKVa0DAlhMUsUuusH5htEng/xbgF6ypJmX6mch1K7TF81A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8943376d-b6cc-6c04-c4aa-c8d30800dfca@suse.com>
Date: Wed, 1 Dec 2021 09:23:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 4/4] x86/ucode: Use altcall, and __initdata_cf_clobber
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
 <20211126212258.7550-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126212258.7550-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0074.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a2b6d76-fa33-41a0-7907-08d9b4a3d722
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33909C6DDA994E65D2470D26B3689@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q/7Inb0MsGwvbD2RWsA0Krse9WiFFE3INspXvtAC7CPFn42hFf5RHklZu3HDOnXkJOUhhrI43QXv1pG/wF8HreXeCuAEJLlHR/MFb+LcojAv+o3UBnNMPRSMl0ZMpB/yRSOxP15CeZmREA1DPNajSviwCltDuEwRIBn9Qymfk2Z8ulbHklCJ6OJCG+1A+fnUZtyes4wIO/zewz4SGtTxoVdxUd9DuvYS+76YeRYJxMSuJtNZ11zCGoY8ROgssBusMfQ7Ys7No60URp6k2rbIVZ+I0f+vpgl+N/ied89O9SVZ8CzCm4eo4SnZHjYTUJChg5/hSaCj0Y8oUQp4jqRldro0NynrBMDN5rGL0aEr4rSfHD/KWnQf4Mg/7nbBwDptrOq5oV0tZgn+Th0ny7T3Z7AyjnIS/bOwcqNf24Rsh5fvUzJVfMGAcDEAJh7/6fc5UnygkmL9HD9Ykvva8AI3JkuNtqbJY98UpM+y6kCZTmu3jVsZODj5xeJDqjlhUdMgYzu6sWdKW1xRS4q//f4rCXbzal6GtXA54KepsTjGWRXc+ErjUO5FGMsQ1sinKVTuRHWHlGOZERva5uEf+a/BhpCSBKXA38JW+Xnlh9njKYMyYmYmevz0NXxqCtiCegMzNPIQnmDODmFQHrVBhg3pdSHDuWgFLRfV85ArMto4Te1GBpNKxohIVScxvjp2xmUx5M9GlOm8Sehv4Al+/EqKbY+LQB7XP2d0qMGA8Uf9KEA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(8676002)(26005)(31686004)(186003)(53546011)(86362001)(5660300002)(4744005)(2616005)(956004)(2906002)(31696002)(4326008)(66556008)(66946007)(38100700002)(36756003)(66476007)(508600001)(6486002)(83380400001)(316002)(16576012)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXZpLzFIV1RoUnMxTWM0dTJORFFONFZZeEFTRG1JTFQzajNvVEZRVnVnZDNp?=
 =?utf-8?B?azVjNkJpYjRMV2RwdXNnOHpnZ2JRK3dBdUZIOE9EdUdRZWNMK0UyUXpMaFE3?=
 =?utf-8?B?dXZTL29JUDVWbGpjOWoyUGN0dUZWZ3JMemtWUUJpNTlyMzMxL1VINDVXOUk5?=
 =?utf-8?B?SCtnVFJCY1JNaFhNWHNjL3JyVGRRVTdXTDZjRGEvU1pGV3lVY2NsR042cTlI?=
 =?utf-8?B?ZVZHV0RPU1BTK2I1RVdvcmowV0RkQXVBV2RnMFRHc1I5N3hnSk54VTZWN3ZP?=
 =?utf-8?B?SzZLMURpc05qNldETGF6T2tWSnU5d0d2cW5Wby91MXlNUkNndjdnMnZTWmIr?=
 =?utf-8?B?S0JNTDdRaVJVV2Y2MUJ3QlRyWEtZbzh4M0pZc1Y4SktEbEdJRVNNanBIYnpn?=
 =?utf-8?B?Z3lvekZkVSt2b2k1bDNDckNoeWd4aTlYbThuVk05VlJrZDlrcG9OMGh0Ukgw?=
 =?utf-8?B?cmpyZDJHcXFJUHpRdXRaUE96NHU0M2J0V2ZkU3owYVBpUFhLSGtnelJhQXJ5?=
 =?utf-8?B?eVhjWXBjdktHTXhpd1Y5ZUF6Vmx4Y20xOUp0bmN4blBqTzhEaFRrTzVZYmlV?=
 =?utf-8?B?bnhHdmtNUHBYMGM5Wjd2c0x3dFdBaTc2eU5TS1I1YkMyOW5TREp2cU5WQUdC?=
 =?utf-8?B?VVE0emM4OEE1KzhERFh4bWY1T2NpNzlWdndrYWxxdDlseTNxR0VsMXFPUVpx?=
 =?utf-8?B?c3gyNGQyZGwvdTFJMlFkdm1RYzhrdjBqQXJPUHFhQzRtU2JpbWhlUTkzdUJL?=
 =?utf-8?B?MTluZk5ORUoza0tRQ3dlbXhxUGY5RFNaT3FDTmN2ZmgrRWdzYUFaWXlTdlEy?=
 =?utf-8?B?VTdRTzU1VkZxN01FWmJ2T2czdEhDZ1NROU14cnIyVDl0TVZMY0JZVERsaFJB?=
 =?utf-8?B?c0RZT25ibjFtZC9oZHd0ekRTYk55Wi90Q2kyV3JNUlAvZ295MTFGeGhDc3hN?=
 =?utf-8?B?eVdPeWxVRTVBd1ZUWGNuZ2RpUGJ3Z0lGRU5xMDVQcVk1YlNlT2x6WFJIc05H?=
 =?utf-8?B?V281SWZiYkx0dU0xRW9IN0tnZUZDWWw2UWs3TjdIbTJvQmtaOEc1RytRcUEy?=
 =?utf-8?B?aHpFcTZGd04xVlhOYnJyRktkOXV4UnhTSmw2dlJ0STZDNkYxczRSVnlDbEJE?=
 =?utf-8?B?NUJQS0ZSR3hTcloyYkw5NUx2WnJEYTltVzI4S0RZcUM4SEtlZDBLQ2lKeXo5?=
 =?utf-8?B?V0Z6d3lMeFc2dHd0KzFJbFVENzBOME5PdUozTytiamM4Z2dyckFjZzAvRkZI?=
 =?utf-8?B?MlY3NmlTMEVzZVAyajlxUVptdGFwcnQxUmFUdEQ2RHcyd1NoMkNiSjk3d3JS?=
 =?utf-8?B?SkpMZ0o2SElPU09iZVRZM3ZUZzlJcEMwWnkwNnVOcGRLTWZDb0g4Ui9ZWlZQ?=
 =?utf-8?B?NzRVaFQyVmdVYnpyN25LQW1uWnBnV3ZhcEVaTU1Jd3Urb2JLZlRJKzgyYnZD?=
 =?utf-8?B?MnA5c2lmeE5MRXB0UThJY25NOE1wOU1FaUtYVitObzEyMDVGZ1VjTnVVY3NT?=
 =?utf-8?B?V1gwUDFWNWNUU01XcU0xb3N3cjNITnlKaVBFSHh0bFE5OUF4THpaajdXN2hs?=
 =?utf-8?B?RTRKdmJYc3BvRmRxbzVSWEJtZHVjbUF0Tm1kNE1zR012c2dTam9ZdVV3bjZ5?=
 =?utf-8?B?b25CaHBSZERPZmdsUmVlRXZvaFlteWlqUlc4NUNRS0JpYkZGa2xIUHJNeGEx?=
 =?utf-8?B?ZXFEZXZDSlh3RUtpeUUrY1gyNUY5OTVQZERXVGsvVmdjL2o3RnhJbXA3Qmdk?=
 =?utf-8?B?UTRka0RMbk9NS2Juc1lnKzk2V2tHL3NjY1BKTS93MVRXNXgvR1dlSk9wSCts?=
 =?utf-8?B?U1JmKzVLMTBpQUZTdFZRUnhPOUpZVkFNZWREWER2Y0RJLzJmY2VKckVPUFBY?=
 =?utf-8?B?VVRIMHBGSk1hYVUvY2NTdEt3WURhU3pHeitKWFpsNG1qbzN0RjNZT0JnaGIv?=
 =?utf-8?B?MTUrdnd0cWk3RnBuNDhFaC9wUGpGL3l0em0xYTJGVUlod3NmdjhEa28vY3Rl?=
 =?utf-8?B?dG41L2VQOEFOUy9qYnFzQWdUNHpDMGZqWm1CS2ZYcHFLSE53KytkbFRBMDN2?=
 =?utf-8?B?aHRVTzZ3bG1HWFR2eW43ejBCLzhlSXhDM3B4Q01oNTk5NE1hWmZ1c2ViRjBJ?=
 =?utf-8?B?b296TlZLUFJVeHF1QnViQXJjV05VSVBWWnpybzdvdDdGczVmNlVXQmwzeG5G?=
 =?utf-8?Q?VHx0+8ICPW1aA01j0ewS6bY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2b6d76-fa33-41a0-7907-08d9b4a3d722
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 08:23:23.3354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsxczpBU/wO6mFH5W/59l+vyl3foVd38qYI9Xq06CZ1Cwdx4hpNTH99ePWisYsVanYuHjXhiuPguQenCN+ujug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

On 26.11.2021 22:22, Andrew Cooper wrote:
> Microcode loading is not a fastpath, but there are control flow security
> benefits from using altcall()'s hardening side effect.
> 
> Convert the existing microcode_ops pointer into a __read_mostly structure, and
> move {amd,intel}_ucode_ops into __initdata_cf_clobber.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Again subject to the resolution of the const aspect and perhaps
with __read_mostly converted to __ro_after_init (assuming its
introduction goes in first)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


