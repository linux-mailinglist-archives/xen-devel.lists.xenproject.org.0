Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B098749B844
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 17:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260498.450080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOOz-0001kY-0F; Tue, 25 Jan 2022 16:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260498.450080; Tue, 25 Jan 2022 16:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOOy-0001ie-SA; Tue, 25 Jan 2022 16:10:36 +0000
Received: by outflank-mailman (input) for mailman id 260498;
 Tue, 25 Jan 2022 16:10:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCOOx-0000lY-6G
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 16:10:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51f39521-7df9-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 17:10:33 +0100 (CET)
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
X-Inumbo-ID: 51f39521-7df9-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643127033;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Xnm/A9ZUYx5iWxsYC1c7gYYoZ2za1KOW4ja5cx+8yz4=;
  b=cwT1mQ7sEEZePYGF6O+h1QsxsBsZGGtA9w6jDk44DAT96RmHIWM0Xgv8
   OxTn2mI6OyXngzX4ROEUwfmQL8UVFk6J8BoWgE3FpwTsscJwXMczlnm8G
   VJXoo9c0ZVwlN6ciBSo5oPi2w/aDTdbW+PU31GhuCASaYBN8LCkg53e5Q
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: p5Ok9xtZGr28+I8VP3P+w5liICnK1Fjb2sBc963f1J4ehNsDEhU7g2RDSBm7VDDKIRY6/sPDkJ
 5sLEDv1FjJANDsC1VRTuthtHo73a+stKQ6k7GIK1OyaTgiKP0U0kB47iP+k9dCREiWKZ4meNg5
 vaw0FC0kXSQZ8ANtbmNHS9YAzL1bF+vAkrv9s+NYl87kmOT6rHI80RKHZEKDiwu6w6eXG1r3ZJ
 K57JHqi+RJKPBbqkSB0GK1UD76i9jnieBL4sOsvoqXu8sSAPchQDLCc8Y7RS+J8VcWMr2tB7MD
 XAQvjT3X1GMFffS9NjzhYF0T
X-SBRS: 5.2
X-MesageID: 62645065
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fXAbhK9hxgnut9UIz8phDrUDKHmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 zceWDrUM/+LYGGked51b4XnpxwAvpCHnNVrQAc6rS08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhw5
 fhSjKX3YzsvYJaLo9YPAylbEz5xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhmls25gQQJ4yY
 eI6bhtfdB37TiYUMwYrItFlvuPwp2bwJmgwRFW9+vNsvjm7IBZK+LrkNdfOP8yHQ+1Zn0CXu
 WvC+yL8D1cHN7S31jeEtHatm8fMkDn9VYZUE6e3ntZyiUCX7nweDlsRT1TTifu2kEmlQPpEN
 lcZvCEpqMAa9lGvT9T7dw21pjiDpBF0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehgNfBFTFp9rqPRhqgGqy89G3of3JPdClbOHFCHVBtD8TfTJ8bjz/iUe9aV4SJiIPOXgrC0
 WC6ryghiOBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxL1WVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxe0O
 Cc/WisLvfe/2UdGi4ctP+pd7OxxlcDd+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5r3VSpLVvs5nWvuLwv47VPN7npirY80bcujpylLLJLEPCLFIVv7GAXmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChQ7AqZIRW3m2UMTXMisw+QOL7brClM/RAkJVqGNqZt8Jd0Nt/kFx4/go
 yDmMmcFmQWXuJEyAVjQApyVQOmxDc8XQLNSFXFEAGtELFB6Md/wt/9OLsVuFVTlncQ6pcNJo
 zA+U5zoKtxESyjd+iRbap/4rYd4cw+six7INC2gCAXTtbY7L+AQ0tO7LAbp6gcUCS+76Zk3r
 7G6j1uJSpsfXQVySs3Rbav3nV+2uHEcnsN0XlfJfYYPKBm9rtAyJnyjlOIzLuENNQ7HmmmQ2
 TGJDEpKvuLKuYI0roXE3PjWs4ezHuJiNUNGBG2Hv62uPCzX8zP7k49NWeqFZx7HU2bw9Pnwb
 OlZ1aikYvYGgExLo8x3FLMylfAy4N7mprl7yAV4HSqUMwT3W+04enTfhJtBrKxAwLNdqDCaY
 EPX94kII6iNNePkDEUVeFgvYNOc2KxGgTLV9/k0fhn3vXcl4LqdXExOFBCQkygBfqBtOYYoz
 Op96s4b7wuz1kgjPtqc130G8m2NKjoLUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ1PjYmrBR5kveaH5iR3HC0N1UiYkKpB0XnkQJIE6Em4adi/I6tPGLHe/bkuiBIs177t9O
