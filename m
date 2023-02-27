Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF846A46EE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 17:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502808.774805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWgKN-0007hp-DB; Mon, 27 Feb 2023 16:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502808.774805; Mon, 27 Feb 2023 16:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWgKN-0007fC-9p; Mon, 27 Feb 2023 16:26:15 +0000
Received: by outflank-mailman (input) for mailman id 502808;
 Mon, 27 Feb 2023 16:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWgKL-0007f4-Td
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 16:26:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71d24385-b6bb-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 17:26:12 +0100 (CET)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 11:26:08 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5074.namprd03.prod.outlook.com (2603:10b6:408:78::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 16:26:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 16:26:07 +0000
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
X-Inumbo-ID: 71d24385-b6bb-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677515171;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=huTvSwUKfOwTf7t8DEP9EfMBDbC7pL9uxHpeZTUXJPE=;
  b=TlDkiIi+JR5segb44DHz/6DbI34ok5OzRbNGZpWLT+iH8iZ+4JG18nuW
   QhB3wlVcjGmkdjb91Fm5S2Ltq5uLnFYoJzsF2u/D1ejz8wC+xmudLGdaX
   orTSOQx4zWBzvV/TjOLZQXAppXq1LrTi+jQE77nce74DWHnLeyl0G9GmZ
   Q=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 97536623
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Yw9Q3qPELVKnOXTvrR1LlsFynXyQoLVcMsEvi/4bfWQNrUoj1WYOz
 DRLXGyDM62IMGf2edF1bNzi90gGsJDUy9I1HQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tC5ANmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vowKFxrr
 fMZExIyKSjdldyz7ZzgbOY506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6QwHilBthJfFG+3vd4qQSy9mwWMx4bBGu9ndXntnG8UOsKf
 iT4/QJr98De7neDRMTnTRS8p3KDoRc0VN9ZEul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8PGSpDC7OykQJEcDYzMJSU0O5NyLiII+kBPJCMpiGaidj9vpFDW2y
 DePxAA8jbgOic8A142g4EvKxTmro/DhUQod9gjRGGW/4WtEiJWNYoWp7R3e8qxGJYPAFF2Z5
 iBYwo6Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 yc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:bL3YvaB2NzBtDCvlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.98,219,1673931600"; 
   d="scan'208";a="97536623"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKQhWDUkIQw2EoWPe0A7EC76Q/DIdMshT1d6mpA5vXfB8xAwe5wMkOcc3A8Z1qBGQzr2/4FbP/iM8HGCWzz6Y2/qsAkaz0ULPxuZWGgwGHD2SxiCjjejGqN/UG8/2SnveF5epxVkV2AyNr7OC4gLT9tOZi4aCoLmX8cSsRGQuHKimZGAqhzXB4cD/22wldAQjNG54Hh1jYdV70FuiN/VKV30vidZprBjtyieznPjlj7EI07JAMGQU2neQu+Mp+b7uZpPlIZQlwWuNlFqxfHVkBYXsZcG0M4PowX8x0ajrSMVxvos0IAAoOLQFNhFsSkJlABD+oMAWM4ZckO8gW+Q2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huTvSwUKfOwTf7t8DEP9EfMBDbC7pL9uxHpeZTUXJPE=;
 b=R5FLQP+476DaAG25OqOn4ZovNGibD1ve42OPY9Ao20IEThAHZCIymqPUzI1f9m32mvzJVbJEeaFTRq2JdrZobdPPEvhjjqX1wMI+Lx3O71qrTXuueMwAhdahpR+15SJP2Pan9+Ck0voD7PMT7ZEJ+PtrWRxNofnPLvRRv95T7H4fEuLFXjJYb7tBfDbRid3xpXk/qrKvx2EY4LrvMmdFwb43mCbI20BwPfc/dF7q4f4beDEAI71CuWU2Nclh+CSXU9oyxOaRWBzuSCD6kk+g+TD2amDu/Kjkxa62Lqg3kFqDZ2ULk8XDVNudnoPaFnUeDlgeRQbQ+jhU/HSViH8qYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huTvSwUKfOwTf7t8DEP9EfMBDbC7pL9uxHpeZTUXJPE=;
 b=mc4zJMyTThv+ppY/cmXagWQ9m2jIpT74tXvUSCsxpVYJro1SQTWlO9Ajay2KyDIrfZxc8AevopiT6mF5vgRRhLSa8dll1Y28peIm+A7a9a3oAX8IeSOgCvDaQBEFAnVDrdZRNeepEkMwRwx9nb+NRF47A709P8IfZa+eP8F58Mw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <12849cea-58af-e13f-89ab-a7e9d4200df8@citrix.com>
Date: Mon, 27 Feb 2023 16:26:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 10/14] x86/vmx: move declarations used only by vmx code
 from vmx.h to private headers
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-11-burzalodowa@gmail.com>
In-Reply-To: <20230224185010.3692754-11-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0477.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c9e842-454d-47dd-3dc3-08db18df53dd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C8IEXWdR1uCxC0FBFHlWDIZhCgk0C8Sqdr2XGXl117gzS8+L/aTQolV2SjMRmRpzpykzIssddPmW6rV4XjCn6UMsUg4ppkpdA+7HV6nS1MapcJ6pwTTfBulJJsgM4eMFXGnXo6SnghAALsc8iI72cW1jhFDXxL1U5rNtrl2MwYPo6CuuB55xJ7svvublB/OUcUbpdxQ7esv3btu92yvKvLtVJ0rXjeO8m+rRqxmLsLTSroLA4yVWsh4d3XgyH9ek5sNifedFU777GfJikYPjdL2vzKKR+U+TbZ9+xbB5MPPTVWSiOKEUn/01nwee342hMGvavhtwf2WfZtM7MfaKnRZUfvGkivQIzHDhJ9dJHTaJw6xImvBSmA66WuE9vNez6qeKtsjl+0F5AJBo7TMsggL3lWvmzgucqLJ6Y99i2WhO0vceT1gTWO6NLtJKCfEAdP7XEccG+nXeAQG+7noPRhVF2vsvxSp7mQB16j/tYz7N6C9gHIMzIRF8DEHPy85TUlzvDMSBZpi8xUvPy1v8jTLm6UqznRLiOELPClGXovUuW65TxVvgxiobnX7bR8D3WZh82au7MVgTyIpJBDYGbsnpcR7Kjb09FR67Zz0iKNqXFZx4dW95vbBt2I83pD6m2PvdwsC+zk6izd35ReQPdMyiwF4/Sbsf6V+hc+CL2mTbmvy+dlGKAW8XcvgZfjFvr04sMFmP8BgYZYK188/wY4RwvTMqLw7+Wu7LaaLIy44=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(31686004)(54906003)(316002)(36756003)(31696002)(86362001)(38100700002)(82960400001)(6666004)(53546011)(6506007)(83380400001)(186003)(2616005)(6512007)(26005)(5660300002)(8936002)(478600001)(2906002)(6486002)(4326008)(41300700001)(8676002)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qys1ZFlMNmV3cVErQXBWVEVna0Y5TnRvVTd2ZkszWS83ZTN0cmx3ZXZxSDhy?=
 =?utf-8?B?eW54TnZPdWZ5Um9CUkdpL1ZEZk9JYmdYSTJHdkZ0Q1JzdWZFajRRQmczRU5I?=
 =?utf-8?B?enU3WDBKR1d1bnNEazEwbEdKc2R4Q25GdkpkUUV0WlBmR0RvZm5uNDJ0SWM1?=
 =?utf-8?B?UXZuTEFwZTdESUE1c3dJTmJnS2o4NC9OelpkanFpUlZqRThmcFRXR2cxUVo1?=
 =?utf-8?B?aWZ1dmg0bkdPdUMzRjlwTXNzWmg1NXdneGJzOUpKZ1dUQTgzWE4zY3oxWHpB?=
 =?utf-8?B?aWNXSk8zY3lHNmoxR0FJeWdqZDlSTklycS9BaDhmNXYzaksyU2kyTlZvSHpZ?=
 =?utf-8?B?UmFGS28rcDBISE12VkVJeHhMKzBRNWtIVW8zVmNKVVcxWG1TN0FFNnRZUmFN?=
 =?utf-8?B?NkNIbTZrT2tDbFZRM3RleXRBLzF5dS81M1pud0RWNVlIZ2FmRURqUVpWS1FQ?=
 =?utf-8?B?aEU5L3Y4OVk2djgxSW9uL2lXbDN4OWMzWHprQXFveS9YdjgvQStVM0QxWmxT?=
 =?utf-8?B?SGZaN2VqY2NpZjBPRXkyeC9PVVY3dXhKZC9VSUlSVmJmU2lBLzRtVndqdCt1?=
 =?utf-8?B?d3RJOEtqOTRvRG9CUG9uNmxQMUJFajg4UVV0VmZXS212c2lvSW9BeFF1UW16?=
 =?utf-8?B?SW5VYnhJUFJNRG0rdjFWblVRK3p4d1NrbzNzMzJDUGlJZ1ZiTkhSN1IwOUNk?=
 =?utf-8?B?MDBMbTVQUkJHZVc3dThNME1RVUZIaWIwOUl3d3lzaHNoL09RNkpTK2VTbEFX?=
 =?utf-8?B?cWsyczRRaFNyUjlhL1c5a3NsUFBqWmwwL1NLVUV4bnc5RHUweHpxOHZVcWFn?=
 =?utf-8?B?cHFIUjlIWnB4a0lPSkErQ01XY2VqaVpURFJ1bG9iYVNBUTh0T2poZGJGaVdw?=
 =?utf-8?B?d0JxTnBDZjJrZFh2dHgrVUpuait5dC9Va05MOEl5Z2dwVEtZSHArT3p1akJN?=
 =?utf-8?B?bnY2RkVzK3Btb0h0MFlkbHMwaHFoTnJvMDVtd1hLdEpqTGVKQzh3dkV6SjM4?=
 =?utf-8?B?Z0RNa0NQS2JOM0xzdU5TR0tPRnQzWmxJdENGYmIzaDZpWnpEdkdhdjJCWUsv?=
 =?utf-8?B?OWtBdFlJdG1tWFgybThlMS8vM2h2WklTL1pSZmNlTzFNWDMxSlNrSmQ0MFlL?=
 =?utf-8?B?a0JHaTlFeVU5b2RITWdSR2Q4TmV2aUdSNkFqcHZrM2xmR2VFelh4RzZYMXM0?=
 =?utf-8?B?VXlVa0JGY0JtNk1ZaTc0MTdkS2hyUFFCMGtqejh5WHlDTGVQTzZxZTdpb01S?=
 =?utf-8?B?KzM2NGFIa1lCaHR4OFdUdU5sTjY5Q1RlV0FoZEFSS29lNDhBOVJvczBpVjFQ?=
 =?utf-8?B?RUtURGw5eXluOVV5SmJVc2xQMVNVL2pFMmo0NkM1L2krTURmS2FONnhtcFZo?=
 =?utf-8?B?Sk9CTUZZWEExRXhkRTFGZ2ZIQzkxYzk4WEFDMzRHbDY2cUVpOVJFYXlVSVpI?=
 =?utf-8?B?cno4c2h4aW5hOWdldCswQ2IvOUdKcnFZUjgxUXI5Y1ZFY3hZemF6OXFQZkts?=
 =?utf-8?B?Mzh3SVd1Mm9YZ0JOdHBkOE16QTdQcklmQ2NmVWhsdVpSMGZQbjBZcy9vaHRX?=
 =?utf-8?B?Y1FrUXh3MXQyTmJyeVhTM1MzUGx4VzNUTVFRZUtDQ0xna0d3MVRZU2dwODNU?=
 =?utf-8?B?ZjlDZjZFbW1zNTdsZEc3RUhmY3BqYVkzeHZjcmdZS09kWGVJbDVPc3M4M0pv?=
 =?utf-8?B?YzBkNXhsU2NFdG02UHd4dXBDUVM0b1ZsK0hCbVhxaDBDSXdoQWdIbnpLZ1Zz?=
 =?utf-8?B?SytDL09VYWFWYU1yd1p3S0UvSmpYSTZibXQ1dnZVc3lEYjlYNGhsdC9VNGow?=
 =?utf-8?B?cSt1RXJqWUErRW1mSURMY3hEeU1FaE5xdkh5T05BalVXMmk3dEUwSnNWb09C?=
 =?utf-8?B?VDBPK3FFMUFHMjRIYzZjZWVzbjZ4bHJBUThMd3ZubnVNdHdNV2ZYRUp6N01T?=
 =?utf-8?B?aytZdEZ0RDRaRk01ZCtvYzU1ZlVheVdlUmsyc0NXaDVZalhMckg2UHZFTzdo?=
 =?utf-8?B?WThaUmIzMjBNNjUzQTl5SUttVWpFdWVtVWNkN1FscTZ1RklsY2RJMTFEWUha?=
 =?utf-8?B?VzVqOVNSZStoeVBtYjU5LzdMUnNUeFNtWVdzKzlYS3ZTdG9yeGFMQnI1RUt6?=
 =?utf-8?B?UU1JcVg3ZmJKMUZ1ZzhEdGZycHE3bVB1Z3BsWGl0ZVdjVlR3KzFzejBVaTRU?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1/6beiqJgpzIMj4ZMv9Cf0rpk71UvCYo6DfoLgdFT91yEKH/MBKMqC774WlJyOxmkFhrotr/QG6g1vKwEOpSbrcm81mzUo2X52CxOjp7//uXP+AVRYqb4aqUTcMBlpNOBZtixDn7zqf8RC8mFKvHH/gWKp0RlW5McoTNpw3lT/M7TMfDuHaTNz9EURdEH3SEdRzt/T/to9QsaCJYx0x0QsHyW5CxdIjarlIgvSk16PtgY+71Opu74vHWCieCHyuLG4ki1cPEZvmL+TPSoDgl1YT5urufrfG+bXI35uHd5h53X1c7k7SrAoyt/dbTaqXKvFMjhcZNfqJinVHs6AUV9cj2wt0xk2SDEO7X9EMM4kAzHb3jmAqJ0ZRcetlVvFQ7JKt77+RFOlPJMffBl6stftYCp+BI/zLRUk6DOZh/Hd/N6iL2EpEXywiYLbu+Bk2Tgan+NlVmdNBXNf++nGw5Nb0HS3bNG+yJWlQVdxc/yn4TlVUVegNtSsZXt5rdgk3OpKozKrKbjyEFWsGTTDai8qrDEFUbn7ny5jNa0bteQBq0PTJM+MFZ0d+0GLmDPXyTA3rzpAAaAqHn3aDgAxioomX0kn5XglgkDDOhoM4r3jQoK3TmLwhtZNmTKGEzkPm92u/NvxW/BrqCPr/b/VozXM192U8X8XJpG+XBcg3DrxDjx3a5vb1Kn49foH2DPsLJuORP1zVHhWyLMBppMlMSoTQi+wj8r2uuXTCr67gqeac69H6qhTDzzqIuEmiuVhDHZVN2Rk+WVfVBabcKa6eBeRQBrjjViaTXeS8zwqyNaRw8zT5gQ2+L3ijAB+6EpvY1IZED2UIkWnD2R03NnCE7deDmEROOwLMOj7Ez94km2FkFutJ/GxU5CvgAUJ9K8699
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c9e842-454d-47dd-3dc3-08db18df53dd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 16:26:06.9495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pf/3/lopF0zGffANOi0ZaakT5eBQN3+mmQrpOjKTubLLYgqAT8SZGbw6Csm8HaDoSIAVrWbzArJ8o2PpxKiEUhOLUL8b7UdEP13VN4f6o64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5074

