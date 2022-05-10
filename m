Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9852B5212F0
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 12:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325415.547977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNZ2-0007aP-P0; Tue, 10 May 2022 10:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325415.547977; Tue, 10 May 2022 10:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNZ2-0007Yb-Lu; Tue, 10 May 2022 10:58:00 +0000
Received: by outflank-mailman (input) for mailman id 325415;
 Tue, 10 May 2022 10:57:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=To9D=VS=citrix.com=prvs=122921be6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1noNZ1-0007YV-FX
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 10:57:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c38c9a3-d050-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 12:57:57 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 06:57:55 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB4814.namprd03.prod.outlook.com (2603:10b6:208:ac::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 10:57:53 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 10:57:52 +0000
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
X-Inumbo-ID: 0c38c9a3-d050-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652180277;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0YJCzUL+Kw8/iAMlgog79jPLeJCHYgxkGHBsb/FGtYs=;
  b=ge47EEoS3DxrEvADW5Ydj4a6F0eXWx9Pq5PPzGcJGALzpTIQdUoT4AB1
   F7MZUOQBOVsIfnCYOQYGFvR8qHdW40LgKjzG/O0g74g1WMnFuvFUZEevm
   a7JmEoeBLhiRhRmRxDqV/yEqmrokibQ6GfxYAyrChQuEVARKYWy9HxveZ
   Q=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 70956713
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jEBF1azyUOrs/EnWenF6t+cixyrEfRIJ4+MujC+fZmUNrF6WrkUGy
 2ZJXW6Ba/reYmemKohyYd6wpxsA65aHydMwSwo+rSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12IDhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5bWVVCsUOfzwyc84VjxHST55GbMW0eqSSZS/mZT7I0zuVVLJmq0rJmdpeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtacG+OTvY8wMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgK2wF9g3M/sLb5UD5yhV2zJHwHOCMRd6maoJWjmSyg
 WfvqjGR7hYycYb3JSC+2n6hg+7nnCXlWZkTHrm16v5rhlKIwmUZThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYZUsBVGvc36ymMzLTV+AeTAmUYTj9HZ8civcVwTjsvv
 mJlhPvsDD1r9beTFnSU8+7MqSvoYHBFa2gfeSUDUA0JpcH5p50+hQ7OSdAlF7OpitryGnf7x
 DXiQDUCuoj/RPUjj82TlW0rSRr1znQVZmbZPjnqY18=
IronPort-HdrOrdr: A9a23:ykcoZaEkvpco7fcypLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="70956713"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3oynJkTBePB8R/vIma7LbpntyGRwHx7eGAzYh5MOKbqbzXDdyl5wBG4rtS41FeC/AjQ1TNydt/6CUQPws2V8BADgggnT2ZstKcbEMG6SfU1DTgcyb+AMxQJ5ib77VSrTHYy2NPe3XhsqV2JVFDl/YbVozOBUh1Jaj9sloAdH2Hza1gf46wsUWg2Glx0Hhj59yLMGucjEUwW3ImQ0RTo0utxtUQGbels43o+mGBH7vMadFFCGOES7+USb5djYn6gru3WtNlxjFsL3avrVbZkb87Mam/C5eoUlYdVbI0ttVwmKYCrZ2LpEl8NgsJ5AKXap2BNYAlWmTyXGZApl3P87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/kWedNJU5vEz0bEvj9CLmWre4hLCaCi5+i1k0Q1Tow=;
 b=by+mD2peuMGgGsbDtlH0TdFsusGLvGen7gRFWMuwGKObzzCO4zMH0rVlzih37Hd5p5ZUCPebFsiithV7H/whWgHR6pFNHFihu9D68Z7Yz6BCPeV5BvOPAvYcGICObLlyBi9HuSXqNmN4SrBiACbsXERwybLSljTS+BzsemdgZwXZB3vXRmTrukIyxP3/hVL4LBW9xSRo90U5V/UMzhNNIg3gq9FHX8zeoGX8w+FpdrZ+CFjfNEic8ov1BYSK9uj0mqu+sbQmtqEHpW/8AGhuzrxTw+5MnbHRIeFqxkuD65oL38Uw0s961Dzjjlf4FHjlpTyAkPTTwd2YORECfN5KxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/kWedNJU5vEz0bEvj9CLmWre4hLCaCi5+i1k0Q1Tow=;
 b=kzBCNXIdhzqHqkwncdaRtpKEUrI5DPBtPQboMmsFqXxBFAR6e4JyHcBtfmOhXiIRSnryzcCN0snduxOn3Zu+Yg3EfRumG6mzo/SVTqeyILlBcnQv6j+7Kjs314DQrWWjqe1XV5/JS1kfSzekD3swteTG2Dhd8q9NzZWh+F5eMts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 May 2022 12:57:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Proposal: use disk sequence numbers to avoid races in blkback
Message-ID: <YnpFLJwxBSqbshw/@Air-de-Roger>
References: <Yf8h36wj5QWSWEud@itl-email>
 <YgaNeZNSt26oCzbZ@itl-email>
 <YkOgDihJCrtWriDq@itl-email>
 <YnRtFBzfba0OYldx@itl-email>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnRtFBzfba0OYldx@itl-email>
X-ClientProxiedBy: LO4P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53866a7f-61be-4137-3800-08da3273ee51
X-MS-TrafficTypeDiagnostic: MN2PR03MB4814:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB4814E7448E5D377719C44BA68FC99@MN2PR03MB4814.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iLQwX2BC6UP9Ngcfp3w+NDyEd3rYaEBzSJm/Avt3Hc7CJC6UGeoMLWNgiESeu5htb8p3otxUOiM7YukMw1YreWZz7qIcD27Gglmmf6MGUdM8MaZueJ/w/rojFi9if9mwiugkMsKT7FkknEEUeehk/61NFZEWgszR50AROz8/iMS1SNhH9ThFlmar8jFnhI3oLgYKHXWfJPMQCa3CqEXuHeJ4kJtp0RJkjuBooc9CEueX049Lor5bcy8+q5dsR4W2z+KJZENlwrUMYouarfjnxuxC+0RlloyLgEfkymSgy6DjbmUf9uYqBpTCSgNDjQRSaI/nDwnCA551gIVf5ImCd7VARToiNEiPMWYek67g3/NFNx2Tu6A0q9DfKLYjY4RSozcZp9uYDQyt53nC/8U4UiANJR+F38cwHUb3TD8UlyR5VXLDlZhOynf17JhF+vg6b95C/zFmCTjcWI08z9im7l+1Y3AclzPLC5X7O3g+RxYGvoS6mmHAecLQoqQxdllgD5IbU3ZLG6eUsDP3pFxLW79Em5fVorVlMMtIGalpq6Yh+hMTHmcfje9w1Y0QoK6DsyJU91QB5wFazj9MdpSquWH0lnIo0JeeV906HzUjSkeBHGKV9yCg0h92ysZzIRxRipEUgLqXXU+6TRxnp2ErHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(6512007)(86362001)(186003)(5660300002)(9686003)(82960400001)(8936002)(2906002)(66946007)(4326008)(8676002)(66476007)(66556008)(83380400001)(38100700002)(6506007)(6486002)(6916009)(508600001)(54906003)(316002)(85182001)(33716001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkpEdGZ6VzR6ZU80YXhob2hoWXZsMzMzOGJJL1lYZXR2eEl6MVdmclFGcjQ5?=
 =?utf-8?B?MDdBMitTUEZFN3RSRUpXTGRKVEtFWGdweEFyZVUxYzVEdi8xVmduZEN6OVJr?=
 =?utf-8?B?THlqaHFBaHRVY253MFdZYytGaTBPTGJ0MzZTTUJXRkZ6aUF0NUxiVUhuajZx?=
 =?utf-8?B?Z3VLdGFzcUxaVVN1dHhXY2w5Z1pzN1loa0JGRHdTVGlDc2o5UXZrYmpNT1hE?=
 =?utf-8?B?WjZWN1Z4V3Vhd0d1SS9NcVZhdHNOVHVqUjVZUDZOUjdxWWNjeVRDSFkrRW1h?=
 =?utf-8?B?N1ZyT1hwTGs3VWxmY1ZZeWcwUW4rV3JVWHVaQU0vc09yMVM2OVJMS2k3TEpo?=
 =?utf-8?B?SktBa0o0RnJCem9WL1NmZ0ZENVNxOUg2MVNhQjBNUnZxVWRjTE52Z0hIRjFE?=
 =?utf-8?B?Qm9Zb1pWdVdMV2kwbkp4V29qOEdQaW9DRU4xSCs0VGVOWWNIZ214UnFZTzRn?=
 =?utf-8?B?N2RCY1lWWWkwZEFrMW4xS2drZWE5VlZKaXgrMytjZ1Q0c1hBaUZWZVBrWVBm?=
 =?utf-8?B?NTBOY0Vpd05zL3BrMzhxNjA4Z0VTeE12UXNOM1RFWUcya2dHaUlmakw1NHpS?=
 =?utf-8?B?azhDR3hCTnRDZUZlUjBZd2RhZmk5TGZzTEl5dFM5N0lQSEU4TUk3Z0c5Qy9h?=
 =?utf-8?B?Y2pObnpiMnZrYU5mR0tSeWNWR3dwd3NNZTBtUGUzMU91bHhLQTlpUEJqNFdN?=
 =?utf-8?B?TndlL1pCamdRY296SlZZZmpjdGh0cVk0dko1T3c5ckpnS2J5NTBheXlOU0Z3?=
 =?utf-8?B?OVplUDYwbVNOM05Scm1zbG5MSllxSk42QmlUUnQ4cUtBa0F0M0xHWEZ5MnBR?=
 =?utf-8?B?VDA3cGk1bkRpUnJNbmhXRXhlYXVHcWpHNHV6LzNmU0ZjQ1hpdEkvNjZnWVpP?=
 =?utf-8?B?TFp6ODUrVERBd1doa3VZZlNjc2Z5TUpXaW4zT1kvZHVSZndYa2N2TUVYak82?=
 =?utf-8?B?anpqNXlMTWljOWlDVkVMbzRqOU54V2NNUWoyMjZNemtHaWs3alRiSHdDVXEv?=
 =?utf-8?B?YjhBTUF6ZGNRZ25JMTg0dFRWcHdwdkQzZUlEK2UxZTJ4MW44RVpsWjRNOWgv?=
 =?utf-8?B?M0dCTGx0RDZYV1Z4UGtsWkRTeFZiQW5PVTdTalJFWGRDVDlkWkR0a3NMMktN?=
 =?utf-8?B?MGtoaVRoMWE0UHRjL1J0d1A2TzFGOVUwdzRnUG5BdzZYY3l3UzdZc3MxQlBK?=
 =?utf-8?B?U2IyUHJndzBBY1R2b3ZNd0oxdTBhaERmckpqOTdBVXozb2dVZlBwR0xsNU1S?=
 =?utf-8?B?SjQyVnJvbkdtVU9kK2c1MytMcWt4RGsvSXZJS0xNelBXRVR1MThkS0lTbktC?=
 =?utf-8?B?ZTRqNncxaG9EOEVaN0V4clRodkxMYmEvUTdrR0JMV1d0SUNjS3Z2aDRuNVVs?=
 =?utf-8?B?YTF2MHc3L0Rkek5IeXRoNVUzWXUwanRyUlRDMHRoUHNvWXJmM1NFYURyLzE1?=
 =?utf-8?B?ZEZFR25WaW9sTWEzc2dUMG4zVGxoUVZmVnBQYTk0MkpnTTU2S2M1UXRRUDJG?=
 =?utf-8?B?enNnRE92M0V4OWJWNHVVK3k5TXdXNHh0VU82blU2UHNHL0xubnVYNnJSdFRK?=
 =?utf-8?B?L1lCNkt1SzlMOExOR1JpWnlPNE9NamtDNlc1Z2NrK3BTKytSTXU0ek5BUDVW?=
 =?utf-8?B?dTlvbFh1N1Vpb0ZCV096NkFXbkYxOTUzWXZvN1RMNUJPVmU0N3Z0Z3ZvenEz?=
 =?utf-8?B?a2l3bEJWaElnaVk1YUxMUlhTQm1xVXlId3JMenZ1THhucXA5dWRBU1A2RVJu?=
 =?utf-8?B?U3lLbTluNno4Z1F6a1JGbUp4UkNYcXM5NVUrZWJ2M0FwUXowcEI5aGx4OHB4?=
 =?utf-8?B?Yms5amM2OUtIQ1FLcUtCYzJ4VzE1akdBWUcvWkx4cm9wa0NYVmRPNVZ3ODNQ?=
 =?utf-8?B?clRmZmpGd0ludnhiQkh3aG5YQ04wM2VYTExkRlJNWFlVT3YvL3lYUkJTalpS?=
 =?utf-8?B?V1RyUDg5R2VtNWNscSswLysvdUNDVWhOVk5UZUhNZnNoa0p1blFDVzRjWGRP?=
 =?utf-8?B?YlIvS09Wb216V1RmTnV5QlFidHpBeW5OSW9SOWVsMkNyQ1ZMYWV0Q1ZVMUZx?=
 =?utf-8?B?UTM4ck1oMjRtU2E4elBHR01FZytSbTVrTmQvdWR6QlF2dTk4VTVpSysrUTJ3?=
 =?utf-8?B?ekRaRTljaW1MT3R4S3VsaThwREdmK2VrQjIzaTg2cERWbndsWnlvZzNoTVlK?=
 =?utf-8?B?a204VWVHWm9Eb25raVQvVDdrcEF5NURzMG90dFdBZUhoZGQxZFRFZUdyZVFO?=
 =?utf-8?B?SjF4R3pzK0F4T0YvQmlPUmhzdEFnVVdxS0Z0eStlN1F4ZUdLZG9YUmJ1WmxV?=
 =?utf-8?B?c3VmTkFIVEFxTzREQSthU2J2MTZ2eEZQYmNWWXVvalgwQVdrcmt6emxLVm1Q?=
 =?utf-8?Q?pdMzxaXWBv81YvVc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53866a7f-61be-4137-3800-08da3273ee51
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 10:57:52.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1LoHcCc+/PRHgIf9O6lWUj9RSN05NPI7n0tOlK6D7ZiCQzbHT2yjhHJUyv2+xtAgR1QPlE5w0CWa7uMXAv54A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4814

On Thu, May 05, 2022 at 08:30:17PM -0400, Demi Marie Obenour wrote:
> Proposal: Check disk sequence numbers in blkback
> ================================================
> 
> Currently, adding block devices to a domain is racy.  libxl writes the
> major and minor number of the device to XenStore, but it does not keep
> the block device open until blkback has opened it.  This creates a race
> condition, as it is possible for the device to be destroyed and another
> device allocated with the same major and minor numbers.  Loop devices
> are the most obvious example, since /dev/loop0 can be reused again and
> again, but the same problem can also happen with device-mapper devices.
> If the major and minor numbers are reused before blkback has attached to
> the device, blkback will pass the wrong device to the domain, with
> obvious security consequences.
> 
> Other programs on Linux have the same problem, and a solution was
> committed upstream in the form of disk sequence numbers.  A disk
> sequence number, or diskseq, is a 64-bit unsigned monotonically
> increasing counter.  The combination of a major and minor number and a
> disk sequence number uniquely identifies a block device for the entire
> uptime of the system.

Seems fine to me, this is just an extra check to make sure the block
device opened by blkback is the one that user space intended.  I would
see diskseq as a kind of checksum.

> I propose that blkback check for an unsigned 64-bit hexadecimal XenStore
> entry named “diskseq”.  If the entry exists, blkback checks that the
> number stored there matches the disk sequence number of the device.  If
> it does not exist, the check is skipped.  If reading the entry fails for
> any other reason, the entry is malformed, or if the sequence number is
> wrong, blkback refuses to export the device.
> 
> The toolstack changes are more involved for two reasons:
> 
> 1. To ensure that loop devices are not leaked if the toolstack crashes,
>    they must be created with the delete-on-close flag set.  This
>    requires that the toolstack hold the device open until blkback has
>    acquired a handle to it.

Does this work with loop devices?  I would expect that you need to
issue a losetup call to detach the device.

Even more, the loop device is created by the block script, but there's
also a window between the block script execution and the toolstack
knowing about the device, which could also allow for a leak?

> 
> 2. For block devices that are opened by path, the toolstack needs to
>    ensure that the device it has opened is actually the device it
>    intended to open.  This requires device-specific verification of the
>    open file descriptor.  This is not needed for regular files, as the
>    LOOP_CONFIGURE ioctl is called on an existing loop device and sets
>    its backing file.
> 
> The first is fairly easy in C.  It can be accomplished by means of a
> XenStore watch on the “status” entry.  Once that watch fires, blkback
> has opened the device, so the toolstack can safely close its file
> descriptor.

Does the toolstack really need to close the device?  What harm does it
do to keep the handle open until the domain is destroyed?

What about disk hotplug?  Which entity will keep the device opened in
that case?  Is xl block-attach going to block until the device
switches to the connected state?

> The second is significantly more difficult.  It requires the block
> script to be aware of at least device-mapper devices and LVM2 logical
> volumes.  The general technique is common to all block devices: obtain
> the sequence number (via the BLKGETDISKSEQ() ioctl) and its major and
> minor numbers (via fstat()).  Then open /sys/dev/block/MAJOR:MINOR to
> get a directory file descriptor, and use openat(2) and read(2) to get
> various sysfs attributes.  Finally, read the diskseq sysfs attribute and
> check that it matches the sequence number from BLKGETDISKSEQ().
> Alternatively, one can use device-specific methods, such as
> device-mapper ioctls.
> 
> Device-mapper devices can be detected via the ‘dm/name’ sysfs attribute,
> which must match the name under ‘/dev/mapper/’.  If the name is of the
> form ‘/dev/X/Y’, and the ‘dm/uuid’ attribute starts with the literal
> string “LVM-”, then the expected ‘dm/name’ attribute should be found by
> doubling all ‘-’ characters in X and Y, and then joining X and Y with
> another ‘-’.  This accounts for LVM2 logical volumes.  Alternatively,
> one can use device-mapper ioctls to both check if a device is a
> device-mapper device, and to obtain its name and UUID.  I plan on going
> with the latter route.

Likely a stupid remark, but needs obviously needs to be kept to Linux
only.

Thanks, Roger.