IronPort-HdrOrdr: A9a23:arCmVqkI7GZtAE6w8iDvqhlcltDpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y5I2mePVmGJ6VNN1xMPdfNVa9Mi4kEFjiV2gPR5t3ck4klfbMkccIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="62645065"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0IKKMc0MsGzrcbdx5HpalB3vUghNDgSi3+zeti43D9I3VHMBOOjqTpMdpPBRGMwBegTCdzWKjk1gNu0MH11jjGu0YVhNYoY17fdCLJafXEohDszF4INJbemryGqw+5IZadCvZhGaTbCyXkJciLMFzOxLgLKrJ49c9Ll/as1WARo6ZQfLfYMwFVPDFCNNURJ5KFHnpPeWmGZ4RA9RzPGvYqg5sgyJ+4mRLj+y07cp9PwdrRP8cqoTcT3XaGjBcM53Jv7wIWGXAMkuY22UKIJv6+WOgx1io3bTSUaEFWJvEjxkVX9ysOCrWq0Rt1Rj9G6/hq11QW1hohkNPhtlcZBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ljvA3kACGl8STvB+5+votPIQDy9fLJeYzt6cZLnXs0=;
 b=OOliIXODX04w7jobndCXhLRQh/gqpHam34Z6sE9kVEJg78cpGhmT31nfYZ6pcGy5XSV6h+tqHmUmNtdHMkyasSe1XJ4+gyjD4Im+U5/zBw+7cooHMAerLDQ6JqqA9/BK8Y40iV4x+MVbHE6IyDISx9M/9lslubaGkyOfmSe2L6NU0npDHPrfMNZU8cv6y0Jhjj6Q7HIemTn2dG4H/BtUfi4DVVDxn199ARj7ZxPKXj0mWrVVd2pwUqXqX0jmxsEYcOZxHCAOa0FUBxWNL64pQKBnKYjwG6bkrRQ7urAVROIWwbTHSMS257rhJpLu7J78W0gvhTJytWh5ZI+QyucEpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ljvA3kACGl8STvB+5+votPIQDy9fLJeYzt6cZLnXs0=;
 b=BF2xF0W32WvXEkYktKqBV6su9pnHwv3Vg93TQOjMMPqPUCK4uboNM+/+/Am2T458BtynrQ17gfojfryzGPIB/2OZquQ/UH8umm+ksqw/YSdBPRnFAc8bIm/GyLEqUQPCbIbsZpChVmwH93dHltQ38RyomvSjXCQdJw2coLOVG2c=
Date: Tue, 25 Jan 2022 17:09:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, James Dingwall
	<james-xen@dingwall.me.uk>, Wei Liu <wei.liu@kernel.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH] libxl: force netback to wait for hotplug execution
 before connecting
Message-ID: <YfAgsat9NY+I0WAA@Air-de-Roger>
References: <20220124160248.37861-1-roger.pau@citrix.com>
 <8644d37a-49aa-8d9f-03ea-955d97a1cc28@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8644d37a-49aa-8d9f-03ea-955d97a1cc28@xen.org>
