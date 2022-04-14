Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74388500FA3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 15:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304772.519519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nezeO-0005ER-Mm; Thu, 14 Apr 2022 13:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304772.519519; Thu, 14 Apr 2022 13:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nezeO-0005Cb-Ix; Thu, 14 Apr 2022 13:36:44 +0000
Received: by outflank-mailman (input) for mailman id 304772;
 Thu, 14 Apr 2022 13:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xO=UY=citrix.com=prvs=09619e58f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nezeN-0005CV-4n
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 13:36:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9f123b2-bbf7-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 15:36:41 +0200 (CEST)
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
X-Inumbo-ID: e9f123b2-bbf7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649943401;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=C1Z3+dJoMo890gQGvKH3XPKMzlZoAmE19EOrtZzUCWk=;
  b=QVGUkWO1P92iwfE8i7tz1eLn7x51sqC+L1Nud1sx+IniaFg3TCcivWGZ
   gyWNQa0KfP1XTdUxvvYkIp+xq7BPv8X0mE3Lp927TT1MQRpe9nsFT9GHj
   G3EVELT3lRwKnYV4cC7LwMHVMzR9vY8sR8KxwKkIwgml7ZUV0kQa3gZUr
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 71370862
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:e59aLK6Rq/MrZGznDXnJGgxRtC/HchMFZxGqfqrLsTDasY5as4F+v
 mpKXmrXO6uPajOkc90gb4m2px8C7ZXRmoBkHQBoris9Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTgX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSvFyp2L7TukdgQXgJiMzsnPo1K2LvIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gRRK2BP
 5pHM1KDajyDXjxWZlEJFK44lbu0rFXFVwFAig6K8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc8UOPrIr8SOE9qfZ+Dy5HDEHbjJhbNNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb7
 RDofODEsogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0vdB0xa5hYImS0C
 KM2he+3zMUCVJdNRfUpC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLSnPHKGoNJJcAhiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSavxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:sfIl5K7F+5xcdEaCRAPXwSqBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUaqFh/dL5nUUtDPpZyfSKWMB26ffueChPaHbzYfJt3Tk4l7aSHpIkI2A==
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="71370862"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnbV/WSPOkDY9hWVPuYR5nZ3s5x85cdEFf/lY2owHVHnmLQnp2QhNQ+TtR+3bxP1SapYwZ1h5lSNdNOe7Nl888y6ulZHiUtROKlNwyY9h+XrT1n007ZIBb9408TvDUQNGroNfNN2T+b6GmOYHd48KJO+tn1riDwD249Cp0Zt5rDLeD7W3Nbnl+ZtGc6OKaWoid3hi9wr53SfsGIkArxhC3k20/KjFRsZWbXlB+eNx+mgxR/DTM8qLkzqiplk7lqJVxdd+YTYt870w8Il8oczPQv5YPYXYxvkBoHv3grXAGGX4p8LzPstF9lu0lqJu8xXndLq2WOuMtiWgakeD64D9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+kNO7bL8CTwu7FCOsLRrph/IcUFpoDLwm+j3dZN2xs=;
 b=aPajtMtH3zSmhsSV3Vq11jvkcvy7NFBvlpS+pRSIpnuDsqB5piMDATDUyBJwbeGB/19VtxskAMgCSJsfio9HPdos+qfKKKS+KCuTTXylcGNieECzmVV2tJM/p8JcHBPDUpOQ59gVCcyDP567nutPoMGxZZuDpo3wkvSQYAtk3fV3xsCtPYy7zPHnQy+hgeSz5JwBbnOp9A6h5Gecvj1NVLWaa+a/blBu3EJvyHyDfzsQnvUEUV3sOTdLwyNWE394wOKNZen/Xq+lZED2Fd/0Fl3RIxrd4y6xHlYA2770dviaXbA2AQyneCTPhcnmZJ3ivV0zM9Ayq9IgMJT0z59FXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+kNO7bL8CTwu7FCOsLRrph/IcUFpoDLwm+j3dZN2xs=;
 b=r/lUFJG3c3DuAMs4VQXoW8laiE4oY9WDKSn+bjfmCYDx6W8n3pwPBpjZSOwG0S8KCDLyzxxxETckIA8UV6r7p9FuC8pJMC9TaYonmOxf/1PnfT+s7nyKR2EIaq84xdiXN2TA9s853o5Fs1lzmi3rY+yU2xl7ZEVy2YA+l4pJZ1w=
