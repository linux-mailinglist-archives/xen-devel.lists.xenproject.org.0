Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE39E4F906D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 10:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301185.513950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncjh1-00042K-73; Fri, 08 Apr 2022 08:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301185.513950; Fri, 08 Apr 2022 08:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncjh1-00040T-33; Fri, 08 Apr 2022 08:10:07 +0000
Received: by outflank-mailman (input) for mailman id 301185;
 Fri, 08 Apr 2022 08:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3bc=US=citrix.com=prvs=090ff2996=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncjgy-0003F8-Sm
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 08:10:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 494caacc-b713-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 10:10:02 +0200 (CEST)
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
X-Inumbo-ID: 494caacc-b713-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649405402;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kvBj1g8m5kMmsSZu8y2sqkdO47uMzmblBm3IIeFZhG8=;
  b=hoIFyuIUALhX1YKVV1MhOLY2eUpfNWZTAvOAhWkJ1dwX4fqlbMQxcGyO
   2YBpzZ+hxNCT/FdJfI9yAEk6HUpcEdCGcNRh7DvoGMklnAMrzMfodx6fC
   etU0eXT4LaOsYC6gO7hlYsYBHWdbj6+Yc6yQ12UlKZs6cU5e1+5C6N/cC
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67762387
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UjaubKBCvof9JBVW/8fjw5YqxClBgxIJ4kV8jS/XYbTApG4q02FUm
 mJNXWqBa6yKYTP2e4t1PITg9RxTu5eGyNU2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jh0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhRi
 /ZojraiCj50O6LXwf8gAgllSh1XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGg2hu3JseQp4yY
 eI2bwNsVzb+cSRzGW8SI5MXzPyV3kXGJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHMOb4SqI9DSrnOCntS/1UY0dFbq899ZxnUaegGcUDXU+V0a/oPS/ol6zXZRYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 liShM/kHiAqubGQSHS15rqStSm1OyUeMSkFfyBscOcey4C9+sdp1EuJF4s9Vv7u5jHoJd3u6
 xDJjw0FradQtJMO2L7i5m2Wkw/1mrGcG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNawpbDtYjiGbnIzXXQG7tVQNlF8t7faFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGj4cqO+pd6OxwlMAM8OgJsNiOM7KihbArKWe6ENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+N6nHBjmDOMGsmip/hC7VZ4TCTIIVviGAHQBt3VEYve+FmFm
 zqhH5XiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/G7hcbYSjeK7FoJUqeLqZt4ItQNt/0Myo/go
 yHsMmcFmQGXrSCWdm23hoVLNeqHsWBX9ilgY0TB/D+AhhAeXGpYxPtHLMtoION/rYSOD5dcF
 pE4RilJOdwWIhzv8DUBd5jt6otkcRWgnwWVOCS5JjM4evZdq8bhoLcIoiOHGPEyMxeK
IronPort-HdrOrdr: A9a23:mS2Deai3jjhO5IodlR6WWBNHBHBQXzR13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykKsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JdDpzeXcGPTWua6BJc6
 Z1saF81kWdkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87heYAotd/lq
 H5259T5cJzp/8tHNJA7dg6MLmK40z2MGTx2TGpUB3a/J9uAQO5l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.90,244,1643691600"; 
   d="scan'208";a="67762387"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cr417hGJu3KCSlW71NLzK5YDIufgtuihT5RAwj8SYfRQqDkyKLuUaenUgf3Mvz+kNxe4nVYRl4XoeG00wHAOURha2rvL84XEgEjxLPD0RzIQT7wkPjIvao4m9Zsde+/b80aNXtuL4lsXD/IaDsMlOsNerl5OFpQvZ7y9adz8wsYjCXCoOV/Aa65p2Jwwrbma9WDY7a1kC27q64gubiJ3waHqXgpOYriVBnFR8tL4rR28AXubbYynoAfECzlimi2Kwkva1gN7i2yxejTTMD5W780/AOGCWURVt7XSVIUpNYnd6YYArG5jPxFDMCkiBPh1c0TWWPe7ivem7/xV7qZijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhIcRCxA9o8VUGgY5jmlY4CTX4e20NJrMwY7FQoS2Gs=;
 b=VZJ2qHJ6hMfwJ1BQjIZ/POdOX98/4qLPX7pGf8XINPNRdDdggcoq/ndANEobSw2d7oJNXpYhM5P2ROsYXmfRhzFaBCRFXbv8Kjk79oeyI8I0B0bYdP2wNXOqOUSPELAM392H9uHmscBfKnF+wkH1tREOwq9wQBdJ89e6GyEB0LyJ6aBofXtooXTTSYXozbHbnyy8USJlwpYirR2X7lLPg2jcThE1vo9gvN/54zydZGWgIH93zdNakzJ/XWqywedf3xUng6qGFkKi3YNIytuydsoVSkilMzeUWEPixjVDUMc+bZeaL0OANber1P6wuVZagjZ81qhRz81U67sUBMEtzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhIcRCxA9o8VUGgY5jmlY4CTX4e20NJrMwY7FQoS2Gs=;
 b=Mk9jkyxKY285+zW5C0jiBopBpDQGNDyM+piRglh7Go6NVmj++iY7wDbkSR3oQ46BzadnsBsTJjSvXsVQjjjgBn/0TPoxMh+dtC5vLJJeUA9X5OeYB+l46WH/xvnUQhLh8J7OBKpEeSaF/IkGhY+helC8M1VL0u/NSqIh/cWaxPA=
