Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB94516F08
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 13:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318805.538734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlUUe-0007h0-CB; Mon, 02 May 2022 11:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318805.538734; Mon, 02 May 2022 11:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlUUe-0007e1-8c; Mon, 02 May 2022 11:45:32 +0000
Received: by outflank-mailman (input) for mailman id 318805;
 Mon, 02 May 2022 11:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=deGg=VK=citrix.com=prvs=114a22fc5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlUUd-0007dv-2v
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 11:45:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bd799b4-ca0d-11ec-a405-831a346695d4;
 Mon, 02 May 2022 13:45:28 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2022 07:45:23 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4200.namprd03.prod.outlook.com (2603:10b6:a03:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 2 May
 2022 11:45:22 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 11:45:22 +0000
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
X-Inumbo-ID: 5bd799b4-ca0d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651491926;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VPL3GxdKtXSiM0rjukpXDHiYIzYigfafgYo7AuFQlSo=;
  b=ajl5L+YXriBBCgj7XSOVH2qxoHMSbK7yDaR5R/RhfizBOAtTIJF6UQVL
   GdHG9Ds3NqLHwNHqn12HHbtmJFvKyjbLPEet1K4N+l4IbweRntbHHqfQf
   ffZL6GKUmxsX/SNflQd4EtJyCNWyRI4kEiqB3F6OyQCtZn7wjaGjgM8NS
   A=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 72836414
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7i+4FKpeTlZUyUJQeuUWJqfwuZleBmItZBIvgKrLsJaIsI4StFCzt
 garIBmEO/eLNmvxctsnPNuz8hkPuMDdx99nGgRo/C4xECkX85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 Yqq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBLI/oh8sWUUdkOAZzMvdkxfjpCla6mJnGp6HGWyOEL/RGKmgTZNVd1sMpRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjHFp3pwm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK//psvTSKkGSd1pDtNpnMdOCBBvl+oU3Ci
 n/E2mTHPzQzYYn3JT2ttyjEavX0tSH0QoUJD5Wj6+VnxlaUwwQ7ChcbSF+6qvmRkVOlVpRUL
 El80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL86QGDB3NCSSVdcts4r8wnbTsw3
 1SNkpXiAjkHmLqOUm6Q7avRpD+3OC49PWIEfTUDTwYO/5/kuo5bs/7UZtNqEarwgtirHzj1m
 miOtHJn3+lVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:Nhf8WKjAkgHIPrM+tslBJqE8bnBQX1N13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeSWCQfkNIN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 D52+pT5fVzp/QtHNNA7dc6MLWK41P2MGLx2UKpUCLa/fI8SjvwQ6Ce2sRG2MiaPLo18bAVpL
 PtFHtliE9aQTOaNSTJ5uwHzizw
X-IronPort-AV: E=Sophos;i="5.91,190,1647316800"; 
   d="scan'208";a="72836414"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0NHzMoFKDHqgT6DjCtUoOrHWmdv7BqPTcwMJu35PBPuunn4xKPz6Xf2oBJ/+sMtHXSW2SqPmIq83FFPZNl0OH1G+ebKt72pzSKC/8jTtN8rWM2S3VU0kk/z839hMIZ450XLXZb5YcbqhKyyMsR35hL232SveFFmEQD+zYVJtCBTQv5xRSB5xkSv/QyndXbg73Tzm7DpSLj/QUIuvW9K2dIvOlfHoM7wyJnD4gsp5+596FlKCWeyT+Smdz/3vEwAe331XRJyy+Hi3Q60vPSJ3mB865vGQdl5dleN3niq3MI7YfieSluMDX6JAZd1mCF3tCy89id07EJynBSvvJLZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnbsPNuB7Eoa8O7wY1LGJ/wJR9m6qiA5YTokPsC2WC4=;
 b=lTwLJ1qiMASzRwBnACtrL+DheRE7yPjhEXKZyxq4jpa99kNI1cPhIBY5x5CNLpxi0UigDe92/IvMHxeXG4CPp1hY/PEdInneYetIxDUrjo+Ac/50TUX/j8iY+viBukigXbsDLyvYySAUuntvgG7NdhmPqr4y+LnmOa5b7HjkZriALN9aLAtonRfxx3oxbUeIQ+M+Wc6oGZUntvZje5kPI3tFKdrJaRbKdhAZdzI/58wrBBR9W3tAQeFuOvEqDMsZ7ARyytfHqjSwlPJkz1sySndcNyYWA6jhu7w22ThvNL5ZgTNz65VoJU5LKFwCyE3YQj0sVxdJ5RbuTmowqowESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnbsPNuB7Eoa8O7wY1LGJ/wJR9m6qiA5YTokPsC2WC4=;
 b=cPWEh50vj3rHY36gkxAmksXCHCinaIH/LxI58Gp+RGKfptxKR+hDeh3ECbmPfNkzaoIBCRkO22pKpDGDbqoix03FDSt6LatzZ3O71zH6x66FdPZkXgD0Ee31hIoF7q3xRikbnKk0QhGbrhshRjquSTUWL9Dwj3Q49SoG+9BiEWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 May 2022 13:45:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable test] 169819: regressions - FAIL
