Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B56E445538
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 15:21:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221566.383343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midcB-0005On-CE; Thu, 04 Nov 2021 14:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221566.383343; Thu, 04 Nov 2021 14:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1midcB-0005Mk-8G; Thu, 04 Nov 2021 14:21:15 +0000
Received: by outflank-mailman (input) for mailman id 221566;
 Thu, 04 Nov 2021 14:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6ik=PX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1midc9-0005MO-KO
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 14:21:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 756eef3c-3d7a-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 15:21:12 +0100 (CET)
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
X-Inumbo-ID: 756eef3c-3d7a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636035672;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=f113rqIlyAAMQik7LwxK38LWV7J5b2q3y57sY3EZHOc=;
  b=X5+MUfWHXs7eUxq0o5AqzhgBJkE5ZDFcyBK4/aaL5VnqJqLgakshOTJf
   SHbSWDjP+RhrczRS2lS7WZCyX+iTkvfP0bNJ1w+Qh0XvyvAxLJklcr0Af
   5ArP68dwwJLLo1Z++C187HC6HiFg565hamPFSG4ofT8dDr1TUgofCHLVh
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: btP4cNgu87rZpeILjyrlA/gpGzwyVIMKTg4Z0v5rH/h2gNu65dxmXEVQx2gIsj0/fBS1YopQBM
 E9hwc3xVLMUVHXo4+CS8Trf9z+g6w3wvOzFuJxYQbiaLT8U2pEHNaozWZ69zPhZbjq4IQ+kkqb
 A7RHMx0EMJX8S6eMfrBjX9sQ9SmkV7GtxjWDSQT5xxOFc6/u7xlC768gx/t0ch5S3bT0EwdKhl
 PFtDEfWlJDsFQ0DOJRg1BYeYm4UI6sooIZMU9fUcRQUUz/HnboI5qwvP46ZMBT42BcuNzC7xz2
 sr8nXrrhAQ6RQwHO4NkFxQrq
X-SBRS: 5.1
X-MesageID: 57105626
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lDvqlKsPq+QaAAGzBlX6SAG/UefnVIhZMUV32f8akzHdYApBsoF/q
 tZmKTuFafrYZmf0LY8iPN+1800EuZPSy4VqHlQ6r3s8RHtE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljcSrEyQVIbzwv6dGeDcEPQogI6xr9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258XRauAP
 ZRxhTxHMBb5OgJGHG8sV4M6h82jqV6vSGFFtwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYkA8EKMNEl+T2qifH/zVq3LTYaTxNOPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSfbt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5OORECnCBtJ6sybp1qHHb7
 BDofODEvYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmojdRk0ap9UI2e4C
 KM2he+3zMUDVJdNRfUmC79d9uxwlfSwfTgbfqmMBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WkPXWHr9VOdA9XRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:LPfxU6PhpP0Fo8BcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.87,209,1631592000"; 
   d="scan'208";a="57105626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8lsnT4xOzwnfCusm/f2ozuimFNoRWD3ndSs/rmZsEGqYF6z9LFPeJlxv9e6/Uco5Tg+1WvMPyoBGsH3uAPiLhqkUeSfnGLgmRGNciiRF1FhCkGxgOrSnHd/GlxlLdpBDibI5jDqoQ2WThB0LmjJKKcmoWmF7tcTclDGvZOGMuZnzk5Rfouqgbi9gtIZ7FCUYmr8Ig8Ja3k8CvVSS2uljMKUPs4sE7WFySh19wdfnbp1XKsJ78Kc38i2t1TUe8wHPImwnzQ3rbiXS/4S1cmE/Lym6Y2KZ5TiB17LfRGG0iX3mh7mVMSOjSVU51STwEUpclos/bw0qczI6SteE7tLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I470PyzyOWDbwozZat05vK0CLwjf8a8JYmNsm/kpx/I=;
 b=UdktcX2bIz5B1o8NECC1tg2h9sORR6pZLD33KfmMyL2ZVNduw+DAoOqjJAAjUnoJG95kHoY+YcUKvppzIy1xU8gUrlkDjb0QiHIu2diRDL3VvXMaN2c/ExydKe+LM0fDuG3L935wcQZ00KiqU1imV+tKdxBribEXDTmw0uByfcaHKLBpi0bKBkLb8KUSE8oIqBfyY8zZ4uMVLno0Cwiw3SnqIneV6QbnBcuJM84YglbG0G4RTdvt5qpnKR5E2+YjIsey/V6ciX/B4ZQJZGTN1/THGPxRqnaeigP/KAKytlLc6aYRIQQxOPGKaUXmMqNwuyMMPTPpPo5MaMNtUyxfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I470PyzyOWDbwozZat05vK0CLwjf8a8JYmNsm/kpx/I=;
 b=qHJVokOE6DbkRldU7nE7bTouuVvm4o+cDVfiK6exO0nY7JMTy2BTcO8hRqawuLJVzd66892uaOmbBHKLzyZskkbjy2vsvKmG2O8AwCef4uelumSf8mKZA7mn7RZtWV+bEgxZUoEBMhhoo1p3Om0Ss+g+erWq3efhVS6BMeW6KFA=
