Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5D512F94
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 11:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316346.535244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0gl-0003hI-4H; Thu, 28 Apr 2022 09:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316346.535244; Thu, 28 Apr 2022 09:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0gl-0003eG-0R; Thu, 28 Apr 2022 09:43:55 +0000
Received: by outflank-mailman (input) for mailman id 316346;
 Thu, 28 Apr 2022 09:43:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/gZ=VG=citrix.com=prvs=110729f0c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nk0gj-0003eA-R2
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 09:43:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b527977b-c6d7-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 11:43:52 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 05:43:49 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA1PR03MB6434.namprd03.prod.outlook.com (2603:10b6:806:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 09:43:45 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 09:43:45 +0000
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
X-Inumbo-ID: b527977b-c6d7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651139032;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nY/fhfXoEN6pk13iNtnkZanHjQ+cKzCxEV70lvK196Y=;
  b=bGCVrCVqQm7vK3X006tq3ZXFuFrjEuCGh/nHdyWe1xwVI2XSIghcUpWD
   poPh4qQEidWhRmi+OBnnTBSj0+x7JQwRos7ZqJl8Yq4Za7aQUJ0vLHCvZ
   dZEcg+FnsrZ9hGrTXjt9QaM2JiklQlSjKNk1mHrqA+PajhoCDW5aVx+UA
   c=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 70121105
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UbBr4KKIwBX8b7a4FE+RzJQlxSXFcZb7ZxGr2PjKsXjdYENS1TcAx
 2YWCm6EOK3eMDCkc9B0aoy2pEoHupDTzoNjTldlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tQ42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MVo7ZrrEB8RBaPRsfkESygGLCVGGIQTrdcrIVDn2SCS52vvViK2htBRVgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgH86FH/+iCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iClKmQA9Tp5o4JuuEvL8BR3iYPpD/b5S+eze5hkk2WX8
 zeuE2PRR0ty2Mak4SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3E62StjwWTWorXjCuQQTM/JLCPEz4gyJzqvS4i6aC3ICQzoHb8Yp3OcpQRQ62
 1nPmMnmbQGDq5WQQHOZs7KL9zW7PHFPKXdYPXNeCwwY/9PkvYc/yArVScpuG7K0iduzHizsx
 zeNr241gLB7YdM36phXNGvv21qEzqUlhCZvjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:nVJblqGeR2sCbn2gpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.90,295,1643691600"; 
   d="scan'208";a="70121105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkRtr4zK6erKBtg/jrjMGK0l9YX8o5ymZUVsw4pLqvr0w+YJBtG4Cc7RUCN/ZjUwqP2vHH0t07OvS6lXnyKf8OjyqE7zYfswgPDkiN9B27TE/xClCdwktq+PZ2CwieQF3JKZI+ajehW311ei+OhiNkQ9dSOQxn8/laO8yegukR2zoro8CVfYIlC8wbYsn21Oix8ZGVxhpfh5a5ya7xSQ+p8BQqPNtdLdw4tkUPfZf+5GzQDg99V2Rjza+pPdJ7n8HSX/9mDj4IiQaTqXI9/EoMTu3Zb0P8Qgo7NHaA0YYZbZI96aRqn7Smh97f0deoJVyXan/gPMh4gECmqF5WU5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gWzR/IKeJIEeqZ3Yxc4xmIEDHyeoCQY5xg7JAqb7Pw=;
 b=bTUwQYm7vUA0v9ptEt9jxl7o7h+qZ/mp/+FulKUI/FRhT/nMqapNMxP8JNo0pDHnOs8/Or0dw/W1PHnZBkC5uZlxuFumtD9/symjVsiaXQ8vQzxZIh1G89QNLye+p8HxK/sGRS1PPFoFfjX7pkKYDLYpj4nPMX0Ipxmt/vdzQAo/9WrTTOnKgeYRNyvfRQEm6brLJkMMbad42ijJjT/vrHI+iIT2TZsersvog6mwKU9pdIVdwT2Ufdz/3vAMEB+bEWFaf+Z65MR/8hP9vaUqs5EazR1MiUVxJCtQNhAJiabKdwDp9uwerUa+N5wn4VQ7I4e9Um0EUf9nLiY0RbD15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gWzR/IKeJIEeqZ3Yxc4xmIEDHyeoCQY5xg7JAqb7Pw=;
 b=nhPfexJPspE/OTtgJPUQEJDVDMWYQIlbuQgRYzHvASdw8xf/N9RNOXKof8l7iya8VlkvYzZ7HGzxbKVQ1inOvgrOXxKO2z6i+OZ9FZia7znIHp+KSScyGoNfF80QcMc0ufts/9VzFiAusQV8fR/BUB1Fyrs6rHEuCoWZHodViQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Apr 2022 11:43:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] codeql: add support for analyzing C, Python and Go
