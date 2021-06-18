Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255713AD0B6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144899.266647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHeC-0002TL-TY; Fri, 18 Jun 2021 16:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144899.266647; Fri, 18 Jun 2021 16:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHeC-0002Ps-Pw; Fri, 18 Jun 2021 16:47:12 +0000
Received: by outflank-mailman (input) for mailman id 144899;
 Fri, 18 Jun 2021 16:47:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luHeB-0002Pm-4H
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:47:11 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f25f7dc8-5f2e-4155-a273-54ca586610c5;
 Fri, 18 Jun 2021 16:47:10 +0000 (UTC)
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
X-Inumbo-ID: f25f7dc8-5f2e-4155-a273-54ca586610c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624034830;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E33zJeAK7v1x3UBrXwFB2f85AIq4cUvJGEhMawteysw=;
  b=VNpysAW/FEPZ6/yjG6aW8Tn0m41EryNQHJHqby62LCZ2jL+OI3iKndGe
   eQNhQr9hpHUxBKwR2YCZgJ7Ak6OhUU7Cd/TCcicG4eVDcuthFsmx0vouC
   g8P0pGVFn7JXJEfASIct4gRYHVDYBuPmsmDaQFXNmUb38w3+gBjXCQScs
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FJdM/tIGopib35+q0+P0aN6ruoX4mJahtzApeMdY9kWlzv4lzyKOmZrYcl5Ez+pGSCUiv7FSvY
 rQhXJNVVH+RiuqZm3HVToJohWTN6DlAXu/HJqXFzVuSatZpZGuLs9oRO5SIdeqp01EehHgZDlh
 /RCBPK5qIRQ572CozhaOWDLoSuRqDICbvKPR3/IrnHhvXGzSfc/kohwPJqzdWIPfOz7ShZrkW/
 yQ/D+WsDAiYtDV5lM3HO6piqxoRi/rjIm5avu5zSSKeXozjwkKLtTEeA9/O2dgPpaVOiPgTP/+
 izQ=
X-SBRS: 5.1
X-MesageID: 46463207
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dlERcaDA8GvYZ5nlHehIsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90dq7MA3hHPlOkPYs1NaZLXXbUQ6TTb2KgrGSuAEIdxeOj9K1kJ
 0QDpSWa+eAf2SS7/yKmDVQeuxIqLLsndHK9IWuu0uFDzsaDZ2Ihz0JeTpzeXcGITWua6BJcK
 Z0qvA33QZJLh8sH7SG7zQ+Lqb+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+WemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lYdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxwL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjzUC3abFuL4O5kLZvun+8SPw7bXvHAcEcYa
 pT5fjnlbJrmQjwVQGAgoEHq+bcK0jaHX+9MwU/U4KuomNrdN0Q9TpR+CUlpAZ3yHsKcegP2w
 31CNUeqFhwdL5eUUtcPpZMfSLlMB2DffrzWFjiamgPQ5t3Sk4l7aSHuokI2A==
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46463207"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1kcDOnTIClpo4oTObGMvLI54/ILQsqRYgN4ue9wja988/uQh/c2t1k71LvEddp1ddu9NoSaSofKtSwoxgGmpHl7vFhXa3GM4QFYMCkLdEXEKzZJdRKkcIa+zBNJxWBR7pJ2PWevnAiWbdnKQFPanWUSQq+dTT6HCJwXr2q0wubhVMM0z77zSZKyzT2KjG9Eokkz+S8lbhnZZbtdVHHXv1Je284oaURJsnm1s61H0T6ti/9DeY9OLdeD92ZReFbFSMp+rWoH9PvyZpdrY7pT8AzHu5o1bGs7KgWX6LiRgHXNiQhgeh3345vtm2o/flF+QvRLUUT8Ln701fRtuK1Fnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E33zJeAK7v1x3UBrXwFB2f85AIq4cUvJGEhMawteysw=;
 b=ib/y0NqJ6pRlDxYrBGhlAr2ns8Hof3hclnU66DYEW7d7e/TsEZyfgD8No52PrcBWHBYkJgkIooe7LojmyHMN5iWkkm3YFpp7ematzpKxc1/2BjB+0IvWiU2r6A1pOFwKMOaQl7PX5QnGOe9BWhU372hpZtNMVEO6JkknVHsO3LeefMoBTU1fQA1oyLPDdWuPNkvmxJtzTfH1LJ49Ax/4HDoUpECgtRqSs2zdNjEh2E7X0OUtXqBknszrddtX8RvvFYmtEA9VMw44felqAHTeGVBW7EFhfe6qPOdnZsHMQIZxWFhyAlsuRDK86XV+RxGB5iwn94Kw8yNMNz5s7itxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E33zJeAK7v1x3UBrXwFB2f85AIq4cUvJGEhMawteysw=;
 b=rbY2LLud+d6xeZbJtduVQZcF1Vd1QgbmNbcyW/GFSX4W3edM8JE8jgPN/+eDKOrG+IgVLbmkcd7h53O35ayppj9MCDtradqkG5MMO1HF763KHB4x7QqByFKRG9Nbc+8lhn9vjBQ+QRKTHs71EN6CQV7PLSgFtWMkY8enO1AmFTk=
