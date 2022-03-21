Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFBE4E2449
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 11:26:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292895.497420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFEZ-0000Nd-Dw; Mon, 21 Mar 2022 10:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292895.497420; Mon, 21 Mar 2022 10:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFEZ-0000K6-AZ; Mon, 21 Mar 2022 10:25:55 +0000
Received: by outflank-mailman (input) for mailman id 292895;
 Mon, 21 Mar 2022 10:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpaY=UA=citrix.com=prvs=07205606a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWFEX-0000Jy-J8
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 10:25:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4755ad67-a901-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 11:25:51 +0100 (CET)
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
X-Inumbo-ID: 4755ad67-a901-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647858352;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EwPw5nBE1V2lD4KRSbb+iLziMRw8K2DL3YWJngVuz48=;
  b=MbKxoVufeLwJpiyhRqc0+3d672PP4A+q9Q+kzS/JCBFO7oHalqobrqge
   1rrfZKp87MzH1niqLcH8N8R4m4n9cdGfyc0Zf9qMJf+dplc7a0acqLekg
   GWcRRSshM57ZtItdlfanMfwO7+OTTYNHuFyBKw299+4uGJSvYo00cw1KJ
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69116457
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tnmweqBy6qHJbxVW/w3jw5YqxClBgxIJ4kV8jS/XYbTApGgmhT0Gz
 DBJXjiAPv3eYGKnKYsiPd61oUkHvZTQx9BlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vj29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhD5
 tB25LLhUj0sHYyLhrQBbgVYFnBhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGjW5p2JwTQp4yY
 eJGThw1MizLeiFLM09OCtU4rP6MwVbWJmgwRFW9+vNsvjm7IBZK+LTqPdDYfvSDQMxHmUDeq
 m+u12bkBhAXMvSPxDzD9Wij7sfMmiXhUY5UC7y89dZtmlSYwmFVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQO4IsfRna20x7
 FqqvpT3VSBSrL2QGG3Io994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
 xjP9XFj3OtL0abnwo3hpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDDt4ji7rnXzURhpdnh+5nzu5643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK518OtMYLZSL6NPQmC25UNyjN5fK9fekJq9iONoYeCnSPXFHvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQtTfCZhWsyu9ZA/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOmHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:fMxh667jVlrE4Z2PzAPXwSyBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cNzp/8tHNFA7dg6ML6K40z2MFvx2TGpUBza/J9uAQO4l3ew2sRz2N2X
X-IronPort-AV: E=Sophos;i="5.90,198,1643691600"; 
   d="scan'208";a="69116457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsBTq0i/rawIP5dkLvvAtHAxEhITYN/8itMdCGwbaWToe8mI1noncL7V0QXBkkrWzEPHC5wQN6zkKIDdCgqOwdKoW7kc/TazEP1aZcDGJL8MBjH0IGS2BRD3CKI9LAhMdhoAOs9S/gSueje/91iS7XmAm2jqxHO3e//DENXhKOaJ5OOaNCFxTfCzdw/8i1Fv6zDSMiO/4S63nYZ3jkQbItA5HeWZfHcNljcLGY8ZXyH+MMwW7BPrICmpXzlZualcz3fKClkh7Iluu35CD4sE+TOpJ6DOd/iM/n0RoSuAup4e4/zJWC/iHFOtngKZ19cfXpCXryc7Js9aoRLz/URcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/OEFbRNgjxpheFo5Iez2tzgxUucqboVBeNXDiGalCg=;
 b=TIuTxyVg8HFnPamjWWo11fhV911xPu5aIwG+yvPfRkR8TXn4HpTI2I69eBN3O6LWxDBoZe1VeKiPfpUlV+mYdiQ6EPZbMfGl3meAxD72AWo0KUxPBLzP7mxkbZJGAeYOYnbgBwHgkhGVBrhGhOdIBHM9YAxUDcaZewQ62E8X0mNLvWkC7nWEFB5V5NLpuInVebj79CBv4dYFvJ+cl9CfT2oI+gnjgqXzSUAHww0NAseA/vzcYU/gcQBDbqbXycVULpU0K6tlROj9nTIwc81A7hEzpiIHXx5evRKhnb6b29NWIG/DP7Erwtq6C1DpUgqDJq+rki0EPj/KkvQWMWKM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/OEFbRNgjxpheFo5Iez2tzgxUucqboVBeNXDiGalCg=;
 b=T8A9gLujePMHFBEK9sz5knbJJtgcGp8qhSqrICzYPXHJf0mRNdu8CTHWCl5L65Q7YE61DpnZLgNBctT0n6y5V7R+6xJIdY5jIIbNeLgC5cBlJ0FLMzqdVSFA72R60JUQAv5icZc0fqF8wrX+lVvdRdJP4PNYYnXG3rjGfNFsNmg=
