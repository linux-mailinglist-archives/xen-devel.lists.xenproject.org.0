Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316A6A1FC8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:38:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501274.772949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb50-0005EE-Dj; Fri, 24 Feb 2023 16:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501274.772949; Fri, 24 Feb 2023 16:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb50-0005CW-Ar; Fri, 24 Feb 2023 16:37:54 +0000
Received: by outflank-mailman (input) for mailman id 501274;
 Fri, 24 Feb 2023 16:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVb4z-0005CQ-G7
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:37:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93c94f87-b461-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 17:37:52 +0100 (CET)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 11:37:49 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6179.namprd03.prod.outlook.com (2603:10b6:610:d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 16:37:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 16:37:46 +0000
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
X-Inumbo-ID: 93c94f87-b461-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677256671;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A2ltDIxK0Z7OtJP62qJfsCpYbJWpsn/uFvhECxWTVS8=;
  b=Nbuy8MchyaZiLTn9yt5JMaBb8RBJYEqaYqI+h5mvJOV0i+4degA/9r9m
   DKybyysn8GRGFFozcbc3N6vzJZsnERNCumhUAWost/xnynIKcyCyCOPMI
   7JQbkL5IJln0olnpfhOZqE7LtuviDzpGdWiZ0fOrTcW6Qu2LaHvQnBols
   c=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 98347659
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sr6Ei64JLAqVmCOZqPXCdgxRtAnGchMFZxGqfqrLsTDasY5as4F+v
 mVKXWGHbvmOMDejeNh+aozn9UlV6sPRxoQyTgJqqy5kHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR4AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 8MCFBAyNTG/oOvo37ziae9n3eMvI5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+eF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNCT+HnqKM76LGV7kIvECEVW1eAm9eC1nOeV+AGB
 k849DV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgcqeS4BZRsI5Z/kuo5bs/7UZtNqEarwgtirHzj1m
 mqOtHJn2OpVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:njhBQqqtYpSeru2i9zOW3DYaV5oWeYIsimQD101hICF9WcaT/v
 re+8jzsiWZtN9xYh4dcLW7U5VoLkmzyXcY2+gs1NWZLWrbURqTTL2KhLGKq1eMJ8SUzJ8+6U
 4PSdkbNPTASXR8kMbm8E2ZPr8bsb+6GXmT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98347659"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPl2E8nLvzFGXzWIW4FeWnj7H6jZ9oxR4ASvsNShwFIk7GuLehrqHVNURv0aX9KOZ4EHUxOH/aCsHfevM+Mq3IbqDdNFnhDdxJW4VLZiVZBNxs0eXiuRMZzrkUFd2JZNqsFjK70nAOUJJ0HGI5jtEtaaENjyhKTytk5vdK/vlYdCnQyQ6NJqt297PjL24tWNx24Zhp2lWCM8IKqFYxVjRY4KcMzrf/bJYmAPs9ekBunCxgZkkMTypoVIyhu9Cs2lL+dcBvLOqVI+VggGa31Smo+HEraDG4Xs+yI0sbNGmCvYRN6lvJ1DmoRMJi+bk7Gj8nTgxDi4Ow4A3CvaHY9iPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgHb+kl3c343dpaFQUqBPUninPZYgF4SgVkufcJ8BjI=;
 b=lYyGagMrRQfcyRNz3m5ptWl60l/250w0WVejc97l/LHDjf3UHe+uGaB9z9uhC78gv99AbzFEO8OF6jUwhbksR6YZHbHQUkcHQdRSv87/J1CnHyQJgjLj60bT0oWFUEbrJ/ztPv5ML4gSs1nlX0cfj3+z58b39axr1qINZTT5EdSGVVuRqnI0PDUDTnfTz6Xmy4DYyyjZ0l4EAAwwel1NcxowsjL5oYtaUKSdoOjZippCQ65WU9JpA8owyL56yymDC7L4soj7TVwoOtl6ewWeYPxfOqDJJsT2xBSk+pqgtzwAgjfP+pFrtyYyEf0BZVMOeYJL07j9jMS8+pSfoqJFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgHb+kl3c343dpaFQUqBPUninPZYgF4SgVkufcJ8BjI=;
 b=rY6FngsAkT9YRLOy63sExAGqU4jRz+8DJgqsHijJ+9deqNtiYHa4SzWzAZybr06pzliG9RzSadEwmUJJf1hWa6hGRA1yVNRJJC3CQgfwzi4BvwOvN4Ppe61TGGEuvTqBkTnydEyAPot1SGZbQtmSyqCp764Y3eM1BbUjunLrUaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e3a644dd-19f4-5fae-212b-374a72caf380@citrix.com>
Date: Fri, 24 Feb 2023 16:37:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] x86/shadow: move dm-mmio handling code in
 sh_page_fault()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <0e682cd4-3cc0-461d-ee53-13a894797f17@suse.com>
 <5d8a938e-cb4a-a989-1849-d702cd25d890@suse.com>
 <1d4848eb-4b99-1492-45d1-c0ce2b0ae6a6@suse.com>