Subject: Re: [PATCH v1] compiler.h: define CONFIG_GCC_VERSION
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210618164207.5111-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1a3b3a14-61e6-c805-78e4-4b1dbff322f3@citrix.com>
Date: Fri, 18 Jun 2021 17:46:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210618164207.5111-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd093300-3d26-426e-4a91-08d93278ae90
X-MS-TrafficTypeDiagnostic: BYAPR03MB4118:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB411811EC8F4F686B5928B8ABBA0D9@BYAPR03MB4118.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZArD90XeP3c3lkFwyF+7Y62HeY4SadOqPEHK/qZmqTXoqOhQp5Aj+3enG0iXJazlQzpFFDLaLoKxX/ckHmhRj05VKuxLt3gdp42FZ5G6XEMD0ypz1KZtV96a25DxnhGZr/5JbF3iZW9jmdDtTr81HRDnjwU6IiktoGz5bIpei9vdIlYlo+vpeHJMDF1J2fXZ4pKaaFYbsJ+DkOZiNN3MsUSwMByBRTYYfAxaOtRA04CkpAJg4ky4exmduV8ImuVvwpOGHy+1PcVmbE885jEqTgExL7jficpj35GX9nq6iWEwgeN5c4alWWaHHAvQr6S4tPPoHyAsyMpmwvFjsP35CCdXcKY29mHUi5gV/DnhOrBhA/5VEQbuQU3ZI0C08rk1bSggMEfg4+mvHgu37PtIpODja1cLZxV36F1U//ozM3AYM5saOVGxtJz8wpitsYqV0jB14g/tQJeU24/K5ETHc8ai0re5+Vkpp1DQVBVDxKPcbBgGesV8B5YDJlNmqW+UmhWIt0UFq0tqmQ1M0AyXT8HYwyGbO2SZbYVUolfnuychQ77jXhzKKrXOlq9XBsqOdMBiDbJ7o0eeDuyOJHCsaaWQg59WGbBnQfoSm7VluMI2ST66Tfi2evqdFWbP2gjgS20zrossfdpPcIlsU/rE4x/hOlN/Pns04jB8mlszKYOBisbml1y3D7G31qJEp/AK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(86362001)(6666004)(38100700002)(956004)(2616005)(478600001)(5660300002)(66556008)(31686004)(66946007)(26005)(53546011)(558084003)(186003)(66476007)(31696002)(6486002)(16576012)(316002)(54906003)(8936002)(8676002)(16526019)(4326008)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0ZpQXdha0FQNGU5d2czRjlXWnNqN25BUTJ5M3lCVk9INWVLRkJTU0krd2N0?=
 =?utf-8?B?bTZpZFhUZHpKU2hhT3U5aUcvUld1Y000QW94WVFxQm9MdVFReDZMa2gzNUcr?=
 =?utf-8?B?V2JLTnQ4RytsTnBmUmxxd2lzVG92QXRHaXNuMFRJSUxlZkZqMWJYb1l3Qlgr?=
 =?utf-8?B?Wk1sczBUTWF0VkNoM2Z1M3pkOUFIUlp2RDA0dFFRbDdWbS85Y1JFaG41bVVZ?=
 =?utf-8?B?d0xEcTdEd0NUQ2FmM0wvaEtPU2duTmxBMjA4V0NER2R3SjlCTXd5Sm5NU2Vq?=
 =?utf-8?B?QjMxQXR2ejhCSkwwTVR2eko4N1lNanNmVnByaS9lUGtFRG9BTEVTbjRHNTNJ?=
 =?utf-8?B?QktCVXQ3MDJjenVOeVovbXk0Y0JTVWVRYUFkQTF6SzFMRnR2Wi80WEhuVUc2?=
 =?utf-8?B?T0I5eGNFTWlHaVlQeU8wRHdLUVI1T3FGdlpxdDVxUGR6MXpmSTZnOVpzeHFt?=
 =?utf-8?B?ZGlCTDBmYjlVQndHNkE2Z0JzZ3FSbnJDcE1wUGFXS3YrS1lxejJBWFJwQ25E?=
 =?utf-8?B?bkQ2bVA5Yks4R3k3aThDSVdrZTE0cUttVVpJbW1uWG5LbEU1Y0dxQU43RmlS?=
 =?utf-8?B?UjdZM3JrdUVDNjRHOTRGUjNFaHBNOFl3K293OUJUVjRLbkxKVy9Dd3VpK2hI?=
 =?utf-8?B?OVk2L2I5aGo0WXlLcW1RVEVqTCt6N0lQclJoa0YraTRXZThPQ3BHaUtrelky?=
 =?utf-8?B?bmI1YlBhYzUrTStCcUsyNHBsZUVkQU9OT3hqdkxpcjREWEZjNXFjNmZoa2pP?=
 =?utf-8?B?aUtCYnNXdFVHNmd6TUVVTFRrZzBid2lhTUxpSUIreGhLQ2ozQmNDL0puR2xT?=
 =?utf-8?B?KzdrU2Ztb05SOG94ZnJ5TmVLY1dLU3ZtUzJQdmxvdW5weUNtZWpSUzY3RWRL?=
 =?utf-8?B?VlQ0MWkrRmkxeWpwQXlVQU8yVXN5ZTg4bkR3NlU4eEhVV2tKWmJuRlZTbTh1?=
 =?utf-8?B?dUhtcFAzaENOUk14cDRScjZCaWtiZTBjUWtpRXQyVE9Xd3lpbjI4a1FlK21i?=
 =?utf-8?B?bVF1ZnFJU0dTSy9xeFRFc0o1ZEFwRHJteWFrUEd5cmVPclBRQnJ1ZEs0M2Ja?=
 =?utf-8?B?K3E2aDlhMEg5SWdxTC84ZGZPd21kLzdCT3RVNy83ZGV3Y0RvZmY1RjNpWE45?=
 =?utf-8?B?TSttc3gybUM0dmVLOEsvSVpPRTFYVWVFeG5VNHpZWGpHdC9OVGVscFZ4RXlP?=
 =?utf-8?B?ZG1EZytpbjhhWDZvMzhCc1h4aGxwakR5NTIySml3Tk15TllTbE5vWk9lc0hC?=
 =?utf-8?B?U0V0YzR0TzBYcjMvNzNBQkNZMHFyamVzaGVVWkZwa2VveEhRWm4weFNZZFhu?=
 =?utf-8?B?QlNTVHdzZzRmSmV3TVdrVGU0OXFLcmlGS1V0Yk50aDA1V3hRTWFiMXVoTjFW?=
 =?utf-8?B?ZkdEa055UXo1cHVOY0t2SnNBbVhMcUJhaFRTSkl4N2dxNkZ4WWpoZ1hKTXdw?=
 =?utf-8?B?THA5MC9wanVoV2dBR1RSUUNHUjkzMFFNSExhVldEM1JwOEJxWXJ6Ukp6LzlX?=
 =?utf-8?B?OEtCSUljUHRkR0FNWXV0a0ZGclZZc1hLNlB3V2xNUXRlWDNiU3NqSlZhaXc5?=
 =?utf-8?B?RUpvV2ZxQlNUaURPd2JiV0RlTkhFT2xCVDJqRmx3aXk1bGpvOHVLVmVUKzh6?=
 =?utf-8?B?T1BWa2JUdzZBbm9OVnUrdkRMVkhTZk1XQTVMcjRwOFNOLzNHTDlHQWhpRnE2?=
 =?utf-8?B?MExmeXAzVUtIZU1PTjlRZ1AwTURsNDc0cnBEY004SzlsQ2p5R05TdEhFNG80?=
 =?utf-8?Q?oSbR0X25V40TUrPUlVVNQD+ugC3IR/J3a72hzy5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd093300-3d26-426e-4a91-08d93278ae90
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 16:46:55.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: it/oGcWuJjEUsmVXM2ojjiMPY6pgf4Gp9lK6Y/TVP6AwHFbxu2Zy/JWyMfS5FGrQ/ZAIx+PaACUAQBhuVr/byLvkrUsqEBb/g8SnWWZva/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4118
X-OriginatorOrg: citrix.com

On 18/06/2021 17:42, Olaf Hering wrote:
> Fixes commit fa5afbbc20ef3577c5338f9d0b24dad45cef59cd,
> due to lack of commit 534519f0514f52007d504e0f2eeb714de7b2468d.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Presumably you're intending this for Xen 4.13 and older?

~Andrew

