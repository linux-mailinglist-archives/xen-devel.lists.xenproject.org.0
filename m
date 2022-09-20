Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5515BE6B7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 15:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409355.652350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oacxD-0007Z6-5x; Tue, 20 Sep 2022 13:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409355.652350; Tue, 20 Sep 2022 13:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oacxD-0007W8-2u; Tue, 20 Sep 2022 13:06:23 +0000
Received: by outflank-mailman (input) for mailman id 409355;
 Tue, 20 Sep 2022 13:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X36y=ZX=citrix.com=prvs=255db12f2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oacxA-0007W2-RX
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 13:06:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 038c7a45-38e5-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 15:06:19 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2022 09:06:04 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5419.namprd03.prod.outlook.com (2603:10b6:806:be::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Tue, 20 Sep
 2022 13:06:02 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5632.019; Tue, 20 Sep 2022
 13:06:01 +0000
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
X-Inumbo-ID: 038c7a45-38e5-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663679179;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/uMVgHsXASXPT1h9zCwV72jW0ZB33h1BacZNO5yCuPU=;
  b=BMM7Ote6yOdAoUNebYL4V2Hn+EHfEfs72UoyOySuKFn91/1bws8/JY67
   guAHWitqd3fXt6z0bZu7IycfxA3CvV8luHHPhAUh9sNWukGNq+KIJpZWL
   uV944DC53S9Ufes+j013pld7nY5hv62w7Yai7Wm5OLVhoa5YYF276XtCQ
   4=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 80574233
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wGa+0Kq4j2fMayizTX7Rq3c+Yk5eBmIKZBIvgKrLsJaIsI4StFCzt
 garIBmPPayJYmKneI0gOdjn/R5SuZbVn4dnQQpoqX9mEihG85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WlA5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUl6N14EThz7
 sAxAywzSDaeoeaX7IiSH7wEasQLdKEHPas5k1Q5lHTzK6ZjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/F4/NpsgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4Wrdry3w3LSU9c/9cNwYJKWA+M5yvAe04HMIGiYXCFm1uObs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehgNfBFTFp9rqPRhqgGqy8qDqzPW0fKz8EbCpdFA8duYC98cc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNtGuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:eZyhlKgzOYJFPEDgIVicNMcTi3BQXz913DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCJSWa+eAcWSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AWV0gK1XYcNu/0KDwVeOEQbqBJbq
 Z0q/A30AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9MofyygwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmg3f4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQC/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKorzPKN
 MeQ/002cwmP29zNxvizyhSKZ2XLz8O9y69MwQ/Upf/6UkXoJh7p3Fot/D30E1wt67VcKM0lt
 gsAp4Y642mcfVmE56VJN1xNPdfWVa9NS7kASa1HWnNMp0hFjbkl6PXiY9FlN1CPqZ4hKcPpA
 ==
X-IronPort-AV: E=Sophos;i="5.93,330,1654574400"; 
   d="scan'208";a="80574233"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NygG6Z/y+1VSnCB1fAO4ACEAWa4+1CunEHtUe/Nwv8eCIp0M7utBgVGqlnstsi2vXiX+e+Rcvk5JFhtmQBsm36PPoPIaVqJ+IIqHZZvZ+dyeMs+cC4OFht970/LZLjcHrRdDP7jVbheIJOZfDBmLI3OaVvt4zdxSosf+1ncXAinwXChitRHE5bC5ChD+kv8LyjTLydfkLMJ0HrBjITCzAe6sCYJu3Bqq5OOA3DDUsWrRdoXqJe8gUzoFMKJfn85iOOOOgM5Q8+fJKtEKpC38G+etpdFDH2zECtQZBHVochJ/jn1WVp379hPnv4UZBafGzho1ClrQaVy/osHOA/4WIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9W1XzhSuoJVOfakoBvWD0zz0EJUBbde6jdFgCAzHTQ=;
 b=M5u9svo9Lb9TsALncMAs+Kp+DdgKwBwVYVKLSvPyaPWxuCYriIZJ2m5KATfLAdD31oIiR+vJt+FzJS2GvKe2wmIoi0gnvycJGufVGtYREP5fEpyycqdxkxMcOF1lHB1gqvTfgojj8s+YdjLEe13tgW4agaXqJYsU0Rusqo52TDej1ulObqgAFBs2iDiDsnuSDJmTXdNdTBYbD3pYk0O0WfkBBhuYW8MrOWuulxCvuPc6wa2jkqzbyiIjBRqBiQ1LlaUVKPIi7PouZ7In2JaSFmnoPp834Fnryl3BmJYqKeOm3Fp+hKiJ8Bx3FzgwOevGUn4dwl4m36YpbiByZBV/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9W1XzhSuoJVOfakoBvWD0zz0EJUBbde6jdFgCAzHTQ=;
 b=OYI6j88++WLzUdd+aVlDi3IpNrDlpiIb/x90iKR0HbfbsGNDfadyrsOuL/dW+/AAKb1eCQdMWT3g6h00a+tQEcRsBzeLlGKZhYRHSX2m/UFT93qoaH+ce40OhG56n858yAu4+hsaJ1GzqPKWGHiFkq+xDTQ2WA+0kWiLflCiP1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 20 Sep 2022 15:05:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Jane Malalane <jane.malalane@citrix.com>
Subject: Re: [PATCH] x86/PVH: restore VMX APIC assist for Dom0
Message-ID: <Yym6q6Q7OIkLwSI1@MacBook-Air-de-Roger.local>
References: <0e0b1859-e7f8-3f8d-2be8-e0069b116525@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0e0b1859-e7f8-3f8d-2be8-e0069b116525@suse.com>
X-ClientProxiedBy: LO2P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::24) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5419:EE_
X-MS-Office365-Filtering-Correlation-Id: 50dfdee9-697b-4828-4a74-08da9b08d95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ZaUjzSPzPIz3SyeKgFJhL2wU+Xnz6LdM+epoVK0RzaZeeNlqDi9ss71Q3cG0iUnsMfILmOxrQ/Tub7lVTDNbyS/UjL+TIS/g+zr0J4lie5ES68JeN2Y4JDtRZAoFkOqHueZqqJ2PivZh+U4Ug668rGSBsFPparlm9IYeVFWHQlyPnnCDvFTWodP6mnye86kyYf7ALyYAbVmLNhFM3bWnJ2qFuzllva8l4D54gQSQpZpPqn9d0gcAhR6VkcKNtNPhXJsblIJMpW7Ul5tcM3tPGizOFpheqceDk4zSWSJpIkpQiZ1Li//F92wv1RW9F0fJQTQYQ291XdXKgoQby8mp5i2Lm1PzRFXG5ReLrKEUoih9FS29Fa61FfKm7bmCQrNNAZ6AvUHPIdS2sI9MjC82V4uP5N/H4oaOeSJGtQFbxS6ZJtl3wLSpnnjcA3MotWnMejA2bUd7OCZ/TU1M7S2h5BoMp1CsfjTuBZK20TRgqe6Dsde8o8tOM6LRcGOD7eLeg7bOsmNBP9ZamuyCq/oII7Xb7+joLxBg7JKTVb5WVBAuvdk0AzP6YoglpiNlCs022IAVw9uY9kZDswtCU1Q71PxjzY/24fm5iRlZP8cgkIUqtIfWdRVAkauqkr7vhdz0OG30pZsIhPauOO6mkPDXlanFlpFmq6m53sAiO6+r7d5+RkDWmMv6veUvAbjxkL27YMkJnjfxR7hKmoM3XHxvg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(6666004)(86362001)(107886003)(478600001)(6486002)(8936002)(41300700001)(5660300002)(85182001)(8676002)(316002)(54906003)(6916009)(66556008)(66476007)(4326008)(66946007)(82960400001)(38100700002)(186003)(9686003)(6506007)(6512007)(26005)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFNUaHdEZWVHYkxvQ0l3YlR4eS9FKzFQc08xWXRSTlVOcmlLRXR2cUQ0Wi9w?=
 =?utf-8?B?OE04ZFJHc2VHRkR2ZTZGNkVFV1NBb3BwenJZdzlLQ0FpR1VhSllITU5NZnY2?=
 =?utf-8?B?dnNXNGg0OFplenlhY3VLU0tRNVQrS3RHbkhVTHV6eE9LakgzaVBVNFlzTE1I?=
 =?utf-8?B?SmxvTmdWUW1CWUE5SnRUUW9sTkZRTkNzbG13bWJXc0dtNWt1QlZ5WGk2RTd4?=
 =?utf-8?B?am1vQmxmTmxDelFRdGxJanhISm5Wb2JzL3FvTnpSbE96bmQ5R0V1Zkl4bWc3?=
 =?utf-8?B?SGlHYWxIaWNkVzI3LzE3b3lZdVQ1ZjM4dlUzeG9ab0dDQno2TG5DUlkvUC9k?=
 =?utf-8?B?WjlKVVlaR2NvbmI4OHF4blpESk4yNVRGUHdVdmRTTldpckNkQUJMSkZod3BU?=
 =?utf-8?B?U3VNd0J5RkFpY1lQVVhnTnZtSm54R1BzV1g2RS94alpaVDVMeWpjdlBBRG51?=
 =?utf-8?B?SlVJSFVrZTMrb0hwMmxDU1ZPN2FEaXRtcTZkaktXN1ZlWm9QTWs3RnlyUlhr?=
 =?utf-8?B?Y1hNQndpSjFGZlZLM2tZK0owd1U5RXhqODBYcnhqelBWMDNGb0RLZm8wUTJx?=
 =?utf-8?B?WVR1T0VOYTNqMFJaMkxWZW12SVp4OUhpMk1vNnpZYjNZVVMrL3FUWVB1b283?=
 =?utf-8?B?bWwrZWpOYlVmUW1lM1FFeG1hRjB0a3JPNXRIU29oOGdCd0NVWjBZS05ZS2dU?=
 =?utf-8?B?cVdJQ0p0bENZUzNsdTFBeURycm1HSnl4YVRSWWxMWVhUMkJuc1V0TDVOSlpP?=
 =?utf-8?B?M1l6a01lTUNpeitINUxKL1g2SXR6YnVWRGdxWW9jLzdtVW9jMFhVM3JYeCtD?=
 =?utf-8?B?L0dMVGJWRWZwbXk1RXdIdTFwWFZjZDVEYzRmdmNXUjVYYVBGcTZoRjY1aG0z?=
 =?utf-8?B?OFAzQVV4ZjR1MkdEQnpsQW83WlRhM2I3YjI0ZG5hUDJOa0gwVXJqNEdGeW1r?=
 =?utf-8?B?aFNIRU0xSVkxQVNBeG9aRXl0ekhMMit4bDRLbGNZWEt4c0RvNUhDRk5udm5o?=
 =?utf-8?B?TzgyWnA5YTFEejFIS28vRFordHdmMlhqeDAyd0ZHWHg0VmdpQVowMkNpQUtS?=
 =?utf-8?B?NkVHQzNPbWRua3A5ZzdJZ3FnamNWL3FwTlZUdGROVnY2TVFIOUJWVXhLR0lK?=
 =?utf-8?B?UjJhRGtwcHJabFp1U2c3emdjMTE4dDFLeHRsejQycHFYaVI4M2doRTBnZUJv?=
 =?utf-8?B?cmxzdXA0QmxmNFVSRXAwc3VKMnJTV1U2RUNxblhxSWV6TCtLOEdIK1UvOVEv?=
 =?utf-8?B?eW1nQkFNWDVnYnFuYStNMUJNWnNobTZKbS83S3pHdFhkWEs0VmladXlCcGFo?=
 =?utf-8?B?QzQ2M2QwZnYwdUVNOTdFeFNFbXpGeVJTWjBUcTZmWlpHSjMzdytzZHg0U0Yv?=
 =?utf-8?B?Y2VFUHFYM1JjVk1DclN2aThtQWJ2cm0zOHBkWW1DOWVDOFNQZGl1dUNWYlRS?=
 =?utf-8?B?ZjM1aEtzR2VJckxaOFZNSUprVGV6aHg4TW1oUTFJVXlpRmtaQ1FkQm5PR1Yv?=
 =?utf-8?B?OXhEeTk2WStIdjRUdUZTRlFpZDBsZE9wOEZtT3ZZcnloaWN2TzJRaGtaeDg2?=
 =?utf-8?B?VXpPR25DdlBmOFZrbmljajN1bWhXWWIzUndGM09VWFRMaTBLaEFaTnVNT2Rj?=
 =?utf-8?B?bHlHdEJ2YnFPNHJIYXhza2R5bFBNN3BuazNMR2NiWHZXR2d6UTlpd3U1LzMv?=
 =?utf-8?B?ZUFYa25ydzc2ZGMxbUxIclZ0cnB4enJUck9vUlNGNFUwMHlLQVZBVW83MWxs?=
 =?utf-8?B?dlh5Q0NkRld1SXpFakJGTGVWcHhqRzV1NHJ0bUlqcVY3dXEwNFVwN0FrbENV?=
 =?utf-8?B?SkQrQ1I5Y0FBZkZnRzZ0NWpPMFpZb3NRQTNyMy84UjIxdU1PdDRsRzR4bEVp?=
 =?utf-8?B?YlV1aXNrSXU4cTVTNDB6MHNsRkFraGcvUHJCRGJiRHBhZ1EzWXZaYktsM0J0?=
 =?utf-8?B?SDMwT1BickR5d2MxUUR2UVFsaXFHTnRxUHNEYXl0YWhJdUlqSHBzNS82N0dN?=
 =?utf-8?B?ejQ4Y0VHNmZwMlVPQlBNc3MrY0MxTldIZHN4dDRRM0NUQ1dLMlNnUTFWUXI5?=
 =?utf-8?B?NTB4bDhKVUtreEk2NUdLcWdOZEYwS05kR3crejI5WGtMQ0ZncVhZWGpaUzFa?=
 =?utf-8?B?U2prWVZXQ1VYR1k4TDlPaG5EeWlzTmJPMDJ2WjdwLytwVUF1eU9HZG5rbTQ1?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dfdee9-697b-4828-4a74-08da9b08d95e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 13:06:01.2684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K914dzOhVHGAK9ZY60S8yfYKiLnJjUZeGDbaTJ5jM2CK1AlFEt0oSNdLIXhnkRGkVe2dWBEpZkZW/GUGlAm1mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5419