On 24/02/2023 6:50 pm, Xenia Ragiadakou wrote:
> Create two new private headers in arch/x86/hvm/vmx called vmx.h and pi.h.
> Move all the definitions and declarations that are used solely by vmx code
> into the private vmx.h, apart from the ones related to posted interrupts that
> are moved into pi.h.
>
> EPT related declarations and definitions stay in asm/hvm/vmx/vmx.h because
> they are used in arch/x86/mm and drivers/passthrough/vtd.
>
> Also, __vmread(), used in arch/x86/cpu, and consequently the opcodes stay in
> asm/hvm/vmx/vmx.h.

Every time I read the vpmu code, I get increasingly sad.

That is dangerously unsafe, and comes with a chance of exploding completely.

That __vmread() is in NMI context, which means `current` isn't safe to
deference (we might hit in the middle of a context switch), and more
generally there's no guarantee that the loaded VMCS is the one
associated with `current` (we might hit in the middle of a remote VMCS
access).

vpmu is generally not supported, and BTS needs further custom enablement
because it is only useable with a custom bus analyser.


The __vmread() needs deleting - its absolutely not safe to say.

I'm tempted to hardwire the return 0, and punt the problem to whomever
next uses BTS.

Alternatively, MSR_DBGCTL needs wiring into the hvm_get_reg()
infrastructure, but I'm not convinced this will actually work in either
of the two problem cases above, hence preferring the previous option.

Thoughts?

~Andrew