In-Reply-To: <1d4848eb-4b99-1492-45d1-c0ce2b0ae6a6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ec776f-f633-48b6-8289-08db16857555
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M7whaxct48Gnwk3mftRcr1vSyTSKDCdmzrVZgkHoa1tkZJSyBWYlixxaBqZaUnIXed/AiikbuFD+mJvMmGn+/Ilvmc7RP66RdLsZ7oQcpG3pwfXU3Rd3/rMiMDu3hN+AxopbyAb/AVSsNM6aYunikwgmPqsZCtK00qKfM00J+wxGFgHbwSxhCvmPHYGhAvTRVQpN0+vEVNZZyM+P9GuO5WaD7kHPndvx9fnNLAMG3VH91TPLt8FbBZ7h4ZUbh3oKEV9y0mBXB7reMdsw6aQqmymr1zxTe5onPlkFbHh2RPEZ+CfqKtJeLt5ClwcfJGDeDpxMYNPEjEf+KRW0U6YE75DJnm25LkO+6p7tP8zCHDLGqX5uvvaw/E/6nF81bfcF+nsq2NM05SE708vfZlHxgcUDUzYxZmDbyIWNWtjR5s8jFKhrXNgE322hhcVHaHjQHvMn5TCI2Ckg7qKlahUqV7qN2yI0xqYh12Ww9JZXUGjzSnBihizvFIqE/ARkYg90pGHbvyk3UGINBHLgLHMqtU+UrZcvF9biiaZVNN0/eF8+zNc0oVWIviNHL4HuW5RLdsDQqPJnHZBujOWriAcDxZtlfCsG3sU5/IDfqhe1IDPcAfRN5XbAJ+dvzSv0FQVAlG4ihN4ZH7D1k3+kiwVbxrAqxQUGBGQvyvQkTQ1kd5iaPBcmpZ/lV3DL1JYWQA4weWxU55Z7U5TYfQZ4ldX1xCuvSwMYzpMaPzWiJjbA7KAfgubPwtV6I1EfN+OaEp6DEMyLEFmLpLCdHWqPyffqHZis1CA70E7aKL9Yek3EaC7IC4C/hLsimXb1o7odiIAc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(31686004)(2906002)(5660300002)(41300700001)(8936002)(66946007)(83380400001)(66556008)(4326008)(8676002)(66476007)(316002)(107886003)(36756003)(186003)(6666004)(6486002)(26005)(478600001)(53546011)(6506007)(31696002)(38100700002)(86362001)(2616005)(82960400001)(6512007)(110136005)(54906003)(45980500001)(43740500002)(473944003)(414714003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmkvOVdOTVhTRnBQMVNrS0dYb3FDY2ZvSnpHbVI3NmZXRFJZR3ovcDVocmYr?=
 =?utf-8?B?ck0rK00xcExuZVZPSUMwdk5UR2syVDBDNlVMNko1L1NPeGwrV2R4RTYzOE56?=
 =?utf-8?B?VWYxMjNNZXZsR1JoZ3F6U21LODZDQ1N3VUR0NjJkVUVRUXdqZzZhbDJ4WFdD?=
 =?utf-8?B?RmcwLzc3dVUzS3Y1NTdVcEN2aVZmSlNpeUtTWG1oWW0ycHgwdStwWis1Nloz?=
 =?utf-8?B?aEtMeDVXOWVyZHFhT3VvRFhNekl6WFFVUHdtSTdhWW55SFNUMzhEeHhnRDFL?=
 =?utf-8?B?M2QyWDNZVjBldmFMbWMrVjRzWEVBSnNjbkJKZ3JURERpY3hJblh5Y0pZdHZE?=
 =?utf-8?B?bkdlbVpqV2ZPRit3c3ZNVmphT2FWNXNrRW5TYWRiakNKa2E2OVVsNDA2K3VI?=
 =?utf-8?B?T3FaZjNNb2lTNk50aGNMVkhWdGdvVThZanArbmZGZnlPV09XSmRUUlM1bVho?=
 =?utf-8?B?b1FYcUhWQnNFaDdvTjBva2YvVXhsSnBBNWZ3eGJ3SlNKL1NXOEUvQkFKZzUr?=
 =?utf-8?B?TkZjcjJCRWVyRUhCOVBzUFdUTFVvd1QwZUFVMkZNd0wyRkJXS2J1cWplQlIx?=
 =?utf-8?B?QVNWSmJSUDNkOFppMGRZWFQ1dCtZOTBWZDRqWEJ4WVMzcTZGSE5tNkt3SXNX?=
 =?utf-8?B?NCtoLy9FTWNJWUU1a1kxeUhqa1BUS0pmaHFCb0w0TU1MbUl1MVprWEd5TFJW?=
 =?utf-8?B?VVNydDh4L1JXelRPWFp1U1Y1Z1JUUGsvS2NYc05OZkQzbHVza2c2aVQ2aWVn?=
 =?utf-8?B?OWQ1ekdwWjBNM05SRGdnbDRZSXdrRlpLOXlVRWVXUHJyR0N4VzZNZit6cXg2?=
 =?utf-8?B?eVhqaW52cWpmd29VRmZpekVrcXlTRm52NnNzU3VHUFI1emNzNkpHY0xLcGxX?=
 =?utf-8?B?aDNRTlVON0lQRldFWldvRkZkcFNoTGpoZmpLRytWZnZVZDM4T1I4aUR2cEwy?=
 =?utf-8?B?Ymk4VldLWEVvK3JwM3B6U3RkeHJ2NW1GSms4d0pBb3p2ZFZNdFZ4ejBFS3o1?=
 =?utf-8?B?UUpXc1h6RFl3MVdpMGliOTErbnBuaS80Q0VnOE9XM3B1SXk5MmRpeld2SkU1?=
 =?utf-8?B?WER5L0pxdUhaTUVPdTByVUcrQUUwQVNDcnpSREwzWlRnZWcxYm1oSjNJSnhi?=
 =?utf-8?B?TDMrMzJBS1QxakRDaW5vYzhSUktxU0ZWR3dyZGU0amtackc0cUhHREliUjVY?=
 =?utf-8?B?WUc0MXZmVnk4dFVEelR5elE3eXlKZXBXdklLSDU2ZWdCcVE5ZUdvV21yZVZq?=
 =?utf-8?B?TmZjUlFPQUFUWlM1VVBBN2pwaDg1eDFDV0pDWDg4RU9IN0RQNEVJdEljYmpw?=
 =?utf-8?B?cEVSZVRad1BTR1RXSG5iMWFLTmM0Ym9xVEpDOStYaW1KMUtmb0ExTGs1MXRI?=
 =?utf-8?B?eFZCNmhuSENTWDZGazQzVWRTYWM0QThPQUprdWZFZ2w3WW1pWUNrZTFVL01H?=
 =?utf-8?B?WWJ3bFc3T3RTdFpNbEYzaDlieEtKQWlsN1VBRnYvcDhvUnVWRkVETmZsY1NJ?=
 =?utf-8?B?MEZoRlBrTytkcFVnMmRDb25YaXpaWnFlbHhEMGR1U3FocnViNGFvV0c1akpm?=
 =?utf-8?B?eDlMa1hsNmdVaWdMMEVCS0lwTlZjdzdjK3ZUWG03NkIrYWlnTWdvZnU5QnlP?=
 =?utf-8?B?Y1BTS0FSL1RzNlRKZUM0eVpZTWxoU0tBclVtMkZYNXRvZ0dKbHVMb09UcmVp?=
 =?utf-8?B?YUZwSURuK1JrVXlia3FtUG04dmFoYXdpempoUHlQbE9wZUNiM0dzVWYybUw3?=
 =?utf-8?B?c0NIL3VlcGdWMG9IOUFhMnZWR3pkaHJWd2t4Mjd1bXljdTZscEY1K3UxUWtL?=
 =?utf-8?B?RG9qbTZwV3lwQ2w1TmxJR04zNTlpQ0VLcWRQYWJ3eDBOcUw3ZStBSjRaSEw3?=
 =?utf-8?B?MmJXOEFzWkxSZWRCd1FycjRvd201a1l3MllveTNPZHpCYi9HbGI2dU5LZDdW?=
 =?utf-8?B?MlFodUdhaE9LUjRSVks3LzBpMEh4bUlxOTFsUnpJR1dzOVQyN1IwQkpQOHZj?=
 =?utf-8?B?bHdsSmdmTEdrcUFzUVZZTUoxYS9VMHgzYWJtZUxsNUQyOTVzWTNpbmNmWHdF?=
 =?utf-8?B?UG5ibVZtOVh3Nkt2WEZ2Vll2REo2OUF0dm96RTl6cXRQeSt4QTFydkRxWitN?=
 =?utf-8?B?L3o0OFNPMTFJcndGeTF4UXZEVjk0eUU3dHkxbFl4ek5HMXc1V0tYbFdyMVRU?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/I1rwimKw9Fc6+dAlhvkjghhv6d8DHTPrI4a/uS/bVmU/iIZkXZ8he7XLbcfm+kw5fcuUAV62SxiG07eZJDa8+MCAH3G2yKRYzD3HoWRP3W7l7fPShF9ql5JnjqDJJbret54AVvVTvWqu1BsGRlHi6g+9WX82Rh954vXlF0uA0qwF8GkuT5kz79pPxHsZErqVOk8Av5ueSlBQtFGWnnzZktB97qhRq078ljljBAoAnafW2e9l5dg5rovxu1VbZkuoHB6nLgrUNmTVHt7D7/r6xCJxUkIXWfQwPv3AjGF1nlvYUb57wMTu+ljWRnqurN7MuJ8lxmAs+P5h6a1UkD5Z6NJV1Stejrumxx0Uuc8aMk+eJXg3JYHkPGxliLQavbIq+MexFJsqnQlDxKI6qxrCYqIllfSdtZ7TY/ARMNT/J94+7SBQc4UGeaJCcRPiBFRMO2kphC6MFuD5OY3hUWjJbI77O2HeEZG+SSK3HhXiTCZj2oJe3TtQ+R6KAXjqerqpjSgcxXPQKjqbueQe0Ojon5WnbS+n1dcAbisYdE1ZXM/iYcH5Xw5c1I8iB0NC3htNkV6eqz6jrq5vh3bJRJEwWtpQfTznBS/4RvKmd3ApIrsgMH+1SpNSBMONflpjaJTTxfASg4aDbQXqD2vegPG6LorCr72K1un0WUnRt9zU9sjY1yt1ChuSgVFtnv/TtZWqaEs/OskksB0kcJs04J0LJsuwtnrarL2OokLFGNMnfw/PSGV2vmbEDFIuVKriBB7ljJ1qmj1NYTdOfwfchBOpkk74oZJUtGTEmqbRE+Z2lkPuLfxowpDuay6EM9r6JwG
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ec776f-f633-48b6-8289-08db16857555
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 16:37:46.0556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7GFaFv5Yd/hc95zVvazGWQsJj5lMmU3TLxsY0saYaD+F61p4+MBxVc7zMWpxgvNvu1mXn0xxRyr/LmynOGafLOY/BGvGdgow5b6SAQhquw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6179

On 23/01/2023 3:08 pm, Jan Beulich wrote:
> On 23.01.2023 15:26, Jan Beulich wrote:
>> Do away with the partly mis-named "mmio" label there, which really is
>> only about emulated MMIO. Move the code to the place where the sole
>> "goto" was. Re-order steps slightly: Assertion first, perfc increment
>> outside of the locked region, and "gpa" calculation closer to the first
>> use of the variable. Also make the HVM conditional cover the entire
>> if(), as p2m_mmio_dm isn't applicable to PV; specifically get_gfn()
>> won't ever return this type for PV domains.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: New.
>>
>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
> I've sent a stale patch, I'm sorry. This further hunk is needed to keep
> !HVM builds working:
>
> @@ -2144,8 +2144,8 @@ static int cf_check sh_page_fault(
>      gfn_t gfn = _gfn(0);
>      mfn_t gmfn, sl1mfn = _mfn(0);
>      shadow_l1e_t sl1e, *ptr_sl1e;
> -    paddr_t gpa;
>  #ifdef CONFIG_HVM
> +    paddr_t gpa;
>      struct sh_emulate_ctxt emul_ctxt;
>      const struct x86_emulate_ops *emul_ops;
>      int r;

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

