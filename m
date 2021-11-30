Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FD34633A1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 12:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235075.407903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms1kC-0003ja-1W; Tue, 30 Nov 2021 11:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235075.407903; Tue, 30 Nov 2021 11:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms1kB-0003h6-UX; Tue, 30 Nov 2021 11:56:19 +0000
Received: by outflank-mailman (input) for mailman id 235075;
 Tue, 30 Nov 2021 11:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xd2=QR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ms1kA-0003go-If
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 11:56:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83f15d1c-51d4-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 12:56:15 +0100 (CET)
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
X-Inumbo-ID: 83f15d1c-51d4-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638273375;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wvrCojYYN+Oxe7J6bTqhETP48nbg1Gi4W94LUUVBmLE=;
  b=YpbKCQvGM/gatQdupi2Wv4pPD0xVCOYXrMWBS56o5NqiZU+1ik8W9cym
   xqpwpEHele1ux6daL8bIb8ENhhMNztf4jIybRBqIuOEdU2f57RVN3Pdmj
   0P9HZoJ4I+1YKsx+Z8mJTWZJUk7+watHpJNx5c3MTNjfDmiTtM1gRFmnW
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /45WaKRDXd/aCgeynsrEYPDhSJeYjEw80w6JSW9dFVkXqQSX1l4HsJkhldcS4xbapg+PGTlTOW
 yoSHVbXZRMx+pyaW77bg1N/CXT+MjwT+q7mEWS6YH2RNh/KTd7VOTBPnoyKcPeS4Q36fiKoja+
 mpD7Tl5ewQjDjX7FfQDQ8+OW6zOX60UsWaBlz9RmOPS6zbuiKHuHGBWmVSAdkDNOtW1vPSzKyL
 LSMFMee8GiMAZYBwAq1OiTZhJG8HjgY2m/IumTLBQHOcciauP77Wux5abnbnzr4rW6KUlSBnp/
 0OJYzDKBR7caHuWolztB5uBJ
X-SBRS: 5.1
X-MesageID: 58413392
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LxpCdazOGvuGc+iOaOl6t+fAwSrEfRIJ4+MujC+fZmUNrF6WrkVTn
 TQXCmjTO/iCazP2e491a4q/9h5QsJaGnNc3GQRsrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrVh2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+J77
 PtM7ZqQdVY4IZ/MmfomcTp2Di4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIIgG5r3ZEUdRrYT
 /EjRnlJNQzAXwFGHnE4JI5ivue6qUCqJlW0r3rK/PFqsgA/1jdZwLXrddbYZNGObcFUhVqD4
 HLL+XzjBRMXP8DZziCKmlq0j/LLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684ma9VsxeL
 QoI+yMohak06EGvCNL6WnWFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYsfDRlRt1+su8KFC015
 F+IgejLJhJyv+jAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+XeTJEPYgHnFYg6TvPs5jHhMXSpm
 m3R8nBi71kGpZdTj/3TwLzRv967SnElpCYR7x6fYG+q5xgRiGWNN93xsgizARqtwe+kori9U
 Josx5j2AAMmV8jleMmxrAMlR+rBCxGtamC0vLKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEIbCHzNPQsPdjtUazGKJQM8/y+DZg4ifIUP/BMmPKvpnkyNSZ8IUiz+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDnUgDKZfobcmjlXyPiOPGDFbMEOttGAbeP4gRsfLfyC2Io
 ok3Cid/40gGOAEISnKMqtB7wJFjBSVTOK0aXOQLLLPeeVQ/Rzl6YxITqJt4E7FYc21uvr6g1
 lm2W1NCyUq5gnvCKA6QbWtkZq+pVpF6xU/X9wRwVbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:dBJdwqEcWagMf/oepLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="58413392"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ5zozlQd0HSQ2FGdXcEKsHiGvWvI3I4lXmdIKO+kYQ8sTyrlMCICW3K3iCfGHDwfK9Dy7r5589uQKdHu70/DoQut9WzmZUZwUR7ahiOFv+5JxNxIR6SVermdBpwiPi40OwcIPIGbAO3ZmkKJ7jD1X/sQt4WRusDXU9ZAuMAAoSPfODienoaQ0crwwkJQRVOxdxOrVq9Iy9+NwAPOpkg9D0+3dbz+GKwhTpa+BWlHm7hfa1HR/zMX2A05hjik6KtmL27UeR+E/AMeYZJ95sR5RpPwlqwEPevgT/cr3/fcCH2EU2511ZEDmLTIDvPB1ZrfNins9UoSatgPP78VbP0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXa2V7OYMORL6Y9ATroOqrd/1u8shJLABkuhdPtbERI=;
 b=SlfmeIXkE1sGLODS6jb4C84zkVeISKL75KUYqDNDfDs5zfgs0rCSH86UGUxrxYmjyNJepZPZOTbzZhyc4ChrsInTOTb/VDI+l8HaVknd4czEeqiW3FUxt98HfaddUTjM29VsVDtvjCBTDHueWvzuw0Gocoo2afLre8OayrEY59fay1pKxAiDsRyEXCA4zUFunLxIkQ6r1UQjjibEm61sE4yXvFO2mE/ZoO76hjHTSeYQax7nsNNiJdklNu/YO2O4TGxYsEczh7LjmJIVBXjDBvrQCj9TFyj1xkuNmu27IkT5fiOGXqHT7+24NAOCS52fD6euvaIsgUrGlz1GW9ekyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXa2V7OYMORL6Y9ATroOqrd/1u8shJLABkuhdPtbERI=;
 b=xHnClpKFlZKCw9ydhCfQ79s8BprCiKK6HvSjTcz7mAE8ar3Eu4zVrw+4xqTjK2Jsl8QjI8gek2sMzwB8XybtuAjFwEc0iVEhox1n9g/RwfWMLFfIZtExylPCuSHTUFNBPEIw/u2lTQhWrTtHvQF+1mdO08OUjvVDuD8+aF+uWXE=