Message-ID: <Ym/ETb3HIN0m7TEJ@Air-de-Roger>
References: <osstest-169819-mainreport@xen.org>
 <Ymu+WnVjTANHk+na@Air-de-Roger>
 <25a16b3e-e235-698a-452e-bb87920adc89@suse.com>
 <YmvFYK7tk2174HwB@Air-de-Roger>
 <7ddc783e-cf0e-4a16-dbec-8c45fd603b9f@suse.com>
 <Ym+3VIAvoit7ZhTm@Air-de-Roger>
 <e7470baf-c0d1-e4d0-6d90-95d4ea354ba9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7470baf-c0d1-e4d0-6d90-95d4ea354ba9@suse.com>
X-ClientProxiedBy: LO2P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28ab218e-674c-478c-71f6-08da2c313d0e
X-MS-TrafficTypeDiagnostic: BYAPR03MB4200:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB42008C64E4E6FE364991AEF98FC19@BYAPR03MB4200.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7pT5eYhfyeZhccaEBPnRfbMHTA/zvxZllLc8i1/Au+D/Ojs5miKwuUwk1nfKc7RC8iYGRhDwfKwmA3CH4Pyxu+SwYaH7mmtnWi1k6JUwpBgfaaM8hpucr9MrRM4zgoSI1j7IOpS94Ub6aZcAsyCQeWs08YxZ1BnxfC8C9UHDXtNAXAZ+DG8tTxIi1cNYWdlL7bSwsoo8newpRP22gkdepy1/xE6qvkS6z0/rbMJI2ohs9dhjq3ZXc1xzYbr8YxvwAo9FGOE5KhqAvBkqLH/zl3pUlOYt3L3idLHY8kpTG1MViDsvlGYlqKERgqrw5Pc7kh4WYV/tyB8EA9J4yLUqDgSJs67FmR4M7CgVoa8ZK7t/T6noerZUG99uH7Bv+mE0h2RdywvIaku7QXMnrx5lZCmASVm9DiZD9ZJLF5I0zLD92EFrp4RIqUV82yjXkLOF2SxPRToeSIdQ/GW1sZB/Pjlzngbu0pKx4lbcw1XEqJTpSZerJtM70cPRINimwLrqAUzccgEkQFQvI2n4ZAd0yGqY4LA5TeMe5uNJygexnwQ8Mj3bXCcQ93NLQ4G2RWWT2ktYZ/aAcGU6f2SKRdDs0UddblbJZXjGvqe4ybgYNDeKW+A66fjHFf3dGrh4/b2jarfwHr5Abu3jtS+h+6ZChCV6ggVtedvRpYbGpUD8maYgek9hfVjsXemc9c8NeAWInEY7hcFil9LkY2t29/KzvzCrSKvMYycBkRqD7F3o3n99vRURL2rKlZ3WyhuxXqMKUdLox5Q8xIdcE9wCptDUMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(508600001)(966005)(30864003)(6486002)(83380400001)(4326008)(66946007)(86362001)(66556008)(66476007)(8676002)(8936002)(6666004)(26005)(6506007)(186003)(53546011)(5660300002)(316002)(54906003)(6916009)(85182001)(9686003)(38100700002)(33716001)(82960400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFMrcitCa3ZxUlZkVnJOak8zbUVhT2dabmcwRlQ5MHVqSTk2WWVqcTFIaVhS?=
 =?utf-8?B?NVh6c1NteHQwK3B3a2M0M1prLzVXSzlaZzJ3QzRST2lDWlZpY0J6UXV1ZTBo?=
 =?utf-8?B?RnpSQmREUktZeFhPUjBXSXk5V0UvZ3JqK0tmejdUeXlueGlHV1luZnN5dGZM?=
 =?utf-8?B?Q0wxc2dZbkxEc1BvaktZSFZ2cnZTS0Rxb3NtT2NKaFZLZlpmSGsrY3E3SENh?=
 =?utf-8?B?ZGVzZ3B4UXN6WEM2M0VpUjNPaWJqcEczSkQzbzQ3OW1wVVpRR3l2bElvd3hG?=
 =?utf-8?B?cTI1SkdlU1MvZURXY1lvSlFSaWwvaHlMbXA5aENveHI3VWoyQzRGZFZQNk5E?=
 =?utf-8?B?WlV1YUl2clpRVVhvT29vdC94a3UraUZOYWhFTGVqbURiVks5V1ozN0JMRlIr?=
 =?utf-8?B?RkYxVk9mZU1rM2N2NGs4THJ6cWdCY0FLWk54MmtzdG5CTjlnakNIZGxGVit3?=
 =?utf-8?B?QUljVHdEN3hTY0kxNGw5M0o5UEljOENNR2tPbjB3QmFwQWMzT0Rac1NsaHRD?=
 =?utf-8?B?bllySStlNGVPNjgwdCtvZHhhS3o0U1FuQmh3eXBseGxmZVVGTzUxTkhKakcw?=
 =?utf-8?B?SHg1YjVWR0RZMGc1VnQ2amZNOXhOY3BQZ0IyZUQydis2cXRQeUdHZnVvVU9G?=
 =?utf-8?B?VWJHZ3pLaHhmYW0zTWJyN3NxcjRML2kwb1QvbGV6UEsxbENtOFJtNEdWQ2Iz?=
 =?utf-8?B?NWFtanc5clhBdWpLS2tuVkJ2SUlMMzB0MVZCVllrZzFBS3p5dTV0OTJYR0JE?=
 =?utf-8?B?UDc4d3dqeUJmaC83Zjc3SnVyYS93YWtJWk9Ec0pxNkZWbEpyZnJzbElHc1B4?=
 =?utf-8?B?cjFPYUd2NTUxVFVRdnJveXJaSkYvY3dYYzVmQUp5YUNJcHNOaFYyYTIzdzJ2?=
 =?utf-8?B?WmJrTmtjY1EzV0RiRTVzRmQvNXNWVERrU2c1bmt3em9xWmc5RjdIV3pFSGpT?=
 =?utf-8?B?UFEyQkJ1TE13QVdncnBQWHIwa2tweTlGMHQvbFZNcTcwN29ZbklZcGdXUVpZ?=
 =?utf-8?B?YUF1eHQwR2duOTNKcUQreFp1RVJIaEFha1AwUGx4R2ROek9xemhjUktwWWwv?=
 =?utf-8?B?TzVYaERKYUtpeVVMM2RIRHliQlB5NG5zWkRGTklDTkJZSmJqcDdwUS9jVmxt?=
 =?utf-8?B?M2tId2lkdVRlSS81VGRyN2dhVVl6Q29CVHc3YjZGeUJldnV0VFZEazVpc3VD?=
 =?utf-8?B?YVdaMzh0QVo3SlVYWHBCc2dtRUNHYmNUOTRzWG9Rc2hJYS9STUJnWU41eXlW?=
 =?utf-8?B?TDJFQVdndXpZazJ2QzZTeElvRHlDdFU1NmQxZlZGOGhPK0cvSEFlbEpTdXN5?=
 =?utf-8?B?Z1VKb2xQenRZcUEyUytGVzRmVGpRSkxrL0hEVnlvRVN5YUpMck1ldDhJUnM4?=
 =?utf-8?B?eG5WaEVFWXNGYzFyVFQwVGZ5RkI3aXZIckloTStwQk0yY0REQXRXQUF6RFhS?=
 =?utf-8?B?c2Rxd2FFcUV3ZitqUkNKRTNzTFZlOVdZQUhHSkV3ZWhEUXdZWW1qY0NYNFVr?=
 =?utf-8?B?M3hFWkZrY2RZeTRnMzYvMDJTMXRmNXVCY21LUFZNTlVEWWRUUmhRY3JEOFZv?=
 =?utf-8?B?QnRqd09CdWllQkp0VUpOR0pRWVpMTXM4bzZnY2M1ZFR3NjQyRndGbDY2YlBU?=
 =?utf-8?B?SzFBaFZOcGVScVB1aVVTNFo3QS9ac21PTjY4YXJsSk5PL3h1cTU0S0tHbzVX?=
 =?utf-8?B?Nko1SjJYUmtoWGRDQnBneHM2TitZRk5iM3BmSkRRMWwxSUZoUERiNmFkL1Fq?=
 =?utf-8?B?a01NOStmY1l0amNMMUltZ2F0endtT01IUW85T00xU0Nlem5XdTlLZUJDcjRh?=
 =?utf-8?B?MHlIYndFNTBCdytydlBwVm00S1c0TndVM3dOVHMyOVBMOFgwUDh2bnU3TWJh?=
 =?utf-8?B?VjZMejBQUUpjTldWcUl1bjlNNkdHUzF6ZlkvQThWTVZ1akRTaGpuQzdKckhv?=
 =?utf-8?B?ektVY0NDdTlXS2x0UDJCYk1yNnVscFF1cTVhSTZlS1VOSVZKakd6dmt5RE9Q?=
 =?utf-8?B?RTJkQXIwQVpIalF0TW1Od0hxd1pRKzFkYTlrYk0yMGJ0ZnVRWDluTjlyNVho?=
 =?utf-8?B?UGhBMGhMeFRmWFdINHdPVFNhQ3lJSjJ2WUgweWtXWEpTMXVxT3A3eUxReFB2?=
 =?utf-8?B?ZFJ3WklUSFhjdnRtL1JmVlp0TjR5WjYxclZCckFVT0hwWkEyMVUvMHl5U1Ew?=
 =?utf-8?B?bllrQ3NzNDdESkx5OHIvb2hBUzhLK1RYZ2dFQ0tueFlnQ2hKQ1FJZ25ENGFN?=
 =?utf-8?B?L3FPdHgrQXBHVVNBNmJKSVhWZU5VakVJa0E5YzhPM1hOay9OV3gwVkROTU5t?=
 =?utf-8?B?eHdhZ3hlVzc3dVVpK3NVV1VQNUFHSHNESC9FQnR6OXNKT3Vsc3RyeCtJWDdM?=
 =?utf-8?Q?XWZjCkw2fOZHpvkw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ab218e-674c-478c-71f6-08da2c313d0e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 11:45:21.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XT45R+WUtRpgUx36gB2bAI1T4C0tproB3quUrm3kEc1WUfmnsF01Jo8srYbgQsPlBvV7FGexBXfhWoqruOrNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4200

On Mon, May 02, 2022 at 01:16:05PM +0200, Juergen Gross wrote:
> On 02.05.22 12:49, Roger Pau Monné wrote:
> > On Mon, May 02, 2022 at 08:51:40AM +0200, Juergen Gross wrote:
> > > On 29.04.22 13:00, Roger Pau Monné wrote:
> > > > On Fri, Apr 29, 2022 at 12:37:13PM +0200, Jan Beulich wrote:
> > > > > On 29.04.2022 12:30, Roger Pau Monné wrote:
> > > > > > On Fri, Apr 29, 2022 at 07:46:47AM +0000, osstest service owner wrote:
> > > > > > > flight 169819 xen-unstable real [real]
> > > > > > > flight 169843 xen-unstable real-retest [real]
> > > > > > > http://logs.test-lab.xenproject.org/osstest/logs/169819/
> > > > > > > http://logs.test-lab.xenproject.org/osstest/logs/169843/
> > > > > > > 
> > > > > > > Regressions :-(
> > > > > > > 
> > > > > > > Tests which did not succeed and are blocking,
> > > > > > > including tests which could not be run:
> > > > > > >    test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 169775
> > > > > > >    test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 169775
> > > > > > >    test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 169775
> > > > > > >    test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 169775
> > > > > > >    test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 169775
> > > > > > >    test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 169775
> > > > > > > 
> > > > > > > Tests which are failing intermittently (not blocking):
> > > > > > >    test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 169843-retest
> > > > > > 
> > > > > > Looked into this one, and it's slightly concerning, guest seems to be
> > > > > > stuck at installation:
> > > > > > 
> > > > > > Select and install software  [  481.093857] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [  509.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [  545.093820] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  573.093809] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  609.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [  637.093836] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [  673.093957] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  701.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  733.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  761.093817] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  797.093898] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [  825.093863] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  861.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  889.093945] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [  925.093974] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  953.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [  985.093832] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1013.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1049.094031] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1077.093860] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1113.093938] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1141.093803] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1177.094051] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1205.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1237.093955] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1265.094004] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1301.093835] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1329.094039] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1365.093883] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1393.094167] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1429.093857] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1457.093900] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1489.094026] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1517.093997] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1553.093996] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1581.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1617.094076] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1645.093882] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1681.093896] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1709.094022] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1741.093870] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1769.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1805.094017] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1833.093837] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1869.094043] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1897.094101] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1933.093879] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 1961.093933] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 1997.093952] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2025.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2057.093895] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2085.094172] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2121.094018] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2149.094021] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2185.093931] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2213.093864] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2249.093951] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2277.093899] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2309.094054] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2337.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2373.094111] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2401.094132] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2437.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2465.094003] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2501.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2529.094050] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2561.094027] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2589.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2625.093999] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2653.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2689.094024] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2717.094093] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2753.093913] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2781.094095] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2813.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2841.094117] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2877.094041] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2905.094009] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 2941.093893] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 2969.094085] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
> > > > > > [ 3005.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 3033.093917] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > [ 3065.094060] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
> > > > > > 
> > > > > > debina1 is one of the boxes I've put into production recently.
> > > > > 
> > > > > ISTR this issue having surfaced randomly before. With the randomness making
> > > > > it difficult to investigate.
> > > > 
> > > > Indeed, it seems to happen on other boxes also:
> > > > 
> > > > http://logs.test-lab.xenproject.org/osstest/results/history/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm/xen-unstable.html
> > > > 
> > > > At least doesn't seem to be explicitly related to debinas.
> > > 
> > > How valuable is it to test systems using a kernel from 2019?
> > > 
> > > Chances are high that bugs which might trigger are corrected already.
> > > IMO trying to find probably known bugs is a waste of time.
> > 
> > This is the kernel from oldstable Debian distribution, which is still
> > supported (until June 2024 AFAICT).  I think it's not unlikely that
> 
> Yeah, but at least the install kernel doesn't seem to have received any
> updates since 2.5 years now (compile date is reported to be 2019-09-20).
> And supported doesn't mean that a kernel will run without any further
> fixes until then, but that fixes are applied. And this seems not to have
> happened here for quite some time.

Hm, so it seems the installer Debian CD for HVM guests is not updated
as part of the rest of the install media update process.

I've now updated those and I'm running some tests to check we don't
regress.

> > people are running those kernels in guests.  I wouldn't mind testing
> > newer guest kernels, but someone would have to update osstest to use
> > Debian 11 which ships with kernel 5.10.
> 
> I don't mind the base kernel version, just the lack of applied patches.
> 
> And BTW: this install kernel seems to lack any Xen support:

Yes, I've also noticed this, it seems like the kernel from the install
media doesn't have Xen support.  This is official install media, so I
think it's also fine to test it works as expected.

Thanks, Roger.