On Tue, Aug 23, 2022 at 01:56:22PM +0200, Jan Beulich wrote:
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -55,6 +55,9 @@
>   */
>  #define HVM_VM86_TSS_SIZE 265
>  
> +bool __initdata opt_dom0_assisted_xapic = true;
> +bool __initdata opt_dom0_assisted_x2apic = true;

Defaulting those to true unconditionally is troublesome, as the check
in arch_sanitise_domain_config() will fail if either
assisted_x{2,}apic_available is not true, and dom0 domain creation
will fail, so...

> +
>  static unsigned int __initdata acpi_intr_overrides;
>  static struct acpi_madt_interrupt_override __initdata *intsrcovr;
>  
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -68,6 +68,14 @@ extern bool opt_dom0_verbose;
>  extern bool opt_dom0_cpuid_faulting;
>  extern bool opt_dom0_msr_relaxed;
>  
> +#ifdef CONFIG_HVM
> +extern bool opt_dom0_assisted_xapic;
> +extern bool opt_dom0_assisted_x2apic;
> +#else
> +#define opt_dom0_assisted_xapic false
> +#define opt_dom0_assisted_x2apic false
> +#endif
> +
>  #define max_init_domid (0)
>  
>  #endif
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -784,6 +784,11 @@ static struct domain *__init create_dom0
>  
>          dom0_cfg.arch.emulation_flags |=
>              XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
> +
> +        if ( opt_dom0_assisted_xapic )
> +            dom0_cfg.arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
> +        if ( opt_dom0_assisted_x2apic )
> +            dom0_cfg.arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;

...the values of assisted_x{2,}apic_available need to be taken into
account here in order to avoid requesting an invalid configuration.

I could swear I have checked PVH dom0 interaction when reviewing the
original patch, but I clearly missed it.

Thanks, Roger.