Date: Thu, 14 Apr 2022 15:36:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86: improve .debug_line contents for assembly
 sources
Message-ID: <YlgjYMq3j4F0o+ay@Air-de-Roger>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
 <YlgWKGmR+u41zSsw@Air-de-Roger>
 <04f9bd9c-70da-0966-afa6-96f81e290204@suse.com>
 <YlgiLhvsKVYKKvrr@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YlgiLhvsKVYKKvrr@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c466f12-85e5-47a8-8daa-08da1e1bcc5d
X-MS-TrafficTypeDiagnostic: SN6PR03MB3965:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB39651D371C504B13FC5B0CA18FEF9@SN6PR03MB3965.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Trr3iOwAH3ZMcOEdu8NjLcwOxgevGXaz3EdqpGlxe+7gqbUGr7WwOjlrfjFcBZYVUvSwz4RA8BtLJTTGsPJoX75MIHubNAEtkx91itYryEzYe9XmZs6lfQgkzwlJ6wYdoxDVGurRvTH9z4a/gBLzX5mxkmZDCMGkUBXoP6maSDGJ0kgj7xS80+TZrVCUdyZVrEk24zqgGdLLQepl4XWRWZ+uO0WFqT2ha4kwvSGW/qWQkKYcxQh3Q2PqTa0ra3Ha6tLIM2yaoVkJISm4Ph7tYDpjs0JGHw9BEBWetP30U8KzMYLAWqAqWP+6qnoVoyzioMmherMNmOayeOXhbaQYknbtmcBEZausoUGoX7MIxZ975nZuk/zRZP9VSglmBPLTY3YfwdArFvDJzt67Pgwzm3RypqmBBaV69tY9EPI6iRUPeTkJWbO2B7QqUFgvQV3Eo/Ov8FmGKO1bQW/7kY7+4Ml0hyWDguYmGut8GPdKlq5b2SnFl5OuA+ts7+LMm8rBNAuWyVNOCxiuAXgcWNTscXb3REKBqMW56q4T8n2QaDlUx+MRhdElcbTH8QucCmJ30vmMeZ1TWPa9BVhGWd9MntRx4dar09XNpEC1X3S8SMK6dvHXFhWbK7JjVQt5Mm5nlXavp77xnvfqBvEUeFpp6XtbnxCR3x7Ld8Vv7biw6F2to5MBGz+fVw8FMO2F59O1UIj2Nfg0Q9Zj54ReTlV/YaAWyKys/MM+el+bhD+JW3ctElCQ56Zz0Y+HKPpV+2ED6UugwWsdThgUupiDRu4uwQHk7EMPniK035S3s63P90gpVKopRy18vVj3bKl71SfhCWzxJ0ooefEKIuGwjNY7Y6C7oLM1+x2YZexuk9blO/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(508600001)(966005)(6486002)(66476007)(66556008)(9686003)(54906003)(6916009)(6512007)(86362001)(6666004)(6506007)(53546011)(33716001)(85182001)(186003)(8676002)(4326008)(26005)(8936002)(66946007)(83380400001)(5660300002)(2906002)(82960400001)(38100700002)(142923001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmcwU3NKaU9BdVdkdHkxYWEydDNyRk5adUN5d0pWcE0xeXdCWlNSWHFWM0xW?=
 =?utf-8?B?SzBkRHdmYXloNTdHV1l5bzR6NitHSXE4OEZuQVM5czRwMjlzRWkreSsxNlNa?=
 =?utf-8?B?N1NsOGhkRWxVMWIrRDZobW5iWWxrR09BSm9lTWFYNkszbzRCQWJkc2Jtc0wx?=
 =?utf-8?B?WWh0dmZubHhWblExd1luUS9EeC84Y3hVaGwwRW9KVVVobjJ0ZU9xMUk3Qmwv?=
 =?utf-8?B?dnROdEtOcnJCSGM4M3JtMkVtQSt3WUcyWlV0WDJZVjlMSWNYWnlxWktyUTV0?=
 =?utf-8?B?UEwwMlRZdk9VckVHdlIvSENwRDhhNHUxZlFieHJsSC84YlRaVkVrcVZTTTlW?=
 =?utf-8?B?VlNpRy9SMFdCaWM5L3ViYVVKc3BmZ0IzMDVLdHBnbFN2NXFPNUNsVCtUVWhy?=
 =?utf-8?B?NjB5aGpZeGpLbGxRWW93YndvOUtSaFZkajFnc3UyME1RR2xuOWZMN3pqc1Av?=
 =?utf-8?B?cHFQcEJSRWFuRFVHM2xoejFFQlJBZUYyWnMvbEVHUjNVZnZGWVh6VmV5Y0cr?=
 =?utf-8?B?VGNKVnZFSzBpVG1jWGJoWVhoeC9aOGZNYmlsVElmYkJMcm13UWdFdjRQQ0w4?=
 =?utf-8?B?Q0twMzJyTVVGWVQ1V0lsZEhLNWVOeStOMlowT1gzSU1mbVIvRDMrdktYQTQy?=
 =?utf-8?B?WWQ3Wklza1RDL1RJT0JmL01vQVhFTTU4SU1xelNaZWVuTEpGQkJRb2JiVisz?=
 =?utf-8?B?UUVqYXJweXZZWGMwZ01wRXdEek5MWFRVaHlIR3R1Rk8vT2dveC9PMnBZRGNX?=
 =?utf-8?B?WEw3YXdscmlvZm9KQUF4MnRPVEJBU0ZZMTduTzFCdi8vSkdPVmpNdllYVTcz?=
 =?utf-8?B?clJCa29YUDYvOFAzbmtMVHE3bVMyVTl6Q2ZhV212N0tuTjU1T0RUVnBrSk5h?=
 =?utf-8?B?WDZ0OG4yNTFsWWUwdE1BbkZUd2kwZXU0TlphNU5xcm5xMitKLzZaRDlHNVRh?=
 =?utf-8?B?cjhtYzdZM3ZOUzhMeDVEblB0WFA5Q0lCaFpHNllvcmF4dmNuZUNLRTFjZ1JN?=
 =?utf-8?B?TllURndXOGZwSTNQRmF3K0lNOW1heFhHYWd0TEJHWkVUWG5nUCtlMEdhQnRS?=
 =?utf-8?B?NjlGaVBxMVNjMHMrdFh5VzRNQ1Y1NkFYOG5YTlpXSnZ5c1Vzb044ZlFFRXkr?=
 =?utf-8?B?czZZTUNla0plQjA0Y3pCQmNBbDBxbVFlMkNsYTA3T3hySHVOVXNPV2JPMGxq?=
 =?utf-8?B?dnFBQUZibVZocHVrQndzSDlKcnJYNitQODVIaWNOZFdBZjM1aXEvdFZlcVho?=
 =?utf-8?B?N0dFc1piMWJ0ZlloYzNIakNrTUsrSjRMOVg1NGo5dHVpdG55YzNyVWQ5UWhU?=
 =?utf-8?B?UFNzQ0ljcUlsc2ZwK3h0clQ1VHYrUm9sSE0vM3J5VHc4andnME1sM09ZQmhH?=
 =?utf-8?B?c0wxb3JFMm5vZ0sxem5pYWRIb0xHS2NkL3RYdXBuaEZSNGVUSlljc3M3aGEv?=
 =?utf-8?B?dW5JeU96K002Mlc1ZDUraFpPc3ZnWjJNRElqQlNYa1J4M2tmQkNCQkVGQXBF?=
 =?utf-8?B?YWI2NUNxNVNqSTZ4T0hhVHQxWitCeEUvZTA4N3hlNGFrZHE1azdYYlBrVVM1?=
 =?utf-8?B?Ri9rakp0eGRVaDZZcUNiQzlMeXFjb3FHTnZWSDlTekwzWno1c1RLU3VYQVdQ?=
 =?utf-8?B?M0N4OXRKOVVpemhEdWRmbXIrZVYyUXhHMW5VSVBQWDQ4MzhIUklBaVFLVXU1?=
 =?utf-8?B?Qk43TkM1U3pDSThySnNhWGNreGtOZlJ3RkNUUVFwSWpnYkpqYjlBbVpMRWx4?=
 =?utf-8?B?SkU3QXpZc2x3Zi9CdlhQOGVzM0c0cWFici9vM295K0lIeWxhTXY0Wk5ZNWNC?=
 =?utf-8?B?cE9OSVdDRTFIUGJ3Yng3eGNobTF3NVVqUVBZcHJsSFBqNkd1Vkt5L1IyamVH?=
 =?utf-8?B?WmlyQ2dYaFlyVExreEE3eEN6SGQ4WGZudy9GL0htYVdNN1E2R3hMVkRXT0RR?=
 =?utf-8?B?V2cwUHpEVllRNVZJVkQwZWFQMGp6N0hzOGVUSnZGR3loM2dyQWRVL1BZT1c0?=
 =?utf-8?B?endqRHM1S0ZXcEx4U0syajJGZzRsNnB2enl3Z2d6UmFuUDNBelhUME91L0ho?=
 =?utf-8?B?dEZCbGRUMGJMeGZQSXhkejVOV3R5MnR6K1NpYTIzZHJrY0RVZHIzR1hIU1RS?=
 =?utf-8?B?Wm9RRjlEY2d5cWdCb0Jhc3VGa3ljNUg1VXpsMU50TndsNHB5QlNPNEFHT3Jw?=
 =?utf-8?B?ME9TYm5nRURLQ2w5Zlp4Qnk5RjhCVTVsd2kvZXNJSnVyM2VvNWFNZTRzeDdL?=
 =?utf-8?B?UWZKa3F6QnVrWlVDK2oyYmEwRDYyOXlsMUZRdmswZmNQRXdSdmR3ckY2SHhz?=
 =?utf-8?B?MktNNE1xMUhaYjQ5QlJmalVPNGpNRzFSekFlVUF2MWE2K2wxTFU2WmVHRU5u?=
 =?utf-8?Q?APX/KTQBO4AcMOz4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c466f12-85e5-47a8-8daa-08da1e1bcc5d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 13:36:36.8793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3OJ1WjtVQpHAxUPpKDHFfseZpg+AMM9kDtoODtYg8buYjYeGHI+rNMpaDuWZKP04CaNbbrAZTvy13zwwpXmKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3965
X-OriginatorOrg: citrix.com

On Thu, Apr 14, 2022 at 03:31:26PM +0200, Roger Pau Monné wrote:
> On Thu, Apr 14, 2022 at 02:52:47PM +0200, Jan Beulich wrote:
> > On 14.04.2022 14:40, Roger Pau Monné wrote:
> > > On Tue, Apr 12, 2022 at 12:27:34PM +0200, Jan Beulich wrote:
> > >> While future gas versions will allow line number information to be
> > >> generated for all instances of .irp and alike [1][2], the same isn't
> > >> true (nor immediately intended) for .macro [3]. Hence macros, when they
> > >> do more than just invoke another macro or issue an individual insn, want
> > >> to have .line directives (in header files also .file ones) in place.
> > >>
> > >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > >>
> > >> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=7992631e8c0b0e711fbaba991348ef6f6e583725
> > >> [2] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=2ee1792bec225ea19c71095cee5a3a9ae6df7c59
> > >> [3] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=6d1ace6861e999361b30d1bc27459ab8094e0d4a
> > >> ---
> > >> Using .file has the perhaps undesirable side effect of generating a fair
> > >> amount of (all identical) STT_FILE entries in the symbol table. We also
> > >> can't use the supposedly assembler-internal (and hence undocumented)
> > >> .appfile anymore, as it was removed [4]. Note that .linefile (also
> > >> internal/undocumented) as well as the "# <line> <file>" constructs the
> > >> compiler emits, leading to .linefile insertion by the assembler, aren't
> > >> of use anyway as these are processed and purged when processing .macro
> > >> [3].
> > >>
> > >> [4] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=c39e89c3aaa3a6790f85e80f2da5022bc4bce38b
> > >>
> > >> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
> > >> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
> > >> @@ -24,6 +24,8 @@
> > >>  #include <asm/msr-index.h>
> > >>  #include <asm/spec_ctrl.h>
> > >>  
> > >> +#define FILE_AND_LINE .file __FILE__; .line __LINE__
> > > 
> > > Seeing as this seems to get added to all macros below, I guess you did
> > > consider (and discarded) introducing a preprocessor macro do to the
> > > asm macro definitons:
> > > 
> > > #define DECLARE_MACRO(n, ...) \
> > > .macro n __VA_ARGS__ \
> > >     .file __FILE__; .line __LINE__
> > 
> > No, I didn't even consider that. I view such as too obfuscating - there's
> > then e.g. no visual match with the .endm. Furthermore, as outlined in the
> > description, I don't think this wants applying uniformly. There are
> > macros which better don't have this added. Yet I also would prefer to not
> > end up with a mix of .macro and DECLARE_MACRO().
> 
> I think it's a dummy question, but why would we want to add this to
                                              ^n't

Sorry.