Message-ID: <Ymphy9ZGelmpOEJc@Air-de-Roger>
References: <20220323101856.35992-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220323101856.35992-1-roger.pau@citrix.com>
X-ClientProxiedBy: MR2P264CA0096.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4412742f-4c7e-4959-7060-08da28fb9645
X-MS-TrafficTypeDiagnostic: SA1PR03MB6434:EE_
X-Microsoft-Antispam-PRVS:
	<SA1PR03MB6434759CEA718DB2015259A18FFD9@SA1PR03MB6434.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ch3fmu1UozIhrwF2q79y8C/wJpPLgYG6JG7gF0oLn3SAp9F+4eN9qOnCdlMN7H4osE34tUwAhiu4B4UI5Y3MflUf2uHt9L89zfyf1y+o6PS48nUEC+FjyxWZgk/aKZmha6ivdvkopkdicYwyH1yyqfXzLXUfDsR1BhZeudoZSpzUV50IMtkAJan3EhucFjDqSkTbtFhr5jp8zv+cy2V0CM9QLwA0j/VcgJEbsjUaB8A2fXSAMzJKEbqRxGhS6ieEPXsWGjos07r8TKp/OZnMXEuznX1hdSgJLXbNxc/QlXxBLlcCfML3hY0dXaIYEEGsBqb4E8ZOSh6ZhbnoRV4H5J7OIO2P8FS0PpPtswdgnrKfm6Ez1Qpu90rU1VFQyBCO/23+gwd1ryAh+eoxhPcXaGyhsBfk375e0QYrXEk/ynpQpfmUoK89eh87Ck/aN1Y/aUUEx/OHBLfMC+qRfgz0Ly+c/vX3ts8eq7S09FS0VcLc1gEjaBPNqDPRO+3M/DL6DxXQEDlgKuQLtSeciGEA6jt25zhiLwIR0q2QyrAxErzrQu/BFM5DZ0Cqdkd03gDcNtQ3PGCfsSPpK3xhD6uDw4buj0Fplue5h21uD3m3zgzf9LPmmHsGpIxSfqUgW/dOusj1hGRzrO/YyUt+2fChdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(6916009)(83380400001)(86362001)(6506007)(508600001)(85182001)(6486002)(186003)(316002)(2906002)(66946007)(8676002)(4326008)(82960400001)(6666004)(38100700002)(33716001)(66476007)(66556008)(9686003)(26005)(6512007)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0tjdEVRVjRkNjN5MUZCTEdXTnQ0VzlQbGZqYUFYWkpWRVMzR2JyVUY5bEYw?=
 =?utf-8?B?R3p6YWM5cDlSZWtuWC82ZVJuem5qVTBkTXg5dDNYZTVPY1diRktQb2JrUlhQ?=
 =?utf-8?B?SVUzS0Ixc2NKZVpvcWxJYTYwMzM4MkZ1V0R4UmVnRTdLRm45YXBaWVRPMU9O?=
 =?utf-8?B?WXN0akp2c0o0dmJYK2hGdDkzRVA2bE9TQWZRWTlmRjVqdmZLZTRBV0JEMVdH?=
 =?utf-8?B?Z1BHaE9TdWkwaEVjV1pRRlh6YzRzSTdoUVQ5dGxIcndvMU94Q0dKM0o2cXly?=
 =?utf-8?B?NGszeXYrYm9Seld4aVh6MGY0c1RRWVJBd2J0c2hWT1EzN1RBbzhSRCtGajF1?=
 =?utf-8?B?Mlh4Wk9tb0lmNVR5S09zNlJ0L3NXY3llQ3FDVTRwUkVGT1VoQVByODZuMkNE?=
 =?utf-8?B?TUtESUthckdNYktMWWtGTU1FSlFpUHBoTlB0UDdXS2U5aUZST2tXd0paUmZV?=
 =?utf-8?B?clFwbkpBSXpuemNHRWx4ZCttejVQUUcxZTlFZGg4U2p5empqRjF1Y2dKaVZP?=
 =?utf-8?B?Q011WHdaQUczWmh2ZldBUm8vQ053aEc4bTJRdWUzRXJjVkVvUVp3OEUvYXQw?=
 =?utf-8?B?MTkrNlZQUHpTVCszVWpDZjNHWFlCRmdWSUtFY3FzVnJKOXVNaEd2L2NCRml0?=
 =?utf-8?B?NWZESnR4Tm5sUGdabC9ubWROeUxONi8yNXdNN0NROFprU1NuK09UVTQ4RjNU?=
 =?utf-8?B?V1VocGdCZ0dPWDlQQ2hBV1plbU1qeTJ0RFlZbkIwS0x1NnhpbVdEMGF1YUdV?=
 =?utf-8?B?S05aVWM3eUUyVVRKWEdEWlFETHVRSk0wNnR2cWdvKzdHQ3dJdGFpQVpXanJh?=
 =?utf-8?B?ak0zczFFbHhlTFB4T2tvSUE2UGZmZkdZb1gvZDJmbC9qS2h1RVZ0ckxXNUdE?=
 =?utf-8?B?OUxtdmh5VkJCMFJ5QkNscVprQ09vaGEvb3hmL1kzQlVaUjI1WktkWU5jRUZv?=
 =?utf-8?B?WlFCazlxZU85WWMyOG5uaWsrRU1scTBIOVZQVUJOa0Y3UjRQVTFnSkxwbDEv?=
 =?utf-8?B?SFJid2ZTN01VVTBGVFcvcmkzMW1BbHpyL1JQY2NOaGN6WUx3RDlPcHdieWdS?=
 =?utf-8?B?SHlxeGJSOSsydlFqby9QTmNuWEdvQ08vWERUb0V0Q1pHd1BjSkJxVXBFREUz?=
 =?utf-8?B?YWFzdzdwWmk5eGhUUEtKYlFwMUFWNkJHeDh5TU54aWNXcTFSd01nNGdnVEdq?=
 =?utf-8?B?YXZqeEpHOXp1b21sUlZYc0ZSamxFMFB2dWVDbjZmalhGQjV5UkJxSHBpUHFY?=
 =?utf-8?B?aUhWelpMa09HVmRkMjR4S2x5eHpMSTR6bnZIKzNOK2xDTW5IcnljU3V5ak9L?=
 =?utf-8?B?dkVzZG13b25LVmhyNmtmQ1dyOFJsWlFiT01Bb0FsZ2R0dGpRN0I2RWxTVkR5?=
 =?utf-8?B?WXlzbnUwNTBpVjdqNWpDVUppL3VwTDZTZjc0SkZmaFkvQlpIVlRxZm9pcVY5?=
 =?utf-8?B?cDNaQ0M2dE90MjhMYXVQSkZOSVhEMkJpbGRQM3VyaE1ZSG9aQlk2R1RFOXgw?=
 =?utf-8?B?MTNTb2wvTmVYaUVCeCtRQUxZQ01QS1hXazJMRktmZ0pJSHJ1R0hvZE5PaVQy?=
 =?utf-8?B?ejF2cFJ4MkkyRG5saUsxdmVlSlE0Nkp2ZDhILytpbFJsMzVpRk1OMEZGWjRY?=
 =?utf-8?B?NTlGbW1pL2UvNXFpSEFFMmsrdlBqVGhGTHdlVk5DT0VyQmU2VFVML2lEZzRw?=
 =?utf-8?B?dHJxZGJpZ2ltNVpMRUtYOFU2Y0tJZTR0RjV1TllmRkRhZ0s0M21aVHhYMHBN?=
 =?utf-8?B?LyttQUh5MU43a01GNlFSN21EY0ZSSDk4Qy9IN0hDZnZ0REdhekdPdUJUWU5v?=
 =?utf-8?B?M3RCSDhDTTJXT0NBU3NkNXhCUkw1OWpuNk1JTmlTUm01V2RYMXA1WENWM09G?=
 =?utf-8?B?dkxicHplSzZxRmJlOTVtOVVJOFczQVhJUkk4cWswRk1YdmFtdHRHSUR6SVJR?=
 =?utf-8?B?Rld0MVBCMTBXeVZQalI4YnMxdVNtVzU4dWkyQU0vSDZTeWlMaTJWUkpBclNB?=
 =?utf-8?B?WllXODQ4MjQ4ZEFCNjc0aHMxaW03aExjL0NZR1ppZ096TCtKTVZPeisrM0cw?=
 =?utf-8?B?cDBoR0NHcktlWTdSUjhZT2ZtN21RZGUweTRUbm5qRFprZEsyOVJOVXpVSEx3?=
 =?utf-8?B?YnhDR21USU9MT1dyOVhEdzVNL1BheWwzL01DeUJxaTNQamlUZTBOZXRzQjdZ?=
 =?utf-8?B?cnQxajRlYnUvaDZvdGRpTlR1aVhHc09abXQxZFYxVGFlOTZZT2F6S25sNTQx?=
 =?utf-8?B?bVl4NElraW9HNUtSeG5hQ0ZhaXN2NzRvbXoyd1BjT01FdG4vMlFFOE1aZ3lz?=
 =?utf-8?B?enI2cDdJTThOL3RMZWsyQ1B3LzdWRmFwZGtrMk9ncmdiVTJBTXFmcWZzWTIw?=
 =?utf-8?Q?AKHIm4A1H9+eZm9k=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4412742f-4c7e-4959-7060-08da28fb9645
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 09:43:45.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSkihxWsyUuhstmE+HrbBdC5MFN16v3V0m3qyiDDQXmEhDZk7pvY7NdLx2xg6r7SBunIA7oDZ04HrS9ipgJ1tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6434

