Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7352616B09
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 18:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436030.690060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqHhQ-0000mj-Ri; Wed, 02 Nov 2022 17:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436030.690060; Wed, 02 Nov 2022 17:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqHhQ-0000k8-Oy; Wed, 02 Nov 2022 17:38:48 +0000
Received: by outflank-mailman (input) for mailman id 436030;
 Wed, 02 Nov 2022 17:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtA/=3C=citrix.com=prvs=29817f2b6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqHhO-0000k2-4E
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 17:38:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30d6c773-5ad5-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 18:38:43 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 13:38:39 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6503.namprd03.prod.outlook.com (2603:10b6:a03:38f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 2 Nov
 2022 17:38:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%5]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 17:38:36 +0000
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
X-Inumbo-ID: 30d6c773-5ad5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667410723;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UoTm6DEXNkoE2YHUgbnwgkIb+BKmSM6XeX2yqM43D4s=;
  b=SNppScUXIDznmYX1Nym7hV6dnFEjMPeAMKwlyUBZyutQSBHJSuIeC6dS
   bf0NpIfBqWk130WiXwLc6J1+X/yJA8UxA3KG4KmjCXQVg8VTNRM1J26Lx
   5SS+Tin5sq0X4Kozmp3hUvHlBZs5EFtEIc/Wh+XfxLbLEYoZItPv26FDp
   o=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 84461793
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0959xqkVK5Fs/ecca0ZVJqTo5gxaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOX2uBaK2MYzH8e9wibdngp0JS6MWHy9RjGQU5pC09FiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7amaVA8w5ARkP6kS5AWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 acicRAXZ0C+vMuZx5ucbflzt5gFdMa+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea9WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzX+nBttNRebQGvhCnF+36C8/FAIvSnSV8Oe+p3awcPdjJ
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml6qfS+RffOWECQRZIctlgv8gzLRQoy
 1uIktXBFTFp9rqPRhq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbkRbnXttlVqmvgbXdCTz2h
 jyHsiU6r7ESltIQkbW2+0jdhDChrYSPSRQ6jjg7RUqg5wJ9IYSjN4qh7AGC6e4addjJCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:hRBrMK8+gBEiuwUEBqBuk+E9db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 2hz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlGl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFfJccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiT7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri+knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYd099RrBmc8a+d
 RVfY/hDK48SyLaU5mZhBgl/DWUZAV+Iv/cKXJy+vB80FBt7QNEJgUjtY8id0w7heMAoql/lp
 v525tT5c9zp+8tHNdA7bQ6ML+KI12IZy7wG0SvBnmiPJ07Ghv22u7KCfMOlamXRKA=
X-IronPort-AV: E=Sophos;i="5.95,234,1661832000"; 
   d="scan'208";a="84461793"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFaroxxkxmuJEmWMPJtgcl+gj6NHN3F8q7qhe52VoVkgZraB1rLgFhdCwfgtt0NbHXzPW0aYCoXtFED5gUzAHl7V1/NugeYCt6PzGfhr5CIemZX9FuzusijP5z6k0tTIA3D8ubNpVT48UtLDvcXgOkSpQCbxR/8/0aNhhr65NLReSXFY4/oE6GVrEZfgd8BhbnBlrEr1jM3zY0C3P0G5vcwyTlhRj/6XNGQYuvgoxgmUvSzJkWCl7L/hZ2OomcI++ExSy1ytiYgq4czFTZKIyjoCfcScTUMClhoC2l5XeM815gVZLlNisXMkfbNO8MaVTpOncOXpeBkQAREegcbC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o673HJgWK3W6ndtl/OoP3kyH7UmSQIw08cj5zAN14ww=;
 b=lYzsNlY7+H56pmFyjNH4nc35aOVcdMPGRdrmdOlB9FBbypYejI0YNxpWWgGZjd4fqY0MPhpsvGteyf7mfVIpsFNy5z4O8j6wcxno4QH7SpzIitPlSZbEeCV45myQ5h4dH7q/ByGU52S4mjvBC0fJILkBimkWJyWvsbAD3gLLTdzUTjhdu9NNtA3e97ndyYicSQM7spWN/xkHliqIYS/yjZALdImsH07QK1yH6EeKhJj+NQ43jOIq6VkEaasXklO1rWXm75SUfmZx/8HfVRJY7Yjuxs/Spq95f7QmnCNt9RMFill9xfOtI9L5VS/UrYWQpLYzfGTUBQRVvtd0sFp9QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o673HJgWK3W6ndtl/OoP3kyH7UmSQIw08cj5zAN14ww=;
 b=ZTlD/qmyGn6dsrR+F/OR+vWdy3nOb1YoNetMVAbnQxZN219r9rqvJG+dSJZUTF6uVl8V0jewFQRm+T8TB62SXR7tr5Tvq1IieqalG7pdJxR2s4ZTwaBIWrYRZ+teNErVWrjEQLYDwh809dZb9CoZBWu6X3hsyY23NZazmBVN1ZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 2 Nov 2022 18:38:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 v2.1 2/3] amd/virt_ssbd: set SSBD at vCPU
 context switch