Date: Thu, 4 Nov 2021 15:21:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<ian.jackson@citrix.com>
Subject: Re: [PATCH][4.16] x86/x2APIC: defer probe until after IOMMU ACPI
 table parsing
Message-ID: <YYPsT7wp0aWZapHU@Air-de-Roger>
References: <47392789-2f10-9de7-036d-b2345a24a028@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47392789-2f10-9de7-036d-b2345a24a028@suse.com>
X-ClientProxiedBy: MR2P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d225185-a263-40f1-c34b-08d99f9e5783
X-MS-TrafficTypeDiagnostic: DM8PR03MB6216:
X-Microsoft-Antispam-PRVS: <DM8PR03MB62161E52DAD55683C500427E8F8D9@DM8PR03MB6216.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NB0aahffzl+rmqE1BH33jWhRI5mmjSWDdP3DK1VdPaYiORGfPzPzQJXZGnKlapT6BtVwqm/kXfxVCf4jhtql8aAf5BnThWFTazbWueeSA/3rRCXllf4RvL54ZdF5amrxqeFjUcJsFCHd7MUEyrSCJKBTadakvgt9M6fz5oE8FJ0HhOJe56Ez8ZZYcSrzGv8kewS/gsmOuTO6JvJul3gI4SHEDQdbz3bK3iRgw8Mn+9ImbpBrbJTgc+Azb1hUxdlRl2DDn4B7skmRegLMXyFa7AtoCDw6ZKzQYYh8S8tPPF8vUKbqszAzSNEDAly06LfKnPooH6zXNFrnRsweHwFE6M90Q9CYgDx6dC3WyxGlJZU6KgboV1BXaCVLk5pY+FbnkMiq95ASdL+ebsYOfMTdvrk4jHsE+0tVHSlxQD4E0XYcaW9szZmtJKXlD8G5gVU3l/Bhaqi0lnlWSDDX7uzhKsNrlYOssLuacf3SimBPaarT9Evgm9edkqVYAzucoaYEbEAekYEc0mIZuTnY+LD1adttw8VfhsTg4vlQkz84jnHesD1hIp3cNSCP/5pa4Ny9f41jsaZ0tAN4woULB7lwU5gLiodDKd7Zn1zx3+FMvnpk551KIOhDu3Fabq7hUfoJTlE/9mB1yrv0W0Wcq1iSUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(2906002)(66946007)(6486002)(508600001)(5660300002)(316002)(6666004)(107886003)(38100700002)(186003)(83380400001)(4744005)(956004)(26005)(66476007)(66556008)(8676002)(33716001)(6496006)(9686003)(4326008)(86362001)(6916009)(85182001)(54906003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2U5OVFvaTh4TkhCQ1ZwMGJ1ZFBLMUVJVXdRUEZXTm0yZTJZK0FqNEtCektN?=
 =?utf-8?B?YzBJWmVTQm0wVnlvUFQrc0E3WW5ycGtORnkza3hlQ3hpME9iTEE2ZzdsaXhp?=
 =?utf-8?B?UE5BSHlLcVNVY0hrbkp2NmdxOXdOQUxKb0xnQ0UydFE2T1Q0YTQ4T1FDNExp?=
 =?utf-8?B?RzFwc3BIeHVRVXIwY1Y2dzF2SVJjSEFyb0Q3NldvdG42cW10dHFmeXVtVjI4?=
 =?utf-8?B?L2dQamNmZHdiTHVHWXVaeWVTRWlGRGt3b00rUjFIL1hoQmpvdEhpUTZ4UW5J?=
 =?utf-8?B?c2QzTzVsWEFMbFRUOFNOSzVUbERIOEw1TEtKQnNvaUlpMUlLRkVxN1VmWUdZ?=
 =?utf-8?B?VUY1enY1dTlGdkFjWG9hMlBJRHl3eW8zeWNDUkxYSzNxZmc3R2NhUnVkSmFn?=
 =?utf-8?B?bm1IT256T09RY2syYXpGZVJ4ZUlzZVNYL1pld29STVhmNCtkc3hpZVFMcWJh?=
 =?utf-8?B?NnRURG9iejRrcXQxekhkWUg1T1RxOFZoVEJZQjMvRkFZVGNKeXhpTDRvT2xZ?=
 =?utf-8?B?ZWU0RTZ3cWRCeG9TVEFWU2JuM1lDcjNrWm9XakxISmRWVjFvVkQyM09jTTh6?=
 =?utf-8?B?aEFweDIrQ1dYSGhlY2wyclN6UXE5UXVJVmY4R0FheTZkQTMrOVpqeGl5NXRX?=
 =?utf-8?B?bnBSaisxNzAweGRaY3ZjQWtZQ1lVWEtuOFk3ekNFbHJxMjlkZmo3OThRTWJn?=
 =?utf-8?B?ZlZoWDVKUW9lT0lTd0lSUEZxRThtUnZNdm9QRzRRN3oyQjF3SGlHT3QzdTdr?=
 =?utf-8?B?ejdVRGtRSlJzZURXK3FmRFpiTENyeW5jc2h4V09tVXhTdkVWdXE1MHhZR0Fs?=
 =?utf-8?B?L3R6bFduZVRIYTJlbUZsSG91U1ZtdEN0U1lKTWxnNDVRN1doK3BOVHgwMUov?=
 =?utf-8?B?UGU5WjM4VDV4bnNYRUszYVZPR1ZMRERxWnVyMmFMK21jL055c2NtOXIzdGhv?=
 =?utf-8?B?Z1RLa2tKS293ZG53MXltbU1ydTQ3eTJxdS91Rm9wRnV6cUM4R3B2LzErU3M0?=
 =?utf-8?B?NW1YdXJyY0RzUGh0QXZudE9ZMDhzM3BDNEdyVTJKSWRFUXRYMmUyL2lLWm9i?=
 =?utf-8?B?d1M0ODhFMkhRZWlqOE0vOVB0eUV3RGxQOHhEaDVuWnBhZEFTUy8vNXhjQ2RH?=
 =?utf-8?B?K1o4SDlWUXZRY3RvT2ZWUW5HaCsyVUN3WGZqODk3a3Rma083d2hrMlh1dlRm?=
 =?utf-8?B?amY3MC9UdHdQUHJ0OS9kaDRCcTRWZkNHQzRKbTBkUlkrUUFSWWlHNmM1eGIw?=
 =?utf-8?B?UklKbTA4Q0FWTjRPZUxLVnpZWERkT0tzK2h1SWdtOS9BbFdIb0J2bTNkdjcr?=
 =?utf-8?B?Q25sVWowd1RTU25Ya1BXekppbG8wZVdLUWM0NXdwTDNLb2tqdWJTVjVLWHNS?=
 =?utf-8?B?U0tzMlFFU2lWYndkU1BGNzNyRmhJTHRZZXFVT2tDekpnSFphZTlkakkxOXFH?=
 =?utf-8?B?ZnFwcGJzaUsyMFVkdnVKMGtMYUQ1WGNTMkdnc1dOR01zTnlFcGFDWlR1a21D?=
 =?utf-8?B?WlB3SEZqWklkVk11ZEZPenBuMTRra0wyVFJseE93Wm5DUkZwYlU5OWM1TFFl?=
 =?utf-8?B?QU80VUxnQmRQWlVZazlhakREWXA3eUxtbmFWUkkyd3N1aks5L3RIWFV5WFZK?=
 =?utf-8?B?N0c3QXUzYXFHUmhteld2VjRzT1RNTjhRallIbnQvdUlWL3Y5ZldGNGp2ZThV?=
 =?utf-8?B?cC95TVVDZmNmRExhZk5Wb0FsU0p4QjhXeWgxK2hhb1NQQWpPcGtQQ0ViQXpX?=
 =?utf-8?B?cDZCTzVreDRwem9NcDA0Y1ZlSHZGWHNLRmxyemZjWDhMZXZDRk1CWldvbEpS?=
 =?utf-8?B?dk5sd1FDNVo2dGY5eEtleGk5K1FVRTFPSzgvRTNkbnpGNDFNNGNKaC9xa1ox?=
 =?utf-8?B?eWlMRlQyNENaaThpQ0x0aDZadXdCb2RvaitDM1ZiUU1wZ3Q0am1YeGxDWDNX?=
 =?utf-8?B?UTN1LzFKdmJ2d3FyMEIybXBSdjJtVXgvQ3ZuankvZWV3d2FoemdITXF0cnBC?=
 =?utf-8?B?cmtUeFRwZW5lYnd3Vk1sMjd2SUFDNk5JcExVOHhZUlpteFdXakRvQnZCbTND?=
 =?utf-8?B?RzhhbnhkV1hpcURPT3lHSlFDcWR6ODdJNDc4UXRWcHoxK2xPSWR1RkZmVGN6?=
 =?utf-8?B?QWRCZkcyVG9iVG5OTDl0TU94VlUreStTTkZQV1BYNk1CVHYraW5GeUV0WktQ?=
 =?utf-8?Q?yrF1ja7D9S06OpjWI+CUVx0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d225185-a263-40f1-c34b-08d99f9e5783
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 14:21:07.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXDP4UE/R3A7RJghJswdmEz0/5c+4eVw008a9btguPBj9BzTIO6uJaMV61q4jdtPRJVksgTZ8EWqguVTUCPTrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6216
X-OriginatorOrg: citrix.com

On Wed, Nov 03, 2021 at 03:40:55PM +0100, Jan Beulich wrote:
> While commit XXXXXXXXXXXX ("x86/IOMMU: mark IOMMU / intremap not in use
> when ACPI tables are missing") deals with apic_x2apic_probe() as called
> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
> affected: The call needs to occur after acpi_boot_init() (which is what
> calls acpi_iommu_init()), such that iommu_intremap getting disabled
> there can be properly taken into account by apic_x2apic_probe().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM. I cannot find any dependency between acpi_boot_init and having
initialized the apic.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