Date: Tue, 30 Nov 2021 12:56:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Kevin Tian <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 02/18] VT-d: have callers specify the target level for
 page table walks
Message-ID: <YaYRVfa214KY7P+4@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <6d01a401-ac53-d4ca-e0ac-165d045341af@suse.com>
 <YU3kedkf/mSsGcpD@MacBook-Air-de-Roger.local>
 <91745efe-129b-4851-87a2-93eea8f6d63d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91745efe-129b-4851-87a2-93eea8f6d63d@suse.com>
X-ClientProxiedBy: MR2P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32c93316-e727-4cec-1ab8-08d9b3f8662b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB46039D2663F73C6FFBF26BE88F679@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fSdRtyt5IWP33kqgczocJ4GtImtBcTQXx5SN/oK6oQh8zUWkjdbo4Mamy2ZRJa0CUihoVWdwlzSpWUFtoo6zsEenTe4JzCvtPndFzybLWtzqy0hThXQkhsZezrXJ673XnOYPfRHw8ybr2cB3/w3LqikgutWXZzp0mTDjKflfCi+wmHx0BD+NbvRPVhXH54ZfO4npW6LspGF+3Ft0RnQeYeFwsCTOzUdfBvlWKehR38Sf9soS3rlTuCosi0C+PQJAdiDUn6ffav+FsRGbCAloAB11gJNXVAFHUV/9Yz06zGRKWPXv+/BvSPNFRljBwtl/qwoOO4vEom/n1Aj4BNJIwdWygAS27SypVf3AzwGbXVUgtB9eKRNgu+lh7Lc2hTS+xnWNOF6e2WFraOAXPE4pMBmzFVzELEOSAbCxfEdZ5iEasq5HRE7LI91Foz0g9PtoTaSvfoe5HzF5VwvHJvlMOK3z8i2PbM9lWaBKtzrtZG6S26ozBsxwMMagnZzCvTK7TO4pLyeDvIP1V7zI4l5MuEYBjzh+J91MV7K+ahgOU8omVf6+n+6doXy3fPpj5DEroo54C39nPjyN21QsQlY5/k+E5VyMxPa95HTGf08qXdcJ8Ec/Ry2w1j30dHXrg5CCQuW/CfnsC7LEl5aLryWZN3Pqt/qWrDyAjzsNpSIpZSAWKA9gfK2thEWPd6rsyFZh5+2ABuzjG4PloHMQrnnClg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6496006)(316002)(9686003)(66476007)(8936002)(66556008)(8676002)(33716001)(38100700002)(186003)(54906003)(6666004)(6486002)(82960400001)(83380400001)(956004)(26005)(508600001)(85182001)(5660300002)(6916009)(86362001)(2906002)(66946007)(53546011)(4326008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cURKTTFVcnNSbXp5SENWMnRMSktncVFibVRETVBTQ1g0NXFEY1pNZytNRmd4?=
 =?utf-8?B?SEJjS3Y0RVNpNW5wZFZKV1ZURGJlOCt1ZFNPK1Fpc3BQVWwxc1VJTThJb0pk?=
 =?utf-8?B?UGhpOFpnWDgrdGsvVmpMclBaeEdUUXB0YjFqY215M1kzUDdzM1ZMdVZpWjdi?=
 =?utf-8?B?VGdLU1JVekJQY3dUaEh0ckV6R3o0K0ZDdWNaVWQzUFczT3l0OHN2MFNrdU51?=
 =?utf-8?B?aHFBVnpoZ1NNL29zajBYcUZVYUVaeU5MdHMzMUl3S1ExSXpVR0c5WEs1a0J4?=
 =?utf-8?B?OGVzQ21FSWJldVlZYmFyZkFDZzRGQVdIYlNXck0ybU8ySHI5RE5Sb1ZMUGN1?=
 =?utf-8?B?WXluYUlkeDNqU1QyWEUxRnUzRWxtZ3FkWVUxSFF5V3Roa2plMWV4S2Q5MWVU?=
 =?utf-8?B?NlBkWkRKdHVITmIzYlRJaStGWDk4U1RzeVMrOWpFYUM3b3RCeTFUb011OThW?=
 =?utf-8?B?eXNVc3daV1Q5UEJ1R1NlNUYzbUpqNVZTK2RWTHJMLzY0dVl5S2s3VWZaMFdi?=
 =?utf-8?B?ZWdZSHpOVDZRaFFrdWt2Wkd5YS8rOWF0VThaZmYrODhYTUFiOG4zOTZzTzRZ?=
 =?utf-8?B?cmtTRW1FWmNJMVQxeVVyd2tkRlB6cDJmUloyU3A4bDBWbnN0WGR4NnBxTWxn?=
 =?utf-8?B?V1ptR2ZWNEZTN3JHa1hXbG5nVnZuaFgrYkN1eUI5NW1pREpMVTVSUHhEdmtC?=
 =?utf-8?B?Uy93clJubXhWaEFzbjVnZmhEQWpicHlXVFBuaVc3ejhHRWhsdWVOT2dPQitT?=
 =?utf-8?B?N2ZIblpNZkVrQzBvK242UmUrVmViL1Nlb3Z3ZGZjWThJb0lpWFo5dFZEUFRC?=
 =?utf-8?B?aFM0LytWdVdjYTlLQm4zOHIvN1RPZHlPek5NQ1dNVi9oUlNacEJtbnFlNXF5?=
 =?utf-8?B?alI3cnpTODRtNVpGRkpVdjR3SmNqaHVMUjdielFJZG1BMElELzBTMTZuK3Nr?=
 =?utf-8?B?aElhSDRaNEFOR2JqV3dIcGtWbS9GS25CdCtKZVlFR1hQRzlPQUF2bHl4Q0NM?=
 =?utf-8?B?cHFmNkg2Y3JJU1BveC82azNRdUNkU0NSSFc5QjRCc3FSeDNPRVRjbWQ1a1FC?=
 =?utf-8?B?L1BaMTFuODFXT3lQZ25DVTg3S0Z4R3FQT3loMVFFS05OQk9OZXNkK3RzTE5l?=
 =?utf-8?B?OE9xWFlYL2RtUWdHYWhsYkoyNmlCNnVpQUFrdHR2eFJ6YVBoSWg5ZGZLTFYv?=
 =?utf-8?B?YzBiNUl1K1d3VElJQ1FOcDVOLytVU09DNkVNTTJDOVpHY1RtNUFNZGtyQU96?=
 =?utf-8?B?S1RWOVN2QmpQdXM5c1R1eUF1YmV4d1R1cWhwdXpBY2oyMWhvZU1iamFiYnR3?=
 =?utf-8?B?ZlYwK1dTTHRRck80ZEUzUllxaWo0Z0NyWUFtcGJqdC9DVUgyY1E2RW05OC95?=
 =?utf-8?B?Ym9JMzlCcktKdnY1TXlSdlFDTVFjdDdTbXVEZDU5ZXNVNVV3OVQ1RVRPQjBT?=
 =?utf-8?B?Sk52NzBUOFhrbCt5ZUZpaU1mSVZMU0NXRUhtMHlUSUY2UFFNTUFpVVRzUGp1?=
 =?utf-8?B?cGdGajhFSHgrd0o1dERLTGw0TndmZURPbEh6eGtTZGVtVlg4MG0yVVN0T3RY?=
 =?utf-8?B?OUJ1TDgrcU9TUTFXYkNxOGhrbGRQQ0RaVHhmanVpTXRmWGEyM2JNSHcvQnZY?=
 =?utf-8?B?K2h5UDJ6T0VENE5WK3pRRmZCZCs4WlUyK3hXV2ZISU0yQTFpZUFWalh2emZM?=
 =?utf-8?B?NXRNR1Z3MitaeWNHellFUmZQaFNnbEd1MlFzajllRkJVRFE2RWpnOEh2Zk9S?=
 =?utf-8?B?TlE5Q0lBbnNSdGwzNG8zUC9wNDhZVU1kWDdLMWVhamtYazE5RWt2K0YvSU01?=
 =?utf-8?B?Ry9WWFdHU21ldDg1T3NGeWVCSFVLQXI5WHNNNWI2OFhmZFJrcTZWSTRnRUpL?=
 =?utf-8?B?TzBkVEN3TklNY2xjODJ3K1prTkNxUG9SV1NheVhNdE1GQU1CVEJFN1dlZXc2?=
 =?utf-8?B?Y1RJa3lianI2Y0FwU1lyY0JkTHJ5SmdKUDZzZ0xHNmdSZnhJMW1kbVBLUW1q?=
 =?utf-8?B?amVDcTRpM0JLT1Z3L29CaTBmQkE1UjIvV0dnVnZFbkpxVThZRVVQM0MvTzF5?=
 =?utf-8?B?eFhhYUh2SkF6dllZazVTMFZPbFYrRkJoUUdRNzZhdHo2NzJaeFhWMTVvTFFV?=
 =?utf-8?B?YVBxMzNUR0JnbVpJSVJiM3NGZ1ZCMkRNdUNaUWtFaStRNHZyR202a0REeFdT?=
 =?utf-8?Q?TulZTvHX/LlD7Tr/7zdeKtk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c93316-e727-4cec-1ab8-08d9b3f8662b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:56:09.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gARi1ZOelpvbNSRmv8jNuD2fu6tGp/a6WpCDAVHNdlS0AqtGf7g5Fsqn28ZbKteY9W2nA5ZwzGTHWhKAXOIzsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Mon, Sep 27, 2021 at 11:04:26AM +0200, Jan Beulich wrote:
> On 24.09.2021 16:45, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:42:13AM +0200, Jan Beulich wrote:
> >> -    parent = (struct dma_pte *)map_vtd_domain_page(hd->arch.vtd.pgd_maddr);
> >> -    while ( level > 1 )
> >> +    pte_maddr = hd->arch.vtd.pgd_maddr;
> >> +    parent = map_vtd_domain_page(pte_maddr);
> >> +    while ( level > target )
> >>      {
> >>          offset = address_level_offset(addr, level);
> >>          pte = &parent[offset];
> >>  
> >>          pte_maddr = dma_pte_addr(*pte);
> >> -        if ( !pte_maddr )
> >> +        if ( !dma_pte_present(*pte) || (level > 1 && dma_pte_superpage(*pte)) )
> >>          {
> >>              struct page_info *pg;
> >> +            /*
> >> +             * Higher level tables always set r/w, last level page table
> >> +             * controls read/write.
> >> +             */
> >> +            struct dma_pte new_pte = { DMA_PTE_PROT };
> >>  
> >>              if ( !alloc )
> >> -                break;
> >> +            {
> >> +                pte_maddr = 0;
> >> +                if ( !dma_pte_present(*pte) )
> >> +                    break;
> >> +
> >> +                /*
> >> +                 * When the leaf entry was requested, pass back the full PTE,
> >> +                 * with the address adjusted to account for the residual of
> >> +                 * the walk.
> >> +                 */
> >> +                pte_maddr = pte->val +
> > 
> > Wouldn't it be better to use dma_pte_addr(*pte) rather than accessing
> > pte->val, and then you could drop the PAGE_MASK?
> > 
> > Or is the addr parameter not guaranteed to be page aligned?
> 
> addr is page aligned, but may not be superpage aligned. Yet that's not
> the point here. As per the comment at the top of the function (and as
> per the needs of intel_iommu_lookup_page()) we want to return a proper
> (even if fake) PTE here, i.e. in particular including the access
> control bits. Is "full" in the comment not sufficient to express this?

I see. I guess I got confused by the function name. It would be better
called addr_to_dma_pte?

Thanks, Roger.

