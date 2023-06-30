Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67183743901
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 12:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557405.870730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFB4C-0005QT-GO; Fri, 30 Jun 2023 10:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557405.870730; Fri, 30 Jun 2023 10:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFB4C-0005Nf-BB; Fri, 30 Jun 2023 10:09:28 +0000
Received: by outflank-mailman (input) for mailman id 557405;
 Fri, 30 Jun 2023 10:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHd2=CS=citrix.com=prvs=53833986c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFB4B-0005NX-41
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 10:09:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f86bcd6-172e-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 12:09:24 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2023 06:09:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5785.namprd03.prod.outlook.com (2603:10b6:806:119::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 10:09:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 10:09:14 +0000
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
X-Inumbo-ID: 2f86bcd6-172e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688119764;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GmFNp8K8JfE78h1Re9CtcdsI6YYAHm3iCcjPPEbGD7E=;
  b=iHHfQIpnm0O+TCcmTSN4JGRHcDma552mbUQN2IyS6RB7nSJYkyeO9myB
   7uj4CUkLUbrHNX3bDvPQ3lJrodsfmaACyeTushKe1+w0Rin6rKkrzcXFC
   tchIC96+G0dwHgqFQInB5/ocwpQKPUN5dFCBcU+ee/LAyrF4QQu1apt+e
   o=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 113446869
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DTJ9S6KfxahaDyBSFE+RdJQlxSXFcZb7ZxGr2PjKsXjdYENSgWdVy
 zAdWTiGPavfZmTzc9sla9mw80MAuZHdyIU1QAJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4AdmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5MW35iz
 NtHdQtQfyyu3duT3ZuLV/Bz05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMk2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqgBN5MROPpnhJsqHuBgVxQCycVbn6+r/KTrkCja+MYG
 3VBr0LCqoB3riRHVOLVXQC8oXOClg4RXZxXCeJSwAicw6zX/gOQLmEBQnhKb9lOnPc7Qzo7k
 G2JktXmLTV1tfueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adlcbpEDv9x
 zSLqikWhLgJi8MPkaKh8jjviT+2uoLASAJz4wzNR3+k9StwfovjbIutgXDl6vJHIJecX0O2l
 nEOkMiD78gDFZiI0ieKRY0lA7yoof2FPTv0iERqWZIm8lyQF2WLeIlR5HRyIRlvO8NdIzvxO
 haM5kVW+YNZO2asYelveYWtBs82zK/mU9P4SvTTadkIaZ90HOOawBxTiYer9ziFuCARfWsXY
 P93re7E4a4mNJla
IronPort-HdrOrdr: A9a23:CGQKVqC74sFnHcTlHemp55DYdb4zR+YMi2TDtnoBLyC9F/byqy
 nApoV+6faZslYssRIb6Le90cu7LE80nKQdieMs1NGZLWrbUQCTXeRfBOXZsl/d8hrFmtK1BJ
 0AT0AuYOefMbAl5fyU3DWF
X-Talos-CUID: 9a23:U9pDVm5XY3ZTQEHcg9sszxQLNvkCLSDmkWbsDhWBLHtAeKCMVgrF
X-Talos-MUID: 9a23:03G+Ogq5qcH43uC8Hksezxdwc/cr4J6tM2UIn54sn8eZBR03Cw7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,170,1684814400"; 
   d="scan'208";a="113446869"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kh6Z5xeaggZf7lZUhPoH0enotqY3yrS78NogjgpGk7zVaWBhimUZO1QWn235IN2jMQJu5ZVS8e6qMMa/bHrBjPMv+3QLdyDrfwChojrU0RUcInugLFNyBOR6E07CwbDF+heu4C51PFBHQCH6TspW4EVGjGsflze8JXXqOOnKDjYonhkBtaQHjOI9/MHimVF7D00jybY8L9qsuMWB4FLeGXRX+WDCfikJ7TCpIBosJPBw24AKd7LEI8kpJCKAGCrNtkXXrEuzQb5Kff9V79aJnpJ9nz5QoGSGE3U31LSiEQsz/gTu41JOLz3VUnI3aQ09HhDDcBAsbSdtUyNIfi7r1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmFNp8K8JfE78h1Re9CtcdsI6YYAHm3iCcjPPEbGD7E=;
 b=Y7sgpLehJ8OwiY1rP/WA23pwUguzqtAleXx0nXWf7UH07jFXKFD2ROearZNh65e2Oi3M+vCawydHcZrs7gRpjy5btY+/CcM4D9ufeBzpR7cIkvOwcmuZBQSPZX4PzZ+6/FAgOIRkCQoS94MKflOb0H1G5Ol74tMZZrjRBECiTiXr15MOKebL7dAzClYIpOOrhcfQnyeljjYqEfZgqhcACN2hXfzdwIbEDkzPk75c2wyrPFgZusagjAqFI+ZVODH559kMuIYKi1iHrmNLIzw9wKQD5j9R2H3FGECayGn5jrnbVLltcUOOmzA8Yex092NNZXaqTBZucqUdsUT9ncLO1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmFNp8K8JfE78h1Re9CtcdsI6YYAHm3iCcjPPEbGD7E=;
 b=VyQUQn++WqusFOB/eHqENhFlgWx0gYdwvOjkg8FgR242w5IXwTBhAlOzpZo8dqr23naq4nfyNTRshyzL/rW7VTcwnBKZokCa955/ZZqMsBKDa2uBlXAbW+HJqLn416zlZLcvcWpKXpCOXJkLTiRRW5z2vyK62xAlEYGB7qCSRDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4d436616-2c9c-a2c9-78a7-b0425d212dc4@citrix.com>
Date: Fri, 30 Jun 2023 11:09:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 24/52] xen/mpu: build up start-of-day Xen MPU memory
 region map
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
 Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-25-Penny.Zheng@arm.com>
 <778688ab-8fd4-2b06-e644-b5a013bb56f7@amd.com>
 <39a5a729-0099-67e4-bf4a-c65ae99a4619@xen.org>
 <37e2856b-038e-6a3a-a6ff-c518dfeda552@amd.com>
 <f849b3cc-f9c1-131a-f6c1-5be27911ec6e@xen.org>
 <301e2e02-f2ab-5538-d426-52a02a7f35b5@amd.com>
 <6a06868f-beea-13c3-5d18-23930c7dd971@xen.org>
 <5ae6e98a-2bfe-b48d-0dae-96ae1d76f79e@amd.com>
 <99e28fa1-b702-a4c4-47e7-b023237f5817@xen.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <99e28fa1-b702-a4c4-47e7-b023237f5817@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0555.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1e7bf4-db3a-4dd6-7d2f-08db79520ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BuWyWK6UqS2w0Y2McVDi7RDTviC7gKJ2wJBR1dgVywGcpgZfNsarUkSIzjjNrGvjpoqs0TPUQ7VvLWu1HsAzxvfcw0H4x5dWNS8N2SdNxxRG0xc50WUeTbUUwGGHSr8AAXCgR744376vzitdbsFhFbNXgAi2toujfYGIuc4d/8OdtP9bfBSr6BgnwJVcGNu2gLqmbMUjDm0voI7HRECfU+oNFC+IvB60yC/4j1VTHzHkA+YsWZxxMfHE5pXiqOi+BL7I1M+HMigVqE9qIfQ62OHNfnnWjWt/WfFPagyK7eRe82ZcZmX6zI1y3mNXa8V0P8fV29DxgdVwkoQ7PzTRCfJeHeXUpbKeYXZcao2ZJy6NNSExsTb1xC3vyZnFTyJpSLRMasi3ohB0jtYG98dBVtA9OzoPejafcRwaJkLoBJMvfoz7Yj55mkE6XKS0cljWOEqP2YXT5Bqd8W1Q9+7I/fSIp6BsAGa7U8j2nZ30GW9YWWGv5zQ8ssIxdl0jLUe6heWY5qptYAdrhmPtlVvoOep5Dfyfvs8sTV06wphFrOlxTLNVdeX3wFgWPZp/7c+TpUBXDIibmR7qZe7SkoQbGQF6sFishxbP9GazP5NuMZiv8T53k84L6Qg0kZ7D38p3e0dnXhJ06ShXtLaGfh0lEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(31686004)(86362001)(54906003)(8936002)(8676002)(5660300002)(110136005)(31696002)(26005)(6506007)(53546011)(6486002)(478600001)(66946007)(66556008)(66476007)(4326008)(6512007)(41300700001)(316002)(6666004)(186003)(2616005)(2906002)(83380400001)(36756003)(82960400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M01FSC95Sm1iQXk1K3VJallsZDBKS3hBakJDWEtFZ1NCWWE4aTd2MWloNHIv?=
 =?utf-8?B?dmZ5TzJQQWNVYkUxS2o2SkNnYjB0R0p2ekVtY0J0ZHZiV3hMcVpTbThwS1No?=
 =?utf-8?B?c1loWHhwbTRFZ1FseU9UcVZCcEtHYVB1MmxjSklXUE1XQmRQOXIya21BL3ZG?=
 =?utf-8?B?RE1oYm5Zd1hmcVhFMTlNWmhrV1MwOUdWelhGU2hndFFRWjlVZTl4UTIwWVM2?=
 =?utf-8?B?Z1dNa2w5T2l0UDhWZHhDSHlyZEphUW5KQzArT3FIaVNPem1xY3VvNDZGbCtT?=
 =?utf-8?B?a0tjV0g0VUp3MG1HeXRuOXBPYTB0dXlYMmg4Vk05a2daVGxJS0xRNmhueWxB?=
 =?utf-8?B?T3lkaW53UTVORmNVNEd5NmV2Mnl3WE9TaXFhS08zSmh1dnNyTnRzRTdLd1Bw?=
 =?utf-8?B?eXFpc2grQUQ1TzdlaUVWWExaa3NabVZraFhyU3phUGJ3M0sxUk9lZVYxV1E2?=
 =?utf-8?B?LzZZbzhtVk93R2x4RmVZb2tEYlo2MEV1MmRoRXl4b3BsdGI2L0tEWmU1MGMy?=
 =?utf-8?B?QXo2UXVBVTI3Sk40aW9LRE5KNWxKQWRzcDI5VW15VkpGeXNoaGVBYVBHbGNr?=
 =?utf-8?B?Z2xyZDJOTXBOVUVvaDVWZ1lrT2pWL0x0ZThaSGprRTIzODQ4WnVOa2xrb3ZC?=
 =?utf-8?B?ajVISWZnTzhieHh4UGRMM0JoL1NXYXJzNFpFdHlvcWNMU1M0SWRHSUdGVGhL?=
 =?utf-8?B?bGl0dlU2OW1PTm1zWjRWaFJEVUJmU0ptb2ZUMDNENW1Pc1NadE96RFRyL2Vt?=
 =?utf-8?B?cWQwOG5TbmZ3c3pkS0tCQ2ltS3FyVVVTUWc5SjBNUVc2MTU0YlM5Z1ZRNnFw?=
 =?utf-8?B?STEyK0V1Z0ZVMzg2TFNyZ3dDY3lpaVFqWHFUcjNCMmViYXZqbFFDWjFET1dQ?=
 =?utf-8?B?NnFydUVUZjZqWHU5YVpiY2UvSU5NT0hQYXZqc3U0SnR3RUZvbWxUaVp3UVdz?=
 =?utf-8?B?WWc2bzhKZU81SmhGbE5iUE11cFVmcXdmVzNvdkZPN0w0TTYySW1pb0VORE1T?=
 =?utf-8?B?RVJwWWRtVXBZendaT2grZithRUcwQlN0cEEwUFh4cWFSQ0lSZm45ZmlCVnBp?=
 =?utf-8?B?NWVQZTJaOEZvU2k1ZDltYXAvd1g4OXZQaVVsUEJDUHJUajhKS2FwOFFlUHZ0?=
 =?utf-8?B?OTBJTm1CNXlTcXFrWW90T2UzMWVYQ2sxcjhRQ29RMEoxSTBlZm5weVJNNmQ5?=
 =?utf-8?B?WjIxek1OVnNyL1dhQWdUalpHMGlZcGZXY1JLZk51eTVleGYyZVMzNzl1MGc5?=
 =?utf-8?B?cHUrR3dvU1lzNDdpbngwY0dGZ21nSmpqbTl2M0tSWXBDZmVEK25GbFU3cU1z?=
 =?utf-8?B?SjIyZ0dFY2FZVWFoN3RpQXBib2Z1emlDaDNUMWdNbHF4MG16VXNnakVDbzBR?=
 =?utf-8?B?SjlrWXBBb3g2aHlqN2E4K3VmUEk5eTVBUS9hUDJwQURiMjZtKzFsTWtIa2F2?=
 =?utf-8?B?dEttQ0ROaHRrWVRkVEFnVDh0cWowNU0zWFBqak5GSWVhTFIrVzl5WUYyZExr?=
 =?utf-8?B?Sk8vN3MySHJMNm9TRFNwZTh1eHQvWDh0UGRxblM1UU9zU21MREZhL3l0WWQ0?=
 =?utf-8?B?TVdUUXgrSmJtU0hRMi8weTd3ZEhzbnc1Z3h0S0xOcTkrTXhMV015b25xUGRx?=
 =?utf-8?B?SFVnK0VsTTZpNTJyRDk0dDU2WDhqeTlXWFZyRkpuQkFyRUNBWlFreVoxSzVp?=
 =?utf-8?B?ek8yRzRISFhOam5vOGhNTVVrRWE3b2trbVZ4MU5zZ2FYRmRzSWhMTC83NzNS?=
 =?utf-8?B?RVZ5VVNYbVJEWE84VnU4REpUVEpNMWVuZ1dJcC9iY0V6Y3VMaU13bXRxVmgv?=
 =?utf-8?B?dGRSVjNTNDRqbDBrdkpCS2JwZnBGdlRrUWZWQnBQQkJxSFduNWFpNnlYT083?=
 =?utf-8?B?R0hSZlozT0xQZEc0N3FQWkY5M0NKWlhYdWQ1QzQ4WUVRL0dPNGxqTnRLeWZC?=
 =?utf-8?B?VVlLelhWT2dHdG1nVkxTeThjeDdWYXJQdkJlditqNlRVNDdteW5EVFNHWG91?=
 =?utf-8?B?eVAzSHVKb2xqTkljTC9UTkZ6dVhjWVpPMlFsMDQ1R2NpVjIxUncwUDVxM29R?=
 =?utf-8?B?dy9aQTlybU1nL0RjSStFSVhIR0V1YlRXNVZMbm5DU1ZNOC92VHNGTEs4NjVI?=
 =?utf-8?B?dFZCMlVReEEvS05KQ2JvL0FoK3gwYjNmTUNGbWcvNDVjdUQ1RDVHSEd5emtz?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	srufk11lmFo6WVN5MubMZi7F9g/qmGgejtyOAc7QRn3PbKTorTKP1J3JX4R8fY+9XQKQPxVbcAVQqQMICcEuNbPho8l7h1HtoxrC/eOvht5zlfDXV1yxnQ7bZOIvONuiHjD0bxoqnsj/e4L5gBvtiyWU3oj62iT7Q6H8qg4jT0sWyVjPuSjKiqeTh+N4pkIhkMuYkxV8tJ0dgSMHMofUg3uQ9lyTlDpIk1JiauvxPG+oU8qLKMA5IsGy2kguw3ZDFenVrqENUpTCm2vPC+wDUwKGMvbXAOkHiFQ97P/ND5zu7TiEe3HMHjPMv1FyFuKVSiyiwIafZsU7D8AHJoFhH+NSLU2ljKfXv3/HBfpLY3w1JXdQI5c7ne38ybEzTKP2QJlV9BO5VnGz9q3HUuFZL/qene7jizwWyMJFqB99wleDUf1oS167yQwurI3JhDP1LARew7B7QU1rvylouIxzpTnI9q6Fpa9o4jGoeEMYARci6efq7WLI4IHjRzrFjFBngyetoN1zepB5ZtrOVYycl57mg84uOAiwIf/OUdVP25Le3EaLVqdQQKakq15+I6IV48xyraTgYImXsZfYGa40TBKuJezgpEGmS6w7tDtxtfnb/awEOXiqVPaDaZkKA47eLWntNBKytd9grDlh2WWXdIOkE6y0MAERdCLHJLitDNGto8ry5k5qQSkkTjz/mwZz9ELYOHbXqnnXWRho7KSPdbe6nC8E3iLCXdceVfkvBWGLsafI3fOVBFaDOeqIjxb8chLg3SoRdV0GWuuOqO1CghbpcLEncmf8oDm9/EKQQSxnPe93o2zMflNalZSIzE0ItHjwS4OANRx2rWn3ARPHJ3YwzLSvVJj2G2BAxaifi664PPk4iI3mWMwtYQxIoS7yrer478P+IQs/MyVoAd3geg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1e7bf4-db3a-4dd6-7d2f-08db79520ea5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:09:14.7152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1LpCVyKyZG2pyVNisboDHt1OFpMOULfhjsliBeZvgFxu9L4sd+NKBBhHALtITGI2YO0jIdvI/2Qs4ygTz5OUPKOSQkqfL1U4guMmx/ujJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5785

On 30/06/2023 10:43 am, Julien Grall wrote:
> On 30/06/2023 10:26, Ayan Kumar Halder wrote:
>> On 29/06/2023 12:55, Julien Grall wrote:
>>>>> Furthermore, from my understanding, at least on Armv8-A, there are
>>>>> caching problem because you will need to save some registers (for
>>>>> the call to set_boot_mpumap()) on the stack with cache disabled.
>>>>> This means the cache will be bypassed. But you may then restore
>>>>> the registers with the cache enabled (the compiler could decide
>>>>> that it is not necessary to read the stack before hand). So you
>>>>> could read the wrong data if there is a stale cacheline.
>>>>
>>>> Yes, this makes some sense. So will the following make it correct :-
>>>
>>> I am confused. In a previous answer, I voiced my concerned with
>>> trying to replace the full MPU table. So it is not clear to me why
>>> you are asking me if the following work. Do you still want to do it?
>>> If so, why?
>>
>> I completely agree with you to set up the MPU table in assembly with
>> the correct permissions for each section (as done by Penny's patch).
>> That would atleast ensure that we don't need to reset the MPU
>> sections for Xen again.
>>
>> What I was trying to understand deeper was some of the objections you
>> had raised and if any sort of mitigations are possible.
>>
>> Again I am not saying that we need to apply the mitigations (if
>> available) in this particular scenario.
>>
>>>
>>>>
>>>> 1. Execute 'dmb' before invoking enable_mpu(). This will ensure
>>>> that the registers are strictly restored in set_boot_mpumap()
>>>> before the HSCTLR is read.
>>>
>>> I am afraid I don't know how the DMB will enforce that. Can you
>>> clarify?
>>
>> pop {r4}  /* As part of set_boot_mpumap() */
>>
>> dmb /* This should ensure that r4 is fully restored from the stack
>> before the next instruction. At this point, the D cache is still
>> disabled. */
>
> I don't really see how this helps because the C instruction:
>
>  set_boot_mpumap(....)
>
> could also require to read/write the stack for saving r0-r3. And
> AFAIK, you can't control when this would happen.

The argument is far easier than that.

At all point, anywhere in code, the C compiler can emit calls to
memcpy/memset behind your back, including (in principle) for code which
looks like `int foo;` (yes, because of things like -ftrivial-auto-var-init).

With things like UBSAN active, it's a much wider range of functions that
can be called.

If anything is potentially unsafe to the C operating environment, it
*must* be handled in assembly.

~Andrew

