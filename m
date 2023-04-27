Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086B6F03AC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 11:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526916.818987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pryHZ-0001IN-GL; Thu, 27 Apr 2023 09:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526916.818987; Thu, 27 Apr 2023 09:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pryHZ-0001G2-CU; Thu, 27 Apr 2023 09:51:21 +0000
Received: by outflank-mailman (input) for mailman id 526916;
 Thu, 27 Apr 2023 09:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pryHX-0001Fw-NA
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 09:51:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c4dea0c-e4e1-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 11:51:16 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 05:51:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7415.namprd03.prod.outlook.com (2603:10b6:510:2e7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Thu, 27 Apr
 2023 09:51:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 09:51:10 +0000
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
X-Inumbo-ID: 0c4dea0c-e4e1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682589076;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yjhs9dDFYa9Fqlyr4J4wesKeikDnBWLkAtQWiQjwyAc=;
  b=BbPSJNLoVDi8gulFGnU6J7+FGxvJ8rmNn8S3LjvP4H8h86fVEhAxsFxo
   kySbXMzJXuLeV0v/FgdOUGJyQnP2uOEjN8W+KrpVaAO9iE73hGzSm1Nhh
   osKHcVIxCL/BDcsJaXnWwb1JKTTnTQA8Sp4aWZQlOEzWOcDb2OOGM1P/D
   w=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 107461788
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AdxvVK/5q2BHkWSTzLdCDrUDRn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jRKXjqPP/qMYzP2fNonPY3n8RgFu5HQmNI3HVRupC88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOaoU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl/z
 tc1MxsjYiy/rKXqmpjnZ8tIodoaeZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUuidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpNSOPhqa466LGV7mghMEUtSnumm/KCuwmiV4JdI
 RMxwyV7+MDe82TuFLERRSaQqXqJvBcaV8BXVfMz7AWAyK386AKeG2RCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXAGTT8JS00C+daLiIM8lBXUVf54DbW4yNbyHFnNL
 yuiqSE/g/AZi54N3qDip1Tf2Wvz/97OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRdlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:7n6X5amXCfZfwHjDW+Lr2xvocYXpDfKd3DAbv31ZSRFFG/Fw9v
 re58jzsCWetN9/YhwdcK+7Sc29qB/nn6KdmLNhWItKPzOWwFdAUrsM0WKK+VSJJwTE+uRczK
 dtdLVXBdDqAUJhrM7h4WCDYrAd6eKK+qCwhevY0l9hQBpncbtA4w91Bh3zKDwOeOAhP/QE/f
 GnivavyQDARV0nKuCAQlQUWODGp9fQ0LjhbBI+DxQk4AeDsj+y8r79FHGjr3UjegIK5Y1n3H
 jDmwj47L/mk/ag1xfa3WO71eU0pPLRjv94QOGdjcAQKj/3ziKlfp5oVbHHnB1dmoGSARIR4b
 7xnys=
X-Talos-CUID: =?us-ascii?q?9a23=3AFa8JbWhTKX5yhE51QWd1Hf/wHTJuQ0b24Wz7DUO?=
 =?us-ascii?q?ENU0uFOe/FXKy3IR6qp87?=
X-Talos-MUID: 9a23:hYZPtgYF1JtNV+BTsw3U3Ap9FNpS6J+fT1wBwZcM5Oy9Onkl
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="107461788"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CefeabRc9C97zlwaQzwagDHtMY6glNHR2NkMwyIs94MWJh0nR7gR49L/muAaIj6IQAUiHIOTb8CVFSQWlYjRaUk4NhXWo2K8D2zmdFj6V8HoLJdWnmRT/qzasau7sMy9auUuXQ8/Dt2YTfp5abiNpVVHxEqc3hPwCQPUKhUg4OORDifLFnjEGsQQNL+SNcOrSdJGP52zvk8ybb2OUDUkerzSO0Z8m3XHoz29CcG6ZqRZ6HoOXFuwWFnDKC4+M5bP9ONDzn8tre5yowGinx9tNbWYfDfPb2Ra54VohPi+0sAW4ViOi6vwO0K3ZKmBX9wClwz/lX9bWrn0qSgtDkrw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8B8r2CQO5o0S0w0vbsn0/Lring0Lo106pFhpgXCuls=;
 b=VTiKV2TElX1rm1AsnIXMo5jBoZMwApvWeuRLHLrjS/oV1WBgt7e663dnKg/5fWDR3y01HqswbKqSz7nh/SnCbu+nHM2f+Ma1KpeGNARLYrZ1IYrh6EGhY4lIlWFBSfjf9Dk2ISQ3kD1q5OfK3qBOip/pw75TTbEwE7HU4UK/REdI26zVnFxBgPkcK5orsvwGi1vlQVZrJ8fiCPjtfquUL4ftOdZKYYFlcNNJucp7AH+yStE+6wCep5RTJ2+TVpZ0YGsJivt9AC+B3txhne7pZg81dgSj7kvp8bymJYswtGWNxnVLdftKlOYCrN4JY0hm22Bd4UY31S+kL2zYp4ZNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8B8r2CQO5o0S0w0vbsn0/Lring0Lo106pFhpgXCuls=;
 b=bdMp4oq3tfR1f3Ptso4h1c2fagGjeEXrvodpvZNh/Z0c3VlSAIfMnNCWCH6MvmOYyIgKPOM1QdcjCP1hNPP9vnJo0BA0qJgIXSO7UNXK6nYCBf6NtpXPPAcmgrnEYIrH9/FZD8MK+8+I8V9NbHqbo+YyjkRbEg/DIdIm+EEy6ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d93a5eaa-1f6f-a2b9-b238-04b8bb1a33dc@citrix.com>
Date: Thu, 27 Apr 2023 10:51:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/7] tools: Make some callers of xc_domain_getinfo use
 xc_domain_getinfolist
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-2-alejandro.vallejo@cloud.com>
In-Reply-To: <20230426145932.3340-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0045.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d14635-0686-49ba-6ea6-08db4704edc9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oMo7F1j9gUDOKU0sGWHXVV4Wdq2EVBlDqp0r2tSo4j259N6DvSxBLQAnrjb6Lp9JNGumQQP5NjNSRAJL3QxJAinrsuwluWf0awd6KdISTodbj3yyCCMw5Q52opKjPbhdPahFej2vBc73UgrTWqKIor5xC+wSdhFJPos9ainZbxQt4gU5fooOm7+RjVCsh56r7J8DFHf8kHaIG3ACqCg4O7Pndb3TBotjczLSMVhcap9GJ07yADsetTVMInK4aoQ4jkzEx7uJuzVuFd8OrePnbddiqe2Zt5h9L3ENHy25w8gY6ini87uAP3cPLWuglqPU26eOXPtUEhkkhVvXFcRexT8mc42IzhFg6pO8XoNW8xomkHDPNnNE9Iu7lSJ7aDbVNl5dNBMaxozlXghCVWQiHvyp750mRIQBIiMSs0DWQH6qi4WLCPbt862txPqVl5gx0D0zkF7XW0kUfeAs21W/Z+eD4TMSzCdqbkPr1OvLmc2jfCtK9rV2UxAxYS0JmFAnHCOpchJpP0D/VjHtPieZBQG4wmyYEszPc77Jhl+6GVoc8DgelsX4YLgec7+NLSuEHI9q/e1iqBt362sVht1Y6AefCH8qSpNLsMbJzkjJZ5w3wjlnezteMZ4VtocPvvJb1zY8jWyUVtxzHtVRUecDww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(31686004)(6506007)(186003)(26005)(6512007)(316002)(53546011)(8936002)(86362001)(5660300002)(31696002)(66476007)(66946007)(66556008)(41300700001)(110136005)(83380400001)(2616005)(478600001)(8676002)(36756003)(82960400001)(6486002)(4326008)(2906002)(54906003)(6666004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T09HRHI4OEl0WUJqWWlSRnpTSnJ3N1Q1YXVQWHRTQ3FWa0UyN2ZKQlBqQnFY?=
 =?utf-8?B?WkMzYUsrdlVURUh6YzZ2SnFldlBNQ0tJUWxxTkN3a0dONjIzZTE0dGJSb3A0?=
 =?utf-8?B?eTdEakhETW9zNXFHdUs0U21oMDJsTGtkSCtNR21uSDQxZkVJYXFWM1dRVEZw?=
 =?utf-8?B?dFhJQjdYa0U3Sk9sdGMyWmUrT1I3ZndLMW9yVEFBU3o4dzNha25QY3U4dnZi?=
 =?utf-8?B?QzA3S3N5VHo0Mm16S096Ymk4RHcvZkRWZ2lhckp6bWxRQTJWR3Bub3VIcE1D?=
 =?utf-8?B?cFB3aVFJa01LdlVWMDNmUlBQQWg2WC9pcjdUaFFqVXBGaVRBRGN6Vk1vNUtH?=
 =?utf-8?B?QW5ISHhKTFRwMkVxRVhNSzZNdnpocVRtUlhadFh5UHBSYlZvaGRxMTdrSlAx?=
 =?utf-8?B?Sml6YU5rOGttVUY1QXVCdDIzbXh2R3poSFVlbCtDSlgwQVU5ditHWVo5blM1?=
 =?utf-8?B?MlNOK3RNTkV6MGZUSFo5enNqSjdmQ20wdUJNK1FYemJUR3dTelAzOWloNU1n?=
 =?utf-8?B?ZGlCUlFpcHZDZDI3MzVhZmkxamRlZ3BZZDM2Ym9uQlMxcGNVRGpPUkpBVnls?=
 =?utf-8?B?RGQyRVJrcGtrbk1ncnY4TkpIS04rUFVDV1VSa0ovbklJZGh5UXc4M0N5Yzg2?=
 =?utf-8?B?Umt2K3dsb2tzeC8wMlpUeGtkZURuVkRJbk9wdGlWWXU1NGkxaEZhWHFxbmE4?=
 =?utf-8?B?UWdUZ05QS0Q5WUkvVjc1REJ5Zk8xYkF1RkZ4NlhONExHdDJZelozU1ZBUjBl?=
 =?utf-8?B?SGszYzYxVHRGY2d2WHkwRXBGZWhSSHJvN3g1RVk5b2lNVzBlOCtzMHBBSUVi?=
 =?utf-8?B?MnNHdU5BT200RnJBVXJBek5QNEdWY1dzOVV1amR2R1MyV3dNVXZtZjRjZnlt?=
 =?utf-8?B?R1U5TkZ6bUJETGpqSXlwT3B6VnZNNGpNcFJUUFZvdEg0dWdkSjg3RHVKTjYy?=
 =?utf-8?B?M0lRbVhITG0yNmVNSTVhUjhReWNJb3hLbk4zK3YxZzVZSnVuS0F4blkzMEdE?=
 =?utf-8?B?Zk83Rk9ZNXQxRE1VakdxdHpOWDNVVHN4amJ3S0graEY1RHVaWkJIMEcyUDQy?=
 =?utf-8?B?ZWw3TzY0RGVBYndTeFBRc1dUdTdJUkh5ZytXMlluSERxcFJEQS84YVBtMzFi?=
 =?utf-8?B?RHpONGthcko5cFZRNmN4OE4rWnBpdm5RNzh0dTdWWmQ3UGpGOVhRN0tzaFla?=
 =?utf-8?B?dDJZUkcxcmhTUzB4alVsb2dibmNBYWxkSVgwdmdvbDRpcjVoTnF0ci9OTFRn?=
 =?utf-8?B?VjdiTDV3YWlVN0xCRk5jaVFyeDlabjdCRTZRV242TFN5YVJEMktETVkvQkxL?=
 =?utf-8?B?cTNsZmt3Rml4akpLcWxmZCtTTGZ4QUxLVFE2cVdMOVZqVWN6YkRCRFRoa2RI?=
 =?utf-8?B?cTBhRWN4SFhTZ0NIaW9qQkdENlVKMGJzVG9ENUFDQlEvekZEbDBjaWduS1Fv?=
 =?utf-8?B?eVppa0NQZkVoWCt5bVNPc2J0RWU5NVpQVm1kNUFCbFZ4NFRhTVZiMmtzWjVs?=
 =?utf-8?B?WEhKR3pkdTFvaDgwMmZldytzem1PR3hReThiY2c0VWhGczBTNldnVlJFbmFV?=
 =?utf-8?B?RGpGYXRFNGUrWml5ckZGVko4QUV6cldVSkdUTXZyU0VtdXFjYkNNMERnRUdv?=
 =?utf-8?B?dTB5a2wxa2Q1UEE0TW9vZE5nWHNwMkxLMTJTT011eVIwRkVsUUl2SDhVUGo1?=
 =?utf-8?B?TVpTQ2E2eGtaMjd5WW1lWVpacEkwcGZSMHFiK0Y2cGVkK3dNejNNTHEwTVd5?=
 =?utf-8?B?TDhZMDJINGd3RFR6bXcrUXNOK3oyMUVyY0xGaks5K3A0ZWpneXFnKzZJMlFB?=
 =?utf-8?B?MjlJUVBvOXZ5bTlkVFBFTUJYRWpGek9tdmgvNFMyYnZqaEJ5UStZTW9ZMmRQ?=
 =?utf-8?B?djdEOTU1UmRtejQ0bXJ4aWpZTmJ2U0kwZFJjTk5mZERmMHJxc1pxdUtXMGFh?=
 =?utf-8?B?S0krWnNUVENLREVEdVd1NUdHTFcxalBFVkVuUW42cE5jT3dWeFRoRzNrdGpI?=
 =?utf-8?B?K3c3K25nMXFmZ2kzcks5eVRtOWhZQlAvd2U0LzFuSlhGcWF2SjZSaVhVTHR4?=
 =?utf-8?B?b1pYMmdoOWRqb1lUSHY3ZmhNTkZ5Y09pYk14QlcxYWl2RUp4NXNWQklpMERK?=
 =?utf-8?B?THRlempHWGY4ZFB2VWVqeTI5SmdyWHpQUWNkL0xRNWZ3eHZybVhnSCs4REl2?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G5B+0FJCX8ayF+iZ/eieNJFL8AM1wFK787uBx8M8hZiw2VB9RSHb/vHoqkpLD6Ik3u9nW6YNdgNFYffvg3aSn6/BcuvQioc28hubjF22ZqomiWTvVBXY5sO4b24iOwmfGEvXpDcVXGfvXE+vCbZHptNthOjwMA7Be+MNsleWLXYHMFxH6Pk9cT/KFllRbgO29lyXdjD2UnVG5WPCVlQvAcxVHXybj+knRqWgL5A2S3RjI9WneU5JA/I3j4jVehd7iLjlug44WeMSyE2MTgGSfGaWOCppiOyEQuvDho6MadYD3yE4nMmslVa+EdaWYlAQVNBbKt6eynkeO/bYB4Giqmbavk76TzmONLe4q33ALvrg/hZ9qaSDIqSc4FF6ov92Vd2vkaKx+j/FBfEPb36SRRViqyXb9wemSS4tL1Ey+BQtZwJ7uoSFfFRBBBfZvKtejLZdeEY3wn95UUab08OUqJX96NaBShO0O+xh6ecrx4ZNRstwXFC7fgzxAgpcJTP62g0y2UYmz7aJHDNbJKaHxQCm1FZzd3ifbWjbaypcXpG7+TNUr2NTlZBkF5tncin3PHBh3DqIF8L0sjeRIw9CXjER+umBqtkXc30Zy9ifiDDm3Q0Jm1rt6+BU9pOGaisPtz/a0OMZon/kTMJILomnyJWUgom2HamwPsyAD3wTSaVYoJCoV3QoCQEsqx77duKmiV44Urb1n/d4qmqkBOaUW6oND295MA5TAiN0pTKzfiNErDF2PJ9PP9dgURSPjFEzFplyAiRBoygdxBXsfryB8ptCkbTGwWjihNsw+N+1rNO6Ra5NG8IKT6ukTwPH0fiQ9kCQA/5JPhKzNfZaihvpyOBfOUUCfet5hj26e+mel9c=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d14635-0686-49ba-6ea6-08db4704edc9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 09:51:10.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyKGVl/tvuaKVp6NWXetpqs+jhKNcyNGoEhEHoa/QEAp7mZ5+NiE8JXJeowEFK1Kd9FpoU07cC1moPkBbx35m7jP2bUNs2BgRhqgBF0x7Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7415

Just as a note for the subject, we more commonly write function names
with ()'s.

On 26/04/2023 3:59 pm, Alejandro Vallejo wrote:
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 05967ecc92..90b33aa3a7 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -468,6 +468,11 @@ typedef struct xc_dominfo {
>  
>  typedef xen_domctl_getdomaininfo_t xc_domaininfo_t;
>  
> +static inline unsigned int dominfo_shutdown_reason(const xc_domaininfo_t *info)
> +{
> +    return (info->flags >> XEN_DOMINF_shutdownshift) & XEN_DOMINF_shutdownmask;
> +}
> +
>  typedef union 
>  {
>  #if defined(__i386__) || defined(__x86_64__)
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
> index 35901c2d63..38212e8091 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -368,21 +368,22 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
>          info_dict = Py_BuildValue(
>              "{s:i,s:i,s:i,s:i,s:i,s:i,s:i,s:i,s:i,s:i"
>              ",s:L,s:L,s:L,s:i,s:i,s:i}",
> -            "domid",           (int)info[i].domid,
> +            "domid",           (int)info[i].domain,
>              "online_vcpus",    info[i].nr_online_vcpus,
>              "max_vcpu_id",     info[i].max_vcpu_id,
> -            "hvm",             info[i].hvm,
> -            "dying",           info[i].dying,
> -            "crashed",         info[i].crashed,
> -            "shutdown",        info[i].shutdown,
> -            "paused",          info[i].paused,
> -            "blocked",         info[i].blocked,
> -            "running",         info[i].running,
> -            "mem_kb",          (long long)info[i].nr_pages*(XC_PAGE_SIZE/1024),
> +            "hvm",             !!(info[i].flags & XEN_DOMINF_hvm_guest),
> +            "dying",           !!(info[i].flags & XEN_DOMINF_dying),
> +            "crashed",         (info[i].flags & XEN_DOMINF_shutdown) &&
> +                                 (dominfo_shutdown_reason(&info[i]) == SHUTDOWN_crash),

Isn't this your dominfo_shutdown_with() from patch 6 ?

I'd pull that forward to this patch too, and use it here.

> +            "shutdown",        !!(info[i].flags & XEN_DOMINF_shutdown),
> +            "paused",          !!(info[i].flags & XEN_DOMINF_paused),
> +            "blocked",         !!(info[i].flags & XEN_DOMINF_blocked),
> +            "running",         !!(info[i].flags & XEN_DOMINF_running),
> +            "mem_kb",          (long long)info[i].tot_pages*(XC_PAGE_SIZE/1024),
>              "cpu_time",        (long long)info[i].cpu_time,
> -            "maxmem_kb",       (long long)info[i].max_memkb,
> +            "maxmem_kb",       (long long)(info[i].max_pages << (XC_PAGE_SHIFT - 10)),
>              "ssidref",         (int)info[i].ssidref,
> -            "shutdown_reason", info[i].shutdown_reason,
> +            "shutdown_reason", dominfo_shutdown_reason(&info[i]),
>              "cpupool",         (int)info[i].cpupool);
>          pyhandle = PyList_New(sizeof(xen_domain_handle_t));
>          if ( (pyhandle == NULL) || (info_dict == NULL) )
> diff --git a/tools/xenmon/xenbaked.c b/tools/xenmon/xenbaked.c
> index 4dddbd20e2..8632b10ea4 100644
> --- a/tools/xenmon/xenbaked.c
> +++ b/tools/xenmon/xenbaked.c
> @@ -775,7 +775,7 @@ static void global_init_domain(int domid, int idx)
>  static int indexof(int domid)
>  {
>      int idx;
> -    xc_dominfo_t dominfo[NDOMAINS];
> +    xc_domaininfo_t dominfo[NDOMAINS];
>      xc_interface *xc_handle;
>      int ndomains;
>    
> @@ -797,7 +797,7 @@ static int indexof(int domid)
>  
>      // call domaininfo hypercall to try and garbage collect unused entries
>      xc_handle = xc_interface_open(0,0,0);
> -    ndomains = xc_domain_getinfo(xc_handle, 0, NDOMAINS, dominfo);
> +    ndomains = xc_domain_getinfolist(xc_handle, 0, NDOMAINS, dominfo);
>      xc_interface_close(xc_handle);

Not to do with your patch, but this is logic is mad.  xenbaked open and
closes a xenctrl handle every time its set of domids changes.

I'm very seriously tempted to delete all of tools/xenmon because it
shows no signs of being in use, and right now all it does is spit out an
unending stream of

gotten<100ns in qos_switchout(domid=32767)
gotten<100ns in qos_switchout(domid=0)

to stdout, which is antisocial for something calling itself a daemon.

~Andrew