Date: Mon, 21 Mar 2022 11:25:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"doebel@amazon.de" <doebel@amazon.de>, "julien@xen.org" <julien@xen.org>
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Message-ID: <YjhSpA8CkkxJga6r@Air-de-Roger>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
 <32b098c1-963f-2e03-84bb-c8db410c8554@citrix.com>
 <Yidtuq8YUq+SbY7C@Air-de-Roger>
 <3e285745-9cc3-4f9a-ec27-fe917faa4547@citrix.com>
 <YisJS9ITWTpM7bYj@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YisJS9ITWTpM7bYj@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0373.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55d8d9b2-0cac-4f89-4789-08da0b252824
X-MS-TrafficTypeDiagnostic: SA0PR03MB5578:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB5578B51CB8CC2D413112D2968F169@SA0PR03MB5578.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /VEph4wOnyMTy58qcCFw6RlJSHqZhLAtgAyY7N6e+q5TGA6mdY8sIEZT1FCX2BIfcC0yw3D/VVzlsANOJdoMgd+dfyZnnkLI7ASF8kOEJItiHSZAOVFErLpeNOUEiGcY1cmwgBN0JBa8yZb8qGOFnv7fGxbPdcnyicsQxYPWZ0+lEhjnuKX9MbVemiHhWAXhFqSkEr7vOEy8fSDfaBPVvTqyDnZXfNJEZJzsE2cr9nPFn2w18MKVoku8yOssYQy6OOUtIIZJEFZoNEtPlwLgpLCmwTsb76lx5BEWU+Kf1JmTymlTaHjbuCowIBl3jFF0Ult8TYaW+VBiaYqsQ7TBSV9lyI9ytBPA4A6XSz4xT1QdwZhsjNlsHwX61RBBVScEDpf6PSRM3T75AVkdFfMe/KB2uE2bJ0FUOvxUOzZ3yB83kaPyqcP51aC74HpPqgcha2Z9Sxj/vRXmYPcI5beKqNNgixnfewtbz5ryDv1lc9pH9eudU5e37qBlhrQJtP+c37yBFYSff6k+rcHocJIfCR4Km+jyEfZ1R6yjyqBN26y0nsF+8XMBKYNtas3U+NfnQgyq8wZRjVn57L4qzAZY2kLO8WzBmwCrvQ4CCAj81imQx4jkxRb90vEan57uOAgEWXf47/c+K52NNPFSQruyDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(316002)(86362001)(82960400001)(186003)(26005)(9686003)(33716001)(6666004)(83380400001)(85182001)(53546011)(6512007)(8936002)(66556008)(66476007)(38100700002)(508600001)(110136005)(54906003)(6486002)(5660300002)(66946007)(8676002)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk5jSkk2cnZWRXNtUDYrd0pjdTZ2Qml4S1R4cHpJYVNHaDEraVFodHYzZk50?=
 =?utf-8?B?ZWY3SmdRa254K1VacUt5RG5UYzBMZzlOWTQ2OWd4ZEtWYVlJVE12b3psc1pG?=
 =?utf-8?B?ZmNINmdWb3NmeFNuWTkxcGZ6UHd0SFNPRGFvSHJFeUVoKzJYR3NiRDJhSUhB?=
 =?utf-8?B?WjJVYWJFWXpSOUQ1eVpaR3JSNTVaK2NqN0VvUjFQT3BSbkZER0pRYTE4ME9n?=
 =?utf-8?B?VHQxbUVqRW5sUUhQaHdvcEdhSEFqLzl1UTFEVndxejNWYzdsMk5KU2FMMDNF?=
 =?utf-8?B?YXJqWUhnekRzazcwUnh4Tjczdml5UURHWUdJN0dwOWlEU2dvTFg3N1ZaRUNx?=
 =?utf-8?B?NDA0TG1CQXBZWHlHVWVUaFl0TzNEMTQxRmFjVWtHNnVpWmJnTkFQVFpXencz?=
 =?utf-8?B?TE4xMmFCTXBHUnpXeDJDQnE0SCs3NFFlNTh3Uk1TaGpQdUxCODNiSytkWFlo?=
 =?utf-8?B?b2Z4RFFjYThtcGszVUZOTGdBWTFJdHUyK2N5bDcvRnBzbjc4ZHhxUEM0QjZn?=
 =?utf-8?B?MTBpQnBOWXhWOUFseVc0QXVwYkNGTGlqOVJ4ODRCK3JYYkZOQXExMlFMSEZ4?=
 =?utf-8?B?c2lreDc5c3RMZDUvYWVNMEhBeWgwbUJrZllPTFd6QWh2bllGQkpGTlV4SmFW?=
 =?utf-8?B?SjdITDlDVUFOTnNkcDBmUCtkRzhyeHlaWFBnSnVYem5vMlRzNXJ1Q2U3QnpY?=
 =?utf-8?B?MHBUWW80VkFIRi9jbGRLbU95ck1HVlhpYUk3VDRMWlEyYzdIUjJsbW1pWWRK?=
 =?utf-8?B?UEl5UitySVVEb0VoazhEYlJqSG9YRkUyMXFIOGROclJwcHk1TGR6ZUNCdCtw?=
 =?utf-8?B?eThKZ0R0bDlUZ0c2VnJSaUVyK3NHOWtRUExnamJIRHduWUdUeXl5TXZYeXIy?=
 =?utf-8?B?REdXOVhDTEVBYTV6cmxDaE1UZ01JMUVCSDR3NURXYlBENU4rSURYSEhHMHlv?=
 =?utf-8?B?dUJIcEcvVnh6ZE5hcm4yaEt0M0NDMDE0NW5GZ2VrZm5qNVZIU3g0KzVKK2VW?=
 =?utf-8?B?UlA4aG0ySFRnSnppMlIxN2I0aG9HaTJyOU9iemdvQmhjR1MwTldaem9pUzg0?=
 =?utf-8?B?dGwyNm5TZkdKS01rcVRDUlVHOFFNOW80RVZiWWdoTHBCUnhzN1gybDlzQlBZ?=
 =?utf-8?B?WU5ac3VBcVM5cDMwYXUzUmFENExiZEo3ODNZSGFnaTBWMHJOOWQveXVMcmZa?=
 =?utf-8?B?VjJsQ3JEL1hGU1BiRzZaaHZGMTZNZmEwU29ueVYrckllN0FQRnRDSGVKdVRs?=
 =?utf-8?B?R0w3SzU2L2FqRWhDK2NBZ01MVVBRSnE1aXUyL3krNk5Gb2gxWW1jQURxckVX?=
 =?utf-8?B?OUdmVDN6bHNWZWFOSTRsVjBSN1o2WS9zMTRRSkRUY0pIVWQvaitleURtcGp5?=
 =?utf-8?B?Szc5emN5dTUzUUZUK2NmUWgxQkZKb09Dbk9ieWdFNGc2NURkWlZuTmphZ2FU?=
 =?utf-8?B?elExdU8vRHdGd0VKUFY4cGkvdjB6aXM1WTRzd2lFUTdzbzZqVzdSenJhNUZB?=
 =?utf-8?B?SklEL05aemx5WmJmUFdVOFNHWU1tNFg0dHlsZmtXWDRFcTJtZkxZeFdId09U?=
 =?utf-8?B?aDRRbHUvT1lRYUsrYXVIVStiU1ByN0huOG8wMEptcXVlN2IrUVVmRVljREl1?=
 =?utf-8?B?SUtOY3pnaHdhaW5uV25xdHVyWmQ5WkgvKzhpRFJpa2FMK1BWZGdQV0FyQlZI?=
 =?utf-8?B?NDFyTXBwbjR4MlBnWDU4dnhwZ09Rd00rOHdib2w1YWpKSWtJU0xuTDMwUXha?=
 =?utf-8?B?eUN0cVRHZXJRb3pWSkozYTZiL1FTbnp2a1BqREtjUWlsWVJsMlpROHk4R1Bv?=
 =?utf-8?B?V2UrMjVtZG51U3RNRSt1a0tZU2doVzEvb1Jmbzk3SWZsUXo0RnhzSzBRbVh4?=
 =?utf-8?B?a2FHWTZHK0dob29wSTZLeHVaWEQxazg5T3hQVnRETXN6K1FDNHgxclRkVE05?=
 =?utf-8?Q?FQvd/8dLvPoy4mC/V2+H9S3/b6tth7uB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d8d9b2-0cac-4f89-4789-08da0b252824
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 10:25:44.3239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xElzoen6pCELw8IARJYia9hDcJ0O57zhOOIetruEXhHZAKL6kO2FW/8I1WPef+/RjtZuWAGNJlKUAjWB12szNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5578
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 09:33:15AM +0100, Roger Pau Monné wrote:
> On Thu, Mar 10, 2022 at 06:01:48PM +0000, Andrew Cooper wrote:
> > On 08/03/2022 14:52, Roger Pau Monne wrote:
> > > On Tue, Mar 08, 2022 at 02:38:47PM +0000, Andrew Cooper wrote:
> > >> On 02/03/2022 14:27, Roger Pau Monne wrote:
> > >>> diff --git a/livepatch-build b/livepatch-build
> > >>> index 38a92be..656cdac 100755
> > >>> --- a/livepatch-build
> > >>> +++ b/livepatch-build
> > >>> @@ -98,14 +98,20 @@ function build_special()
> > >>>  
> > >>>      # Build with special GCC flags
> > >>>      cd "${SRCDIR}/xen" || die
> > >>> -    sed -i 's/CFLAGS += -nostdinc/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/' Rules.mk
> > >>> -    cp -p arch/x86/Makefile arch/x86/Makefile.bak
> > >>> -    sed -i 's/--section-alignment=0x200000/--section-alignment=0x1000/' arch/x86/Makefile
> > >>> -    # Restore timestamps to prevent spurious rebuilding
> > >>> -    touch --reference=arch/x86/Makefile.bak arch/x86/Makefile
> > >>> -    make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> > >>> -    sed -i 's/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/CFLAGS += -nostdinc/' Rules.mk
> > >>> -    mv -f arch/x86/Makefile.bak arch/x86/Makefile
> > >>> +    if grep -q 'nostdinc' Rules.mk; then
> > >>> +         # Support for old build system, attempt to set -f{function,data}-sections and rebuild
> > >>> +        sed -i 's/CFLAGS += -nostdinc/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/' Rules.mk
> > >>> +        cp -p arch/x86/Makefile arch/x86/Makefile.bak
> > >>> +        sed -i 's/--section-alignment=0x200000/--section-alignment=0x1000/' arch/x86/Makefile
> > >>> +        # Restore timestamps to prevent spurious rebuilding
> > >>> +        touch --reference=arch/x86/Makefile.bak arch/x86/Makefile
> > >>> +        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> > >>> +        sed -i 's/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/CFLAGS += -nostdinc/' Rules.mk
> > >>> +        mv -f arch/x86/Makefile.bak arch/x86/Makefile
> > >>> +    else
> > >>> +        # -f{function,data}-sections set by CONFIG_LIVEPATCH
> > >>> +        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> > >>> +    fi
> > >> This really ought to be the other way around, by spotting the thing we
> > >> know is good, and then falling back to the heuristics.  In light of the
> > >> updates to the Xen side, something like:
> > > I'm not sure I agree. I do prefer to spot the 'bad' one, and just
> > > fallback to expecting Xen to correctly set -f{function,data}-sections
> > > otherwise.
> > >
> > >> if grep -q CC_SPLIT_SECTIONS Kconfig; then
> > > Because this logic ties us to not moving CC_SPLIT_SECTIONS from being
> > > defined in xen/Kconfig (or even changing it's name), and gain ties the
> > > livepatch tools to internal details about the Xen build system.
> > 
> > It doesn't particularly matter which way around the if/else is.  It does
> > matter that we're choosing based on something relevant.
> > 
> > nostdinc in Rules.mk has exactly the same amount of "magic string in
> > magic file" as CC_SPLIT_SECTIONS in Kconfig, but has absolutely nothing
> > to do with the property we actually care about.
> > 
> > Really what you actually want is
> > 
> > if grep -q CC_SPLIT_SECTIONS Kconfig; then
> >     # Xen behaves sensibly
> > elif grep -q 'nostdinc' Rules.mk; then
> >     # Legacy mess with Rules.mk
> > else
> >     die "Help with build system divination"
> > fi
> > 
> > The "behaves sensibly" case is unlikely to change name and unlikely to
> > move locations, but each are easy to cope with via `grep -e FOO -e BAR
> > file1 file2`, and this approach avoids the problem of blindly (and
> > falsely) assuming that anything which is 4.14 and later splits sections
> > correctly, and that this will remain true even when someone adds "# use
> > to have -nostdinc here" to Rules.mk.
> 
> TBH, I don't find the proposed solution is much better to what's in
> this patch, and as said I really dislike tying the behavior of the
> livepatch build tools to heuristics against Xen internal build files -
> be it a Kconfig or a Makefile. Specially because your proposed
> approach adds heuristics to detect the 'good' case which should be the
> default one going forward.
> 
> A better option might be to just make the 'build adjustments' a
> command line option that the user can pass to the tools, ie:
> --build-adjust and let the user decide whether it needs the
> adjustments or not. If I was a livepatch user myself I would seriously
> consider picking the linker script changes and backport that to my
> production version.

Ping?

Is the proposed command line option an acceptable way to move this
forward?

Can I have an opinion from the maintainers?

Thanks, Roger.