Message-ID: <Y2KrF+0ns174JC7S@Air-de-Roger>
References: <20221028114913.88921-3-roger.pau@citrix.com>
 <20221029131258.95811-1-roger.pau@citrix.com>
 <198d04be-e7f2-dc11-18b7-ef3352d07b80@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <198d04be-e7f2-dc11-18b7-ef3352d07b80@suse.com>
X-ClientProxiedBy: LO6P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6503:EE_
X-MS-Office365-Filtering-Correlation-Id: d628de93-a669-4cba-3191-08dabcf911b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fw3kl12kbHZkLPqXvWaSX6nFTSqeYgDpuRrgoNSbNc7q/zQ5e+WOv/kRCb8/1PLcbGqP4eVODUl5UVdlWmCI/HRtsnrQn7tExWe40fZxnf8BpDrbJZW0GmmdrlprZHqQCiiUgmzhsFclwcY1S0I2y+FXSr8hQR/kvD/jfa/trfX/j1mjQGPh9v1bviGZObxs3ZQS/EZIUKF055WJZFoLo8bhfSdZTRJ+67DNPyqULUkZKlqgC00m6tFkS9LhRgSEMCIrzjh8g/2AI8VQy1A3R3ViwVxo+XiaTYgvaNHzFnOBkwqL1I7K3CX4cgZjJjpTVuNl6xz9v6YZwkysEgUsRcUtlzPs8xX3rPC+oZpAG4rQgEq42tlTphHFWftyssEtLp5yovfZgN7CVO5+YZHCKCzhVbn5JGMjPRu//G0yJ7snMo9kM8eMSOOgQhNjBIMJsz4FlGjVKQxOwhBMnc0jhupn/L6ghDw7u4KEwfp2FLlq4YEiyNPwcyliTZh3xK8Cnfy+eZiskgODiSDiwXs4jxaUJqLw2MhdkEOL0JJvaBLHyt1pgdf5SRJyZ9Z1jt3pbN6YlVr1WwkqccRC64ch73sqdAW9ddACzboBsheIwzujtq9buTX8NXCkoTeaNfq0w2cE+6PGk8sQeV0BkCoHjtgXH9AczN0SS7KyJoMb8p7E/xecSJtXwPpEg2R1kAblRqi3c8DToJGaWvxl8liOIxdTmnqEDWXeJgVTpvUy/qqW6yuS04g2dML0zbuQEqrT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(6916009)(8936002)(54906003)(5660300002)(85182001)(4326008)(8676002)(66946007)(86362001)(41300700001)(26005)(6512007)(9686003)(66476007)(6506007)(66556008)(53546011)(316002)(186003)(33716001)(82960400001)(38100700002)(478600001)(6486002)(6666004)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODdoS1JvQmZNRmdTVUplTk82VURmNm9xOGpObS9MOHZXbHFEQWJGQStneDZP?=
 =?utf-8?B?YTNPZk5QV3ZVMVY5OEVCaUhBeEViRDdnTWZscnVvMmdCbGc4ZkJUZnVDK000?=
 =?utf-8?B?Ui9pWC8zU2duOXk0a2ZEd2l2VGh4WWZHTlUza0J0OU1vSU5ETGY0M0JwM2M0?=
 =?utf-8?B?ZVJDVzhqQ3ErUUZUR1BnUGpsTThPcFRlT0NBUnF4YnQvbFloblZjMU4zbXhv?=
 =?utf-8?B?anNKcDdNTkZ0Z09tYzhHaGxuNmhNejNyQUw0Y1hNam5mV2FnbDJ1ZWtGejEw?=
 =?utf-8?B?c3dMWnM0aW05NldodllnMkhJRlJYbEFDN2NXWWhvZ05JYzJaTHR3aTk5Sm54?=
 =?utf-8?B?NEdCN2tRUzhTV1B3Q0ZCLzJBakdZSDBsSmpDZ0h1MXJOWGNvVkdIbkd6Y1A5?=
 =?utf-8?B?Q0tveDBJbHF0RVlNcW15bjhiNW5FTmdLb1hMZGk5ZDZHVHEwWnNoeWl5Vm1Z?=
 =?utf-8?B?d3QwM2ZGVFJHVmFYM0svQWtDTU1CbVlmakpwVEhQQWF1NWt6dEkxZ0VmeHcz?=
 =?utf-8?B?Y3BKNWVkWE9GeGw2bWk2WWU2dXVzYUpmNTkyK2RrVFNMNkg2bE5GY3RNTXJ0?=
 =?utf-8?B?U1JLVmM4alAxUFVSNDMvVUt4UGc5aXcvNUYwY29Va2RKMmtCUVNRSk5JZlVm?=
 =?utf-8?B?c0ZJTm1vUlpKR0NoM0NTMUlJU21FTklyNGNjWDRlZDFheVN4eXRvempjNU5z?=
 =?utf-8?B?TFRoQ1lnSDlMcFlkNzg4TG9TWDBGd01QMU53SDRRM1BUNHR6NmpKV0J5cGVz?=
 =?utf-8?B?V1pZNXcxdDF4Sm50ZEVNWmVhSzc5b3JDell6amJvMGlPK3BhcE82VTVHU21z?=
 =?utf-8?B?L3NNR3g1MHl2TGlIY1c2K01OR2tnSFNLMUNSbUpRcWVFUGRwZkRJYXNEdDVk?=
 =?utf-8?B?MFFvL3Z2RXkzRVF6WmlkUHFZb0ZvVEVVM2hqTnJ6Nk5nM1VDQ2wvaiswWXBG?=
 =?utf-8?B?WnpqV0tuOXdaUmFzZFBlYktPcEtZS1ZscHFZL3hYK0l3UUo1ZlJRTStjWDIw?=
 =?utf-8?B?a2plNVMvbTdaR2RGNVNhZk5ySWJmZExkU054cDZ3aUpzQ0d0ajViQWcybjVM?=
 =?utf-8?B?Tm5BVFRzOVo2cStQUmNzZElSckxKL1V5cHRYMVpia2xhTzQzQ2lkZkdLZFNm?=
 =?utf-8?B?c1VNSmg2cElrbXBBTU5lUnBYUjllNkJ2VW5YVit5aCsyNFcyemdRN3ZIbUI0?=
 =?utf-8?B?UHZpcVBTdjlVcTI0bkJXVHkxVWQ1RFRjWWVhRThOWXE1aTgzU1BuWWdrWWZG?=
 =?utf-8?B?OFYvYnFCTVZhNDVjR0YzRDF1cmY0L3JEcVEwbWFGUG53YmJGWjR6YlByZ1RI?=
 =?utf-8?B?NVhUeWFWSHNvUEVSOGFpK0h6NnpSZ1NjUVd1eUFoZ1g0ZlhOVzNpLzdhS0Rn?=
 =?utf-8?B?ZXFaQzdWMHB2SzNmelAvaC9jZmtpY2lDNUtOWjFZV251T2ZzQjZjQ29HZUdO?=
 =?utf-8?B?amxSdWs4cTkydDhJaktscGNnZTZoNExsZ01DeFlCV3VUeHp6RXdSZ0d0WkVi?=
 =?utf-8?B?UDFiM0YrS2FXQUpwdm9sTTZ0ZDY1MXpKYkIxTTc1ZW5qdi9TcVJ5dUJ6cFJY?=
 =?utf-8?B?YzcrSE94YmU3aElqMy9GM2tnZXMzRXExTmhhT3R6WjFUbHBRcGVmZm8xQi9M?=
 =?utf-8?B?bUdIcjFUK1A5bnU3c1FxY3Jac29zeG1rNjBLMVJxVm9VOW9HMkFSV2xyajJn?=
 =?utf-8?B?NDN2MlFUSS9WbDJCdmNhQUhzZExrNVAvOFh2UkdPWktGcjRkSmpNVVZyS3JN?=
 =?utf-8?B?a2NUSkIyNFp2d1dwN3crU2hZRVdIM3hXVTgxaXlWQnA4MDh3NllKOThHZ2pJ?=
 =?utf-8?B?NUpxNmJ1djhyQVlxWGsrVCt4YWFQeFJJSnN2KzBCQUh3dGQxQXZxYXp5ZS9D?=
 =?utf-8?B?UkRJZGxYczVSY1lOSkZGNlVQclBZWHhHS0VGaUZBMkFGZlc5RVpWbks0ZFRm?=
 =?utf-8?B?Q1o2UmI1OHl0V0ZienpNMU9yQ29Jdi9JWDhXY2NKTzQvSmRYYlYzSkN6TUVK?=
 =?utf-8?B?TE9IWlh3WmJTbUV5TTRTOVMxdEhWcXJRM2FNam9wT2prWDdtdS93dVF6bjZG?=
 =?utf-8?B?cGdxRXJFRDlIdlJOSE1VRFVpU1dVWlJranpqZTdIOXEwbUdLQnBSUG83dnRN?=
 =?utf-8?Q?5erlTjDB9VZWnIdG9UjRKpKsd?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d628de93-a669-4cba-3191-08dabcf911b1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 17:38:36.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqJmpSCryYJKB2Bp5TgxEnAzOcYQA5vhZAJRyUWvyGSwPTCxc7Ghcn17SEkZHx1xPhFUBo62NEXynz+sODhVbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6503