Ping?

On Wed, Mar 23, 2022 at 11:18:56AM +0100, Roger Pau Monne wrote:
> Introduce CodeQL support for Xen and analyze the C, Python and Go
> files.
> 
> Note than when analyzing Python or Go we avoid building the hypervisor
> and only build the tools.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Remove explicit 'staging' branch checkout.
>  - Remove explicit query.
>  - Remove ignored paths.
>  - Remove 'on schedule' trigger, or else it would be run against the
>    master branch instead of staging.
> 
> Changes since v1:
>  - Rename to note it's x86 specific right now.
>  - Merge the ignored path patch.
> ---
>  .github/workflows/codeql-x86.yml | 54 ++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 .github/workflows/codeql-x86.yml
> 
> diff --git a/.github/workflows/codeql-x86.yml b/.github/workflows/codeql-x86.yml
> new file mode 100644
> index 0000000000..6ddd445c79
> --- /dev/null
> +++ b/.github/workflows/codeql-x86.yml
> @@ -0,0 +1,54 @@
> +name: CodeQL x86
> +
> +on:
> +  workflow_dispatch:
> +  push:
> +    branches: [staging]
> +
> +jobs:
> +  analyse:
> +
> +    strategy:
> +      matrix:
> +        language: [ 'cpp', 'python', 'go' ]
> +
> +    runs-on: ubuntu-latest
> +
> +    steps:
> +    - name: Install build dependencies
> +      run: |
> +        sudo apt-get install -y wget git \
> +          libbz2-dev build-essential \
> +          zlib1g-dev libncurses5-dev iasl \
> +          libbz2-dev e2fslibs-dev uuid-dev libyajl-dev \
> +          autoconf libtool liblzma-dev \
> +          python3-dev golang python-dev libsystemd-dev
> +
> +    - uses: actions/checkout@v2
> +
> +    - name: Configure Xen
> +      run: |
> +        ./configure --with-system-qemu=/bin/true \
> +                    --with-system-seabios=/bin/true \
> +                    --with-system-ovmf=/bin/true
> +
> +    - name: Pre build stuff
> +      run: |
> +        make -j`nproc` mini-os-dir
> +
> +    - uses: github/codeql-action/init@v1
> +      with:
> +        languages: ${{matrix.language}}
> +
> +    - if: matrix.language == 'cpp'
> +      name: Full Build
> +      run: |
> +        make -j`nproc` build-xen build-tools
> +        make -j`nproc` -C extras/mini-os/
> +
> +    - if: matrix.language == 'python' || matrix.language == 'go'
> +      name: Tools Build
> +      run: |
> +        make -j`nproc` build-tools
> +
> +    - uses: github/codeql-action/analyze@v1
> -- 
> 2.35.1
> 

