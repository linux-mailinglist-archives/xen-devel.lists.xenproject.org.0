Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA27482DE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 13:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559094.873778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0ZO-0005Wi-DB; Wed, 05 Jul 2023 11:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559094.873778; Wed, 05 Jul 2023 11:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH0ZO-0005U5-9u; Wed, 05 Jul 2023 11:21:14 +0000
Received: by outflank-mailman (input) for mailman id 559094;
 Wed, 05 Jul 2023 11:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=asTv=CX=citrix.com=prvs=543a7ddba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qH0ZM-0005Tz-VT
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 11:21:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aa158fd-1b26-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 13:21:11 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 07:21:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB7115.namprd03.prod.outlook.com (2603:10b6:510:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 11:21:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 11:21:05 +0000
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
X-Inumbo-ID: 0aa158fd-1b26-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688556071;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2SpJePAoRfnyrkf7ck2zFXGTteLBdcylXjgKrVyVZg0=;
  b=A1Ojzwea/fL5fMxeJcrOO7p6ODSSEKSS4BWRCbxRV13OQNd7UDM2/nR8
   fAUBxyI0GI8IqbfPhq4nr9NK7M0o3ABTUOYlWL+j9xWZnw07V5fMWi6I7
   IQ84z3YWYw7Ya+AjlqbTlTt6hCQJKqteGYbkl0iKhDRm16zmbQo3XSTUp
   8=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 115631925
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yU3y+Kys11/Z/bEtrqh6t+e8xyrEfRIJ4+MujC+fZmUNrF6WrkVWm
 mMZUWqGb6yNMGH2cthzb9vi9RlV78DUxt9hHQFlpSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPa0T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTpu5
 MY9LTAvVCDZqL2y//GHRNVI2u12eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQsuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAd9MT+TprKMCbFu7zS8pISMuR3+Cv9bljlDkUokHF
 BYl0397xUQ13AnxJjXnZDWArXiCr1guW9dWHMUz8gTLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiZrHW5OSUTBWYYYGkPSg5ty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihCojg7Qei+Yb2qP9+krI6xqmq4LVVAcz6kPSV3i88wJiTIe/Ysqj7l2zxchHKIGVX1yQp
 k8uksKV7P0NJZyVnSnLS+IIdIxF/N6AOTzYxFJqQZ8o8m31/2b5JNgNpjZjOE1uL8AIPyfzZ
 1Pesh9Q45kVO2a2aahwYMS6DMFCIbXcKOkJn8v8NrJmCqWdvifdlM2yTSZ8B1zQrXU=
IronPort-HdrOrdr: A9a23:h+DUR6nHTAQqaglyrkvF11H5pDDpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-Talos-CUID: 9a23:JGIjv2z4CryiR6vN0nvlBgVPOtEfV3jd7k3geWDnDVkqdLOpbQO5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AlujFZg1t13a47w9C18hM+fM/LTUj6OeUIX41g7E?=
 =?us-ascii?q?/pebYMTIqMmzFs26Ga9py?=
X-IronPort-AV: E=Sophos;i="6.01,182,1684814400"; 
   d="scan'208";a="115631925"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVDSPrVGTccLw7MxgQPOJzG4ceT3JApyjmO7/ZOHp8lS26SwVD0cr+VjeJvtu+Q62RI7gMGkRts+ayuVZVNMRX7KQqmfC7nTskYgRsr/+XS6Pd4ofZm8XRb8M5YtG3UOqgWLlZG7jkfWRCOgIAgh5Ns0vmS/L/9E9M/hG3kF5f0b9Xc2/xKSk9hGXgWRpEFuVLTWeiZMaH6sjEo5US3Kd9Z+iUxTJEkv0q3+fhpxl26g2rO6CoJ3GI9K2d7htEFNSas1gUkZ8R8KV73Kxb3BYE9p7sriZAWME3mKs7vK2o1UWS7RmQ0L5RwsnTVvdl86nvMOuKxjwk8xwNNzFCcuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SpJePAoRfnyrkf7ck2zFXGTteLBdcylXjgKrVyVZg0=;
 b=JkR1pi9a85Jw16Exw3wI+l2wQK1VeGj4pJm1lT1qwd41YanFCq0lQqIc7lHtKg9sUPqqnl5pbIDCNQLNU+7uzYzzMWENB9T+RjH05bPh3dptLhTWCqHqvIs2wXKVaQcrEREBQrOYLiKVGMHahgCTTC7ToPiXZN3fgLfukCGppe2ZUIfmIv8Y9EG3YAWK8JGl5bxadKH/0tYztZY3Ue26KopTIvqfgjMt4fU0z+Iq3yOQXu6XDjgbzNQbRoA2IX4l5VeB5hTptCPK98pVWNSx/nXnFVrmD6vqA+Xb7Oo2cORcf6oDtKCc3AspGChl8ctgdnpe+jEc73WpL5GYgefSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SpJePAoRfnyrkf7ck2zFXGTteLBdcylXjgKrVyVZg0=;
 b=I0KDFutN1MRjRsaAj4jBB/xlH/G4pkHftPMAnzFPB/jD7LiTZCMHORyYp+sioHh2MPLiQpLJg4/xniOUJQSUpquI9fbKNEvub3g/y3lwEtPqlKxmNMI+PeQ1xCbKJusArIAYMJiQQLozs9ehCZoU/IGXzNuEuRVVgIdft8mXGoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1956a273-27a9-d0e6-e328-be69ff91e5d3@citrix.com>
Date: Wed, 5 Jul 2023 12:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [RANDCONFIG failure] Re: [PATCH v3 02/52] xen/arm: make ARM_EFI
 selectable for Arm64
Content-Language: en-GB
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-3-Penny.Zheng@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230626033443.2943270-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 34cd6955-0f47-47da-4b59-08db7d49ec0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oIxu3rzqcmPYFWh6t2tZq/Oit++d/dEbStUFhkaRbKLXYPhAApJe3sLlgmRFPdoKKBPhJImVkp9SfO2AEKZXlbH9h5wOEEBzaadTJry3fWJEolD7Q/2DJtq3pI77rf/CHPSCgUozBSfOwF1qsCOLLI7rkTQBOEpZXTumt/wsIXWn5NX9izV7TZ/yIlvn1tzSyPtdxKhTcEOq2LkKCDPZBNp32vwruoCRiox6VrzGLQI3nRgOEHmIxBo7at9Ow5nTiN7YQCyP4IWe4ytoTMarEsels7KGiqStw/faSuNLMcd2Ij80QCe6PDhtPLDKeobvwUE1NL15zf/sfuJIgZqEy/KwT/Nrk2GpJN08PxgD+wmrBEmbhcF/XPf3KH5PkaaipqYKDf+Nyrz5c/FPZ6LLNz9ZnLPdI4eQmF4ohw92kPiqNc2M7mQl2l+NnfhAViHqoD+wqai4D6dJFBHYHyYwjNlwGbq0pWTj+uUpZrH0SCrmBl0mUavcfsDPBd/LbYjnoWxah+2jvmwVMiIWqtTS1YVwaArOeq9q2tlHmy9Tlhb2skHe6krMxTi2Fkk0QLGD+15GRbPUVaeEmoNW4IhhEu+pmPEDSNavfkVA3Pn3QRMYfjYjKou3RL80+W8MZp+JEpvXDcFNl4fFQEPUaG1zJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199021)(6666004)(6512007)(6486002)(966005)(478600001)(54906003)(2906002)(6506007)(186003)(26005)(53546011)(8936002)(5660300002)(8676002)(4326008)(66556008)(41300700001)(66946007)(316002)(82960400001)(66476007)(38100700002)(86362001)(31696002)(36756003)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU5wN2lzd0E4eWc2aHgwR1I1MUhVMmtJWFdvWXh5L3NsWTgveFJibk0yV3B1?=
 =?utf-8?B?N0FQN0poN1ROU2N6cDNUK0ZsVFVYYWJhTFltYkljUFpLclBjWVJJRURMT240?=
 =?utf-8?B?N1ZnSDkrRC96MHEzSWFxZ1ovZ0FMS0JyYjMvd0hQVDJaTWE3QnZhek5xVktk?=
 =?utf-8?B?dmpmM1BKZExwWHZ2a2toNGZnd3NERkpBRzgxVzJPblRTVUVxWjUrRWNIRFJh?=
 =?utf-8?B?MnZUOWpsY3ZYOG9aaVhudStIK2FpUytib1RnTUFsejRoSmlLQyt2VXdIb2o3?=
 =?utf-8?B?WmRwL3BiVm5GUFBYc1oxNXNTTCtyS29MZDBXNG5VS1ZjTlRFVGx0cEhyQm5n?=
 =?utf-8?B?cnN3NEs4N3YrSjkrelg2a094VHJsMHE5VlRQd0ovbDdrTG9CVmRZaDVXVXd2?=
 =?utf-8?B?S3dmbHRYK0tQdjZVSEtOeDRMZUZvVFJOa3lKcEFOSFc1YlgwQWE3QWJWWS9G?=
 =?utf-8?B?T2hsMXR6VWJ2V3ZxUVFXK1RPM2xoWndZTXE3NDdaKzd0TFdORkY2RzNtcDEx?=
 =?utf-8?B?Ym1nVkZEZ2cvNmp0WE9UcllOVW5CZFFtYmRxc1pVVWdOT3Uyc3ZmVXZNeHAx?=
 =?utf-8?B?NE5lNmIwUTBCMk51cWFSeTBIakI5ZUFLMUJwTkFUbjRZbFowdE51Z05TOXVM?=
 =?utf-8?B?SXNMN2RSTVVyS3JIU2l4djlkeUNsZ2VHL0FRN3F0ai9VRFlzdGd6QTVubVRF?=
 =?utf-8?B?M2lYVDE4SnE3d24vNUlUbE53dlZsWFR0Nk1JRDUrYXJhZDgzVldhMy9LRzNn?=
 =?utf-8?B?UitnY3JVZFJDVFphSjQvczJ5NUNOWVZLdGViR1MyR1laSVdrdGwyQk9pdlB3?=
 =?utf-8?B?Y2Y3bnFLRlRreXNYU0dXS25PS0R0ZXllYlVKek5TYXZsTllxbGszWkptemp4?=
 =?utf-8?B?ZXFBbnFaaC9xQ0VyV1ZiQ3JSbExTNVhhQlZFUUVJRlMrZlc5ZmJYY2xGMnNH?=
 =?utf-8?B?cTAvZndZS1oxUStsc21hUVhaUHRXOGpSV2M2TDJwZ0ZQQVFkbUVYZGtRT1pV?=
 =?utf-8?B?UHN1eXRqekQ0ZjlOSUxZRElOODc0Z1VvMC9kS1JXeTZCeGpBMlJqY2FMMXhL?=
 =?utf-8?B?ZmIxRVhpR1NudnV5V21oa3dPQUZIMGRXQyszbzlRYXoxUG5JU1k5WkJnZUlW?=
 =?utf-8?B?ZGFkb2FLTmd5aStrR0MwZWxCaHk4VE0rem5rUGpESVZKUkNGamNQWGV2MldT?=
 =?utf-8?B?ZDhrS0k0dXA1bk0rZGtuZnFiM2ErUkZiWlBPSUdYTUU1dTdWaE5FcTArL25N?=
 =?utf-8?B?T2dDNDFhS2hNekNxbW1qeCtNMFpXd3NPVGNveFdkUVBSYTRoSjU1TTl2cVpv?=
 =?utf-8?B?elZVUVc0Z2Rvc0xqRGMySE5qVVNlYWlnSDd5OWtoR3lvcm13U1k3aU03b2tB?=
 =?utf-8?B?TlhUV0tyQVJMdWgxVlJzMWRSZEVXd1dBMEhwd1pJNWtEdmlicHZ3Z2N4UUk3?=
 =?utf-8?B?TmtnVkh2bFRsOFRxbkpzL1pzM0JDenBoNkYvSkNKYnV2NEtsbWhCNWIzR1Y4?=
 =?utf-8?B?RUVDZ0gzS0dVVFlJMitjbC80dVV4ZDMxZnI2SUxaUWdFZnhMWWV4Tk5PU2FJ?=
 =?utf-8?B?Z0lyMjVHdU9FYlNETWFaSVVLUGhhcTdPSlFIS0dWVGdReHdEZFdqblV1Z3pO?=
 =?utf-8?B?STRyN2Y4c3FMRWdyV1B2K2w1RUUxNzFQWHg3U1Z2ZUNUSWZuZnRvcDAyS2gw?=
 =?utf-8?B?YmtvdTBwSGwyNGZ0Q0sxZlVWS1hDa0pITTdOenFNZ0Vid3FSN3FRWXBpMkpB?=
 =?utf-8?B?UnVVeXBZbWVTVnBuN3pkdXRkcTZla2s1YlRnWERFZUJZNDFQRnZYaG5NY3B2?=
 =?utf-8?B?YUNFYlRrVVJ1ZXZaOWZjZHppRzc4dTEzdkY1UTJsaHhvK2hJTisrVE1md1R6?=
 =?utf-8?B?T0hnWW9Tcnh1ZzVTMWpGZzMyc29xYkl6MmhBLzhzM0lhM0JRSjFJV1FTdnlZ?=
 =?utf-8?B?NGRDeE93Tkt1R3ZuWlYwb0Z2UUJhb3BBMW1YeDlFLyswbis1Nk9GZTV1OHNF?=
 =?utf-8?B?ajMyUG52SzRLRERVeURDQU8vb1pnS25BSUpydGFNMjNzZTBWUEJXTGErL2hF?=
 =?utf-8?B?aVNwbFp5cGdYdTh6bkVEVzdzcHljcHpibFVmUGF3LzdzamEvR1lRREptd2Zt?=
 =?utf-8?B?VXhkWFE5MGdmYkN3NGdCaGdKZGw0ZGtJRG5ZME1sdjdrSmxuSTZSTGlNOEI5?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Sr/TWouPLwUCfwicrqSgTa2Qk1MF6OU1hau/k0PHd/X3KLN2rekkEMO4g6mfBsn/AbswYiTg95fBc7EmsThLVV55VT7LkK6tjcy6n6afmzqt5DVa0ykOfuE/sCumtjePBFspdiQiQ0G/w4fZ7iC9FSTuc1Lh27mCc5Pdii3f3RnLD32zDlHrEU1qLXCuJ0LoZKsVJgYijt5k/do0XOUS/InSpQi+gA3RG0H19357QVI7Ne+1xxdHkykgzK5IFGdL59dlcQaLgTrrU3VEcOrjIp2L2Nx9AT82p0Wwroah3HMjWkCw6U++TTOsdUFLok0zjBJSk4S0wYIHsiAv1z8GOqtlI6S1F647ohEKFNIl/La8mCkzf5DU0JlWgl8Vr9X7Yzl/wo3qQWI4dq7x1/wdqS2RmwhTJ/kdb+G9dJe82Q1Pn2LZPmzdqUIP7yrYrc1dvksC6NNS/6M3q8FwhcpemOg+BVgCjmlhurOdiiPZJa0LrbHmIS7qaV6OcccsO3EFG3cFf0/VqoFfNWQngetyCVwaie/ymHua6/tsPwetLdcHIVXjjNGPpqwy8Ed5/u5aVdkBoJ0vXJnWIbRRDuVyEHJs9HhznYpeSXlQIuTxt3qj6tW17s89VzWHvj4EszuXgj3TQtFTq8jOQw/NAX82KhDR6lnIVwVm3KgMkE5FBSh9hZJ0xwH/A6cIMFXDxVFWksw6lkFKvlgSl5zK7/tjkBf9W2mAWS7Bn/2cZNNFFXrp9gNJ11lPHL7qw67UUJi0k42TK4FujuauQYZoda71woZecDFBHjcDd4Yhxpxu7sAdvLoxqTvVBwydU6bhd+BNuzOZMOAS7jfCIVgPEdRfOalhLOxI4DI/BBvPrZxUwzpDVTtY01dKNbUM+iO9QxYa
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cd6955-0f47-47da-4b59-08db7d49ec0e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:21:05.2995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDEFj+NahK4ulJcv2yzlnnyWUCO0YKW29+VS2PrcCD1+HjTj4UFeCKtvmQGrJtNLB81jblgCby2We8/1mTJ0tuUvfclzg3zWMTHnUBrTdfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7115

On 26/06/2023 4:33 am, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
>
> Currently, ARM_EFI will mandatorily selected by Arm64.
> Even if the user knows for sure that their images will not
> start in the EFI environment, they can't disable the EFI
> support for Arm64. This means there will be about 3K lines
> unused code in their images.
>
> So in this patch, we make ARM_EFI selectable for Arm64, and
> based on that, we can use CONFIG_ARM_EFI to gate the EFI
> specific code in head.S for those images that will not be
> booted in EFI environment.
>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Randconfig has found a bug:

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4595568303

ld: prelink.o: in function `acpi_os_get_root_pointer':
/builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:
undefined reference to `efi'
/builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:(.init.text+0x8ac0):
relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against
undefined symbol `efi'

~Andrew