Date: Fri, 8 Apr 2022 10:09:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, osstest service owner
	<osstest-admin@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Dario
 Faggioli" <dfaggioli@suse.com>
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Message-ID: <Yk/tzuKq4D3mFEQu@Air-de-Roger>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
X-ClientProxiedBy: LO4P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0ecd681-c5e1-4ac8-eef3-08da19372ae0
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5600:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56002B5C1C769BAD16C87F978FE99@SJ0PR03MB5600.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZdEOs5JdyumdFZfyK9cYRcvxMOTpI0dMKo73bz5i+Px56IfUrEDpJmJolK1bNAvMKSqyfip6tc1UG4dyh8ExSWErpZbgsNDmKtKlOCuYhIOBzes52L9q34RbZ8NfRW3KScSPSJsy867lnm3Y9cSWILHlB1+YcjqvRVIoz+D2PkMzhlsO3TXBk9zkzotzlgEI7aAAFWRnqskWuBYrPZIFYZxWMP0d3B/TlgSBUDIFHKwVH+tf2H3pRTi368OPpGvOtvj7SX82LpuJyjEap0a7L7m7UDvznLevVROFc4zOyNfu0pI4PtPMnY4Kh+5B8TFXKnlnK49JyB58P9aiBOYZkBIa/bxYTd4dtz0WmNcuxLPOGQb0qCGqIatJ4H1R7dihpOatXaSUQtRRVosan4H172kqBfKFVY0OoVxSFmy15HtH/uPQj7tFkedyCPy52BnIY06ygVinH+f9eDakg9VyuQ6Foq0tgrTxgrVXa6jPIUNyCa5dM7jwajYvhVeVIDD87OvrdfzhkqjpVyGEe7NbrKjkCXjXES3uF5MEfKXSDVl4ngc/MCsTkQaIQZu952CenzycpUZIAs9MxO5a7/8EOgupBKXHYZd9J/5xOTOJknG9AM9L3WzkXRo6E7BSio1+LNgvB+Pkvsz2DxvT9brKkksm0p9ZGA9zn2fj5IfFa7XrLj4CiJn1J4nPF/0f4l9G2mAit68X8pHxfjf6C/NDeLbxllh8sxCO8gCUYEeuu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(53546011)(9686003)(6666004)(6506007)(6512007)(8676002)(86362001)(8936002)(2906002)(33716001)(85182001)(5660300002)(66556008)(66476007)(966005)(38100700002)(4326008)(66946007)(83380400001)(186003)(26005)(316002)(6916009)(508600001)(6486002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHBZaW5zUUltRmhvallsbVZCN1F0QlZKd2ZMUjdzVk56dCtvK3I4amJWRkpO?=
 =?utf-8?B?b080MGZNS0MxblVZN2ROS05KcVRvWmE2OCtaRGk2Z000clZEbkJpbTk4R0Fl?=
 =?utf-8?B?dmZ2MXE5QTVIRVNaYjF1M3oxbHpoV05xY0ZHWGZ0RHdCZDNzemQ4YXF4ZWtk?=
 =?utf-8?B?Ymp1a0EvREFmYldHSXRxaWw2U25DSTBiTVRXNm9tSVZtdjZPMmMzOW5VNjcv?=
 =?utf-8?B?SElhK1d6UjM3cUtTdFVGbmoyKzRVcDUxaytWSndYbVR3cnlNWTcrSlRHdEhz?=
 =?utf-8?B?SnpUUDlqbFllaUh0Nm1FcGtISERObkJQWTNjODhtUWpob3RyOWhhL01rQ3NG?=
 =?utf-8?B?T2ppb0Q2c1JWcjlra1lUR0RnNDRLRk9SK0lTakhHNjFVOURrWTd5K3pYcEo5?=
 =?utf-8?B?OWtOUlZyR0dGT2R5VkZKRmV0Yjg5SzQxOWIrU0Q2NTRVYnNPeUJTN2lwREFq?=
 =?utf-8?B?R01uVmR5M1hlNnh2NGVxcGFPSkZIMGM0dVRab2hHYlhSYVVoU2NrMFFXRVBu?=
 =?utf-8?B?NmFjbnVFdkpwZjZPbXpPNlpNTzlORHNYLzBqZlo2TURxZ21QQTlYNHRVakd0?=
 =?utf-8?B?SUYzTlhmUjhUQUdhNnliMUF5U1lwSHhnREUvRFRRYlpuRmsxbWZ4TlBaeDdk?=
 =?utf-8?B?SWNJSzBIYzZsbkxqVzYycGo3TWk3RWVsTGREUUpSeUtxT3F3ZVIvTGVZR1F5?=
 =?utf-8?B?b0Zya0pxQS9RQ1lGeFQxR3EwbmtnblJRUEU2enR4OWtQUVNGdTRURWV0akJt?=
 =?utf-8?B?S2E4MUN4TUFsUkFkM2J1ejNxSHVtVmFTMVNWSmlpRnVPRnMrT2Z6U0I3Z0tj?=
 =?utf-8?B?eDNlNCtoY1drakxuMWg1YWhud2MrSm1adTczZVF2U1JOc2JSSWFueUphaWll?=
 =?utf-8?B?MnBlVzlxcVFWSExWZnI5YmF0NVhGa1VQRGhUQ0VuNWk3Q2xmVkw4aEpDZzJU?=
 =?utf-8?B?ZzJkT3ZqM0lNc0FYbXpVVElHVC9UVUc3c0RYZkluSldHeXdwSFNPUTliTFFp?=
 =?utf-8?B?c3RVUlBNZDhZV3JFSllsdDg5UnRJaGhaTE44bXFwYlorMUNqK0g5MFNPVmY5?=
 =?utf-8?B?V2I4ZkFrWUFpSURvWjU0RVU5RTFTSXc3YkZwQ0xqa3A3SW50NzVUZXkrYytG?=
 =?utf-8?B?Rk96aDNCNjZNVThCY05BeWdLM1RESUsrNUozaGRIM2tmUmdrcTcvVUtKVkVi?=
 =?utf-8?B?V3RKUmpSSExGRFpzRTZVdHRUVUxPREl4NG9leHJyaWxuTHFKOEs3cG1NTzhn?=
 =?utf-8?B?V2NuKzZPcWlSU0FDM3NQUjU2eTBQNEVIblFRNUZIcytiZU1YaG01OU03b3Y0?=
 =?utf-8?B?dnF0NERVQVZVQmpRdFBPSS9uLzY2clRYM0FGQW1mYnY0a2J5am01VE1FbElw?=
 =?utf-8?B?Q1huUDNvcVVmbG55TlJjNHprWVFvWFBDWDZPYUFYWSt0Q0xyWEI1aFVaVkdw?=
 =?utf-8?B?ZStURStSbkJxNDBNalgrNFZoMkluay9Uc294TjBZc240OTNlZ3dvNy9aU09h?=
 =?utf-8?B?SWhyNXh3YjZ3L1VXdGxhMkxmODM5R1NGOERUYzEvYW5DcmVSSE9TRHhIOEl5?=
 =?utf-8?B?cmRsanFwRnd3d0ZTMWZLTFhZdXplbWFpYmFFbUZnR3NKMnV1Vk9aOXBaYUNw?=
 =?utf-8?B?SFpOa0doZFo2R29wWWt5MVFBY1NnZUdPanQwK2NsRU1mZThsNWFrZzAyU1E4?=
 =?utf-8?B?TDF6RE0wSEJrb3J2NE9qM2xPd0tpMmFKcHljRk5HNFdDaW4yZ3dsNzR0d1Vm?=
 =?utf-8?B?bjdBdERMZDgvYWkxL1B3M2lMayt4RHdybGthaTNkMkpvNnlkTnhXRjg5a2Nh?=
 =?utf-8?B?UWhGMHArQmpvcHQrZHJHLytWeWNyYWttb1ZPZVhjUzVGRHZWMFpUK09xK2hV?=
 =?utf-8?B?SkhlVVBvNmZiMlRFcEhZa212QTJ1WWVja09ZdDB2S1dlYXR1OFhvQVh4aUFS?=
 =?utf-8?B?UUw1OWZIajdMaFUxY25mYXZoMlMreHpEVE1sYnF5bFcxcnRFekE5SVBkbEhx?=
 =?utf-8?B?L21tMUlNNXZUQ0Rqay96NC9vUW5SY0VSS1RUYmsvZVBRc1dLQUtqVWMrWWZE?=
 =?utf-8?B?VXFJbmdSTUFzcUY2YW1DVFhHZWZ3WWMzdFR1WUFEWVhSbFJ2TkV1NXhuRE5G?=
 =?utf-8?B?TkExKzBIZ3dES1JtNnMwSmJVa3c3NDRzUHM5RVpScEpJNFAvbUpJOVcrcWlR?=
 =?utf-8?B?NzJRaURMZ3ZmWDM2RDM3cDdnV00ramNnMEkxZ2lSTUMxNTFqUzB3RzZtWjFC?=
 =?utf-8?B?d3hBclBGcnZBcVZPSm5mQUhBNk5KL3lYZ3Y1V1hNWFBoeW9rVHIra09tRWRY?=
 =?utf-8?B?THMyRjlDZ3g5VDRhNjBsKzJqN1NGeVpYZGp4MXRKY3FsL01QQXNKMmQ2aTVs?=
 =?utf-8?Q?r7DfpicAA/EkN5o8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ecd681-c5e1-4ac8-eef3-08da19372ae0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:09:56.1500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMLKqjriGKNbw6mdNMZCBlP8371+JYGioulzvvCHQdkcjGZELXteraZVQLGjmLUTmYI9Sr//HwSpQ05FjXu3Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5600
X-OriginatorOrg: citrix.com

On Fri, Apr 08, 2022 at 09:01:11AM +0200, Jan Beulich wrote:
> On 07.04.2022 10:45, osstest service owner wrote:
> > flight 169199 xen-4.12-testing real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/169199/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 168480
> 
> While the subsequent flight passed, I thought I'd still look into
> the logs here since the earlier flight had failed too. The state of
> the machine when the debug keys were issued is somewhat odd (and
> similar to the earlier failure's): 11 of the 56 CPUs try to
> acquire (apparently) Dom0's event lock, from evtchn_move_pirqs().
> All other CPUs are idle. The test failed because the sole guest
> didn't reboot in time. Whether the failure is actually connected to
> this apparent lock contention is unclear, though.
> 
> One can further see that really all about 70 ECS_PIRQ ports are
> bound to vCPU 0 (which makes me wonder about lack of balancing
> inside Dom0 itself, but that's unrelated). This means that all
> other vCPU-s have nothing at all to do in evtchn_move_pirqs().
> Since this moving of pIRQ-s is an optimization (the value of which
> has been put under question in the past, iirc), I wonder whether we
> shouldn't add a check to the function for the list being empty
> prior to actually acquiring the lock. I guess I'll make a patch and
> post it as RFC.

Seems good to me.

I think a better model would be to migrate the PIRQs when fired, or
even better when EOI is performed?  So that Xen doesn't pointlessly
migrate PIRQs for vCPUs that aren't running.

> And of course in a mostly idle system the other aspect here (again)
> is: Why are vCPU-s moved across pCPU-s in the first place? I've
> observed (and reported) such seemingly over-aggressive vCPU
> migration before, most recently in the context of putting together
> 'x86: make "dom0_nodes=" work with credit2'. Is there anything that
> can be done about this in credit2?
> 
> A final, osstest-related question is: Does it make sense to run Dom0
> on 56 vCPU-s, one each per pCPU? The bigger a system, the less
> useful it looks to me to actually also have a Dom0 as big, when the
> purpose of the system is to run guests, not meaningful other
> workloads in Dom0. While this is Xen's default (i.e. in the absence
> of command line options restricting Dom0), I don't think it's
> representing typical use of Xen in the field.

I could add a suitable dom0_max_vcpus parameter to osstest.  XenServer
uses 16 for example.

Albeit not having such parameter has likely led you into figuring out
this issue, so it might not be so bad.  I agree however it's likely
better to test scenarios closer to real world usage.

Thanks, Roger.