On Wed, Nov 02, 2022 at 12:49:17PM +0100, Jan Beulich wrote:
> On 29.10.2022 15:12, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
> >  
> >      /* Resume use of ISTs now that the host TR is reinstated. */
> >      enable_each_ist(idt_tables[cpu]);
> > +
> > +    /*
> > +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
> > +     * is already cleared by svm_vmexit_spec_ctrl.
> > +     */
> > +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> > +    {
> > +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> > +        amd_set_ssbd(false);
> > +    }
> >  }
> 
> Aren't you potentially turning off SSBD here just to ...
> 
> > @@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
> >  
> >      if ( cpu_has_msr_tsc_aux )
> >          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> > +
> > +    /* Load SSBD if set by the guest. */
> > +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> > +    {
> > +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> > +        amd_set_ssbd(true);
> > +    }
> >  }
> 
> ... turn it on here again? IOW wouldn't switching better be isolated to
> just svm_ctxt_switch_to(), doing nothing if already in the intended mode?

What if we switch from a HVM vCPU into a PV one?  AFAICT then
svm_ctxt_switch_to() won't get called and we would be running the PV
guest with the previous HVM domain SSBD selection.


> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -697,7 +697,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
> >                  msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
> >          }
> >          else
> > +        {
> >              msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
> > +            if ( v == curr )
> > +                /*
> > +                 * Propagate the value to hardware, as it won't be context
> > +                 * switched on vmentry.
> > +                 */
> 
> I have to admit that I find "on vmentry" in the comment misleading: Reading
> it I first thought you're still alluding to the old model. Plus I also find
> the combination of "context switched" and "on vmentry" problematic, as we
> generally mean something else when we say "context switch".

I had a hard time wording this, because of the Xen/guest vs vCPU
context switches.

What about:

"Propagate the value to hardware, as it won't we set on guest resume
path."


> > +                goto set_reg;
> 
> It's not clear why you want to use hvm_set_reg() in the first place - the
> comment says "propagate to hardware", which would mean wrmsrl() in the
> usual case. Here it would mean a direct call to amd_set_ssbd() imo. That
> would then also be in line with all other "v == curr" conditionals, none
> of which apply to any "goto set_reg". ..._set_reg(), aiui, is meant only
> for use in cases where vCPU state needs updating such that proper state
> would be loaded later (e.g. during VM entry).

I thought it was better to hide those vendor specific calls in the
already existing vendor hooks (set_reg).  I don't mind calling
amd_set_ssbd() directly here if that's preferred, it seemed kind of a
layering violation when we have vendor specific hooks in place.

Thanks, Roger.