X-ClientProxiedBy: MR1P264CA0048.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f41af76-c4ea-41e9-06f4-08d9e01d0f72
X-MS-TrafficTypeDiagnostic: BYAPR03MB4645:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4645A6D552969568A84609DE8F5F9@BYAPR03MB4645.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qJLfMNgQZ63hLTJpb8FcJUTJflNhN4it1DDdFYpL1tu4nRZbVeb6Z06bUqkBrSaKGBROVsDhuOR12YS5/HSAhfPucWt/wJuE2bz5oyfY+araYbQl8UnDzL95kGZuMB/TeSpBoVnQZuqdjwAcxWxSeTNvGcQM7UmLI7/Qu3hvFegkmXMVpZPgE3y5FOAioMVe/j8CMKzMy7Yo2XwxfI5FsCqC2mtY4KQMFV/dMQ4G2fK7T2EDRvIK/d54BPGWpcqG3UK12LaFsGgG0jy65M8o31p0XU3uPpa78jovEERCUwgco1OCuURml6e2+fZJ3HEScAm3vocRBWrF7n4nGew1P7SMJI/BuFsP1sm+TaZJrNxcSAWEEmtWKiR0cpMaqrGxCkKphKdtUM5ObJ1xbeiyaSOyKC6dJFOzF1c48fyI908aw2nb3zJK2KDbMQ87abUDgYxVCqmjyDVqXqkeZK3m/MlQWqWFWYpatE5WjStUU5n3UGM+VDt1OtUYiOnQbwlma9mOqY7uOzvJMY47OeyjNkp6sTd/JintPpJ6EXMhS4MRPTzGIuvZJf03LXp7rxVV+vLvDKsqmRB5RgYZHY6TH5vL+I10urmXB+z17tU4gVEptlDi2oXaQlSKw68sC9yz/lKNTx+QmdA2DFAyiDj5RXllKrOevUOhob4+4XXKvAI6u4ASEX+GdLXj9KvyjWNyEXZ77nZPMttm8lWDrDWlSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(86362001)(53546011)(38100700002)(6512007)(186003)(66556008)(6506007)(8936002)(4326008)(9686003)(316002)(6916009)(54906003)(6666004)(8676002)(66946007)(82960400001)(508600001)(6486002)(2906002)(4744005)(66476007)(5660300002)(33716001)(26005)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmdmNHhTQzhNVGp6bTFJNHhyRENCKzl4NXVCUFJXV3NlTXkvT2Vna1MvOVJP?=
 =?utf-8?B?cUs3b2lIbi9ycGZPbVBtd1o0OExER0s0QjFWNENlYitKL1pkVnIvK1BhakVW?=
 =?utf-8?B?NUJUK3h2QTl1dk0rcVdnc0Z4UXFhMEpVdDduaGh1RVpDQ1FvY1crcFJjQzZ1?=
 =?utf-8?B?T2xud3pKVEpTU2tuTXZrbjZOZU9SZWdocmFMb1FLdWdYemxrU2dqTjNidWgx?=
 =?utf-8?B?eUVzaGtxbFdabCszU3lFVk1JbFNwWHV1VkJLM0NMYmNaM01zSDJJMlZxLzV3?=
 =?utf-8?B?RjdWd3lWZGVid1BVbC9yQzJiYjFwRmJxWnBwQURGMy85d3kxL2RhbWdrcWlh?=
 =?utf-8?B?QXFPWWRjV0lnMnpyQ2EyTHhMQTdHUTl4VHdJR3k2NzlZemJRVnd5M3Y4Smoz?=
 =?utf-8?B?NjN6ZmF6R3FNd3dWYXY1YXowc3pReWxxM05WbzNWdVdoQ2NIcHBWdW9KS09Z?=
 =?utf-8?B?WWlHNDlXaDRQOEFSbGxkcHAzZUNQYlJ5cCtmUHdHaTFVU0syMzZQWldKaXIy?=
 =?utf-8?B?cU5IdVNIYkJ0aU9hRU1aNUJKS2d6Y3k5RW1wMlNnZEpqeGw5Z1Q1cWlMWnVm?=
 =?utf-8?B?Z2ZoR01NcmNrZXJxc0lrTUw3VmRqcUg4RE5LZnVPY29DMXhqb05kdC9lczlp?=
 =?utf-8?B?MzF3eDhjb01XdGpRaDgveHFyNW1FQlhibTIyY04vNVFUbU05RHBMd1dLZ3dY?=
 =?utf-8?B?eU5CV2hKYVRsMWxnclNTWC9sTnorN0poa1NCQlVMby8rU3E3ODlLVFpkdkRN?=
 =?utf-8?B?VG9uSHovSyt1SG1hM1BKWnkvSHNNRW1RWjRRVktHc0ppVkc5aU9US29MY013?=
 =?utf-8?B?VWJURkFtdGJBZUZRK21sWjlqN1FncEF4SXQ1dThlUVRkSnZ6WmRBb1FRVlZv?=
 =?utf-8?B?SXpPQmhGUTMzZlBmcEEySTExYTJsNjdPNkxGNkhuL005dUxDeVdtUnhxYndl?=
 =?utf-8?B?NDgwdzdXSkFwSVhNb2d3ZXd1UE45cXk1b1g3ODl5Y3cxVkRoVWR2blVNMmV0?=
 =?utf-8?B?WXhvV0c0aXp4dW5KTE40UHkzblBSNTVGeTRieDBNT2RyZlduZU9zUm55TGVx?=
 =?utf-8?B?eWpJS1lsZ2o4aVREQnNNS2pBNlRxZzQ3ZUk1c2w3bFo3a0J3UlM0V2gvTVc2?=
 =?utf-8?B?Qk81RnB5dWM1cnR3bXBIRFVYMWFJd3ltWjR6VzVLdzdwZnFYVXdsNDdVTi9E?=
 =?utf-8?B?TzJBeWVXSnFHVU5nU2RXQ2dYb1ZwanZVRFRVTmFzdHV3dEppTWRFY1U5TzVj?=
 =?utf-8?B?UmcvZW03SUNSRm9reEljWmp5TXdZVFl1SWVaVHF5dmlmaktoTmN5TGdiOU9w?=
 =?utf-8?B?U1c2NXFmdlV4UjNPTTZGWXRIQ3d1WnZ1T2hidVdBM3FlNHpRWXo1Sy9BaEhP?=
 =?utf-8?B?cVZVNldmL29qbW9RdVdzVFVSeVF4empXdCs5RzRJdjlacEQwNWRldVA5MXA3?=
 =?utf-8?B?dmhEUnZzMWJ5ZzZFbDJ6WDVrRDgyajdleHpEakdoMFNZcHZYdmFrdW9pN094?=
 =?utf-8?B?ekVEUm9pRGFRSWNEU1dtUURQR1h3VzdaamVxMC9EQTN2TG1RT2Z5cW1wdjhq?=
 =?utf-8?B?b1B4eUZ2QmpMSkVNMFEzN0svTkhVaDU4cHJkenFhZStyQUliRDF3dEtETnY0?=
 =?utf-8?B?Z3NOTnhHUVU3MXg4akdrWnh2cCs2S0lycXYwNmpybnpTRFJvcHVwWWNHTi9C?=
 =?utf-8?B?UTdReVE2N0YvRWhudW5lcXVRUzBudllFc3BYcVpNWXFoSDVDS2dGNDE5dGRp?=
 =?utf-8?B?U1BBeWVmNHFUcHJuZGp4ZHFqOE9PNm54NmZoMkphNG8zZFpzMVNLZnd1Sllq?=
 =?utf-8?B?NU9UOXdLSk0yTVZyQk05WGtzeVY1NHNUd1FHbzFHdUNaRURVMkNIVFdCaS9S?=
 =?utf-8?B?cE5tcCtxTysyakVUQkxKT2FxZUVBZVpsZGdzdWNQTFlBcWVEZ2lJL01UZjd2?=
 =?utf-8?B?cWVjcmx2WXZ1VzY2cXBkT0c0Q3g5dzVISzRzM1RqM2l3U00vc3Q4UldWWjBW?=
 =?utf-8?B?Wkt5bStyaTMzbnVSTm1GcUE5MUYyUm1wT2J6VS96WThYS0Q5eDgvU3VSZThY?=
 =?utf-8?B?UEErbVdCQlBZbHlYcC8rdGRHa3RGeFpibXE3cHk2d0NjRnlsbnF2RnVOTFp2?=
 =?utf-8?B?Q1oxNjBnQjVFOHRRTVMrZUJLUXpLZHU2blhtWnpJMWlNaUdYamhSTHFXNkZ0?=
 =?utf-8?Q?Kj8EH+5bsbsL+VYYcLcgfSM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f41af76-c4ea-41e9-06f4-08d9e01d0f72
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 16:09:27.0096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJiMpQukQ5CGMk4WiHUAb5hEYXSWuazgsVaSZPHb1u7f9CaiNoJ+BjZ/rsuhMjMUt/31MLMNgSGwRvo7XYeCEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4645
X-OriginatorOrg: citrix.com

On Tue, Jan 25, 2022 at 03:32:16PM +0000, Julien Grall wrote:
> Hi,
> 
> On 24/01/2022 16:02, Roger Pau Monne wrote:
> > By writing an empty "hotplug-status" xenstore node in the backend path
> > libxl can force Linux netback to wait for hotplug script execution
> > before proceeding to the 'connected' state.
> 
> I was actually chasing the same issue today :).
> 
> > 
> > This is required so that netback doesn't skip state 2 (InitWait) and
> 
> Technically netback never skip state 2 (otherwise it would always be
> reproducible). Instead, libxl may not be able to observe state 2 because
> receive a watch is asynchronous and doesn't contain the value of the node.
> So the backend may have moved to Connected before the state is read.

Right, might be more accurate to say it skips waiting for hotplug
script execution, and thus jumps from state 2 into 4. Note I think
it's also possible that by the time we setup the watch in libxl the
state has already been set to 4.

Thanks, Roger.

