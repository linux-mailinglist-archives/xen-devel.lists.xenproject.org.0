Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B49F4D5D77
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 09:33:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288862.489963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaiG-0004Ph-Va; Fri, 11 Mar 2022 08:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288862.489963; Fri, 11 Mar 2022 08:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaiG-0004Mh-SY; Fri, 11 Mar 2022 08:33:28 +0000
Received: by outflank-mailman (input) for mailman id 288862;
 Fri, 11 Mar 2022 08:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSaiF-0004Mb-68
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 08:33:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea034037-a115-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 09:33:25 +0100 (CET)
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
X-Inumbo-ID: ea034037-a115-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646987605;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tbG+5+VkxfK6tcUAsA2wH2gjzXbTR1WZcHafd0LDTg8=;
  b=NxyeemRWWnL0tl/FwDzz6qaIPHLUMpJ9wlPc3iwhrKkNaz/I1ln8EDYI
   xfIeq7tMzkIW6a4e0LkCJPjR+QW6cPYJNNwhnqVPAxGpWoukpi9CbqBOk
   0AwrPdN3zjL96YK/gu/WgHP9x6btUUP740hRhLci961HPAceVcm0ftWuy
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68350050
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d9lZYa/O7nxz51KXQ12JDrUDq36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2YZUTyOOPyJYmCneYh1OYy3oRsDvJbcz9BlGgdk+Hg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oHgW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ+fYxgLNermocIEVjxUVCtVM6l/8rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4eRquGP
 5dBAdZpRB3MM0dJKHsnNKs3tv+wunfgKQ8AjV3A8MLb5ECMlVcsgdABKuH9dtuHT8hRtk+dr
 3DB+SL1D3kyNsGbyDeD2mKhgKnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ8+S0ot6E+slOqStrVWAexq3qJ+BUbXrJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeRhMAy
 X2C2PnQIyVqlbHSQ1mT8o6eombnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2/0/vD0ohgJChI7t45Pxidwf8abaoOh8jA3Bt4Qfd/CHjFtU
 JXp8vVyDdzi77nRxURho81XRdlFAspp1hWF0DaD+LF7q1yQF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPd7vWp91kvi4TY27PhwxUjaoSsEgHONg1HszDXN8Iki3yBR8+U3BE
 cvznTmQ4YYyVv08kWveqxY12r433CEurV4/trigpylLJYG2PSbPIZ9caQPmRrlgsMus/VWEm
 /4CZpDi40gOD4XDjtz/rNd7waYidiNgW/gbaqV/K4a+H+aRMDp4WqGLnu95JdANcmY8vr6gw
 0xRk3RwkTLXrXbGNR+LejZkbrbuVox4tnU1IWonOlPA5pTpSdrHAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:iYVlrKgM1DBms2XGQwqGYCuornBQXkQji2hC6mlwRA09TyXBrb
 HXoBwavSWUtN9jYgBapTnmAtj/fZq8z+8L3WB/B8bFYOCLggSVxeJZnPrfKl/balTDH4dmvM
 8KGcUTNDSaNzhHZLPBkWuF+qEbsbq6Gc6T69v2/jNGRQRua6Zv0gt9Bh+bFEp7YxVDDpYjfa
 Dsg/Zvln6OcWUxcsCxCmIiUNHKqdHQ/aiWBiLuTCRXkjVmxQnYlYLSIlym2BcVXxdC260r/2
 Tpjxfw+6WktJiAu3vhPkHonuhrpOc=
X-IronPort-AV: E=Sophos;i="5.90,173,1643691600"; 
   d="scan'208";a="68350050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O12V8bs2RLrOKv/F0eUMltk5acC/0/jsqJU5ObKZqpCOoELpxmF4UsLyxeq3vt5+Q4LDvFuZMh/arM93XiO3l0V8zKZy5cN+h03iiZflL7lH0Ve0fw1Y8V3vivCN84f2by42O2/gRY5S4M06CW0AerXlw5ubddtJ+zJE045QcaPuPXPkrvYNpxCkB6RubeJ7sWzC8sMy/VGSfeOEjVy5B/WBfnjDo2MrAERjqVwFCdnXh/vLvUs4bFh4MgaHU1JqH5GjBvxSVVNtdq2TXvleaY+nLUrXaZWbQAq6wc9erZ/milE/MIAWSdhXMgY07q9aV9jSBtPxjNF8RtSMS+0Rlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFdPvFcnYw6R7oQmRklyRYsTI4psmQhNZc4Km6yVZKE=;
 b=XomWG/kmYxrcX2P42ThQeZgmCsAHpBG+HPWyYrAhWnrOcW9X2LBE8ZbS9Wu734WO4sT9I5QDJwPx/zjIN9gbzEHSmGMLNuMvr4SBd6kX0oaVrlRxnzopjYux9jq7cLn7WPJrp/qbnFPu+dFza1YJAgAFl+3slmyPfrsjYF4uq/yVOPkrqWnXzgbEu3bvgzQW8ynKTrP+cL9kIW+a2GPpQv6tmzJtMUNENA9pwHBC+NJ2yJ4pWrIktqzj/4gqAb9s/dVA8lODL1wL45SBeBRM7JCrW4KofgLoYzD7ouZqXNvGEKtOn3DVBqEPSZSWZ32AKBlkz3ibpozU4kBSSJ9kDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFdPvFcnYw6R7oQmRklyRYsTI4psmQhNZc4Km6yVZKE=;
 b=XxBLpFYZI5wkKaYYNMT9Z/iJNaonjjShDf+a/xfIzM3hfjktLNnndlbR9bWcXFc2k9Q1rBmDU6DBMIDS5upsDU/B+w3efHqWhCza69o99VjJJgPXYlvaZ19ce7gEqIMWo7hcaomsqkLsz9BvEQS8iTb0nzTCPCZwww/7c3EsvtU=
Date: Fri, 11 Mar 2022 09:33:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, "konrad.wilk@oracle.com"
	<konrad.wilk@oracle.com>, "doebel@amazon.de" <doebel@amazon.de>,
	"julien@xen.org" <julien@xen.org>
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build
 systems
Message-ID: <YisJS9ITWTpM7bYj@Air-de-Roger>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
 <32b098c1-963f-2e03-84bb-c8db410c8554@citrix.com>
 <Yidtuq8YUq+SbY7C@Air-de-Roger>
 <3e285745-9cc3-4f9a-ec27-fe917faa4547@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e285745-9cc3-4f9a-ec27-fe917faa4547@citrix.com>
X-ClientProxiedBy: MR2P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::15) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f554c10-e4b1-4f7c-6d3d-08da0339cc36
X-MS-TrafficTypeDiagnostic: CH0PR03MB6082:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB608209C546D0B0940DAFE6828F0C9@CH0PR03MB6082.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5RQBUGvwz+SWg1QLh+enRGdObN+C/YFMOicE1vHXtFgOuFE7l+GCSSspQEDleF31cMjkwMn1dImeUXqFsOA2Q1msEuI5c3aW4PtAWQjwBrhzZ1QeJaD29mYcq63pgkZsPBskCDftrYKQn6cKDzZFZV9yzlFUHb5QhLqiHGZ2vxnQaPrZiSHzd6LY9aVb7f/4frTHCpd1R//XHSFFjmAUbxgcUyRSQqCcH2SbbGvQXkLFbER3hwKAOLK5ujTUSavpZW4prf/wKrhMy+jpedhwVh0j3XatJ0skM0fRlXkznw72zCHjSifFIw2D+O/B6pRaRd0FlSr3dh5BSC+7UXNAVxYdKjIpmOXKKbLwEzWMJOrvILDUJFrG4yj1SkU6PVz00DsGMz+Z52rfLrZTbV/6K9JBCI1CnN8Y41P3aqi+0BSYCojMHfJlTptRbqiVreNaPDLqIvLwjnyatC/bGhIdfwozA5ntduuBwel6ski1wdDFU2VXmabT2vKPczR8/JL7wxyKjdvfrGsuUbNv7x9aRFuC17tXKG97kPys4r7DBMrG6ReGgcepoIgB9TdGgurNawwFhmAB8E5o7BEaMZFNQ4xEMdf/IOkiYQd3zySlNouJAmD//X1voRZEy3Ci0+6DjwMHLANSeB3E+uMeL8yCEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(53546011)(38100700002)(82960400001)(83380400001)(6506007)(9686003)(6512007)(8936002)(5660300002)(33716001)(2906002)(85182001)(66946007)(6666004)(66476007)(66556008)(6486002)(508600001)(186003)(26005)(54906003)(8676002)(6862004)(4326008)(86362001)(316002)(6636002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmlrNzcza0RxYzFHWktMM01xajg5VDlUcXFpNmJ2MUNhNzh5bitNMkNVZGdW?=
 =?utf-8?B?ZXlsbmdKU1QxSStWRUt0T0ljZEgyV1FSVmxLZWRVbEZYVTNuakFYVFdzYzJi?=
 =?utf-8?B?SXNXT2hBUVFkd2Uyd1RzSGJXUG1jNTFSdmVCZkdxci9PRHNmbGduaElBNVNw?=
 =?utf-8?B?d0hFbEJ0aGtOYjNCRnQ4WTBUbTBuNTB6U0hjQVE0K3VucktlV01Rc2RUUHdW?=
 =?utf-8?B?VUVteHJTenZXK2JlK3ZHV2NuWDYyRGdOaXJSWHg3MW5xTGVmd2JBOGJ1R3lS?=
 =?utf-8?B?ckdjd1FPbHJiazZ4bWUxRkFqSjE0dzRKUjhod2cwdHkvemJ0UlR3Q28zRTFS?=
 =?utf-8?B?b1VYNFpKRFI4K1lVVTB2NndhNW1sUXRGMmcreDY1YmFpc285MGtTWi9aY2RR?=
 =?utf-8?B?WlVUUkVaZXlZeW1vUDhidURLYmFCcFJhNlVycXNnUXdmeUVZQkRnSFpYRGNU?=
 =?utf-8?B?aWt6dk1tV1FyMHBYSEd2THZRY0JwQnorQVZNUDBudk1OR1Y5dWpJU2I1M0p5?=
 =?utf-8?B?OXRoU3NCdEZoWFdPRGtDOTZERjVVRnB6L0RTWTBGS2xwdlM3ajFibWV1YkZx?=
 =?utf-8?B?dXlIUmZNUGYwUGlER0E1TXJaWmJiajl5Yzc4MkxWblhYVUFpVyszSHAzODhs?=
 =?utf-8?B?bFpCajJMVmllMjNhSExNQi9ZYjhzcDNJeWRXV3Rta1FKcVZnNmVEdHJmS3pi?=
 =?utf-8?B?Rlk2dFAwck15VWFEV0JzK2x4VWdZdS9PK3RjWFZ4NmlxeUtja29XcXhPU2M5?=
 =?utf-8?B?OWJBeW1FbSswbGJhQkhRbjFTSWpOQW9XazYzU0ZHOTRQb1RkWnlTQnRnYjE5?=
 =?utf-8?B?TDRvVUQrbEszR3JaMmtPZTljVnNXQ1kzS3FKd1cxdTB5VTRnL1N0aW55aC84?=
 =?utf-8?B?ZVYxVnBIVDlKMkhHVTQ1YVRrVHhmcDQ0eXBCa0ZKSUlXRzdZNWlVb0JLbkVw?=
 =?utf-8?B?cmRVTkFTajZBRStObjNKSktiWVF5Tzh4eHF4d0xPU3Bvd2ZMSkp4cTU4SEtt?=
 =?utf-8?B?WE1HRmVlU29Gd0dPOVJPTUNuajBQTW40THJRL3o0eDFBYVJPQWxLV1lQcFNV?=
 =?utf-8?B?L0FwQ0hNcjFOaFpJdHBBSmpDYTVNUlRibXp4bkJ2WmpFeG00QW4yWlg0Smhj?=
 =?utf-8?B?TXlQMEMxUFlsUGlRR2pkUmlDRkpXdUJHOTQ0MmxmNDlDK3JMOTI1cVVFOFVI?=
 =?utf-8?B?aDRsME5yNE9yVHBJdHJEMjVnVGpLa3Z2amg2VEREbGowYmY4emxTV1pWcEda?=
 =?utf-8?B?QVF0cFBtZFAvdXZ6WmxSTDRzZnVXTWpoek5YSWptTVZzZzh2bklWWWNjMTVM?=
 =?utf-8?B?VjZBMFhxTTdPZndWaDZPY2w4eVBLR2lUSlBQallsVkRzYWZtbjRkN2RNb0lB?=
 =?utf-8?B?MUtEK3BtWkU4dndaSlI1Y3VWbXN2VzA0Z3QxNlE5QjM3N0FhcUVtNTFSVTM3?=
 =?utf-8?B?REpJbDZ2WUh4TDNXVnRqRWN5OU41cmN3ejQ0MWlWc0dmRVRMN05jZlZyQzdu?=
 =?utf-8?B?YUhEaU4xTnZLS2ZrTFRDYk5oUWlTaXB2T1RVVzRObWlGcGRSL0xLYVpNMVF1?=
 =?utf-8?B?amJGaUtyN2hIK2RSTzc2Z2pjNHpSY2J2WDRqU3V4dTRyclJ4c1drMDdqSFlS?=
 =?utf-8?B?ZFhNNlhRM2wxbXJIbWN6aXE2UEs5MFM4OWdycmhPZ2JKb2tTWmtQTTRGVjVU?=
 =?utf-8?B?OUwwMW04Ry9sOXZRNEphVllhSHpSNTdLQmltTTRBbG5weFZRSzNjNzFTN09E?=
 =?utf-8?B?NWhjU0VOTitRMkNTeCtsTFhaNDJSVGRNbW90UDJIeXlRT2prUGdDb1Q5NHQ1?=
 =?utf-8?B?bkppeDFmOWV6UVVCamtEaDJ6bi84UEovOHZMYzhmbzZQay9CeStrNzJUUWRr?=
 =?utf-8?B?RnZpMG03Zitrbi9TazN2RVRBUkR1UW1QaGMyQmZHdkxBSTI5TTBjZmNPUXYy?=
 =?utf-8?B?bi84RFlQSzdHVzVQYzRGT1RGR2xJTEpoN05WMTdyem54YnVjbEV2QTA1NFNY?=
 =?utf-8?B?UTc4NzhJQVRBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f554c10-e4b1-4f7c-6d3d-08da0339cc36
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 08:33:20.2984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvQ6398EEoE4L4UbRnU9eu5/4LI/IEKzjGJhR0G57lufqoFY3WMYCi+e7B1vSnjRjrAiW9phCTM2p9KimyEL1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6082
X-OriginatorOrg: citrix.com

On Thu, Mar 10, 2022 at 06:01:48PM +0000, Andrew Cooper wrote:
> On 08/03/2022 14:52, Roger Pau Monne wrote:
> > On Tue, Mar 08, 2022 at 02:38:47PM +0000, Andrew Cooper wrote:
> >> On 02/03/2022 14:27, Roger Pau Monne wrote:
> >>> diff --git a/livepatch-build b/livepatch-build
> >>> index 38a92be..656cdac 100755
> >>> --- a/livepatch-build
> >>> +++ b/livepatch-build
> >>> @@ -98,14 +98,20 @@ function build_special()
> >>>  
> >>>      # Build with special GCC flags
> >>>      cd "${SRCDIR}/xen" || die
> >>> -    sed -i 's/CFLAGS += -nostdinc/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/' Rules.mk
> >>> -    cp -p arch/x86/Makefile arch/x86/Makefile.bak
> >>> -    sed -i 's/--section-alignment=0x200000/--section-alignment=0x1000/' arch/x86/Makefile
> >>> -    # Restore timestamps to prevent spurious rebuilding
> >>> -    touch --reference=arch/x86/Makefile.bak arch/x86/Makefile
> >>> -    make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> >>> -    sed -i 's/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/CFLAGS += -nostdinc/' Rules.mk
> >>> -    mv -f arch/x86/Makefile.bak arch/x86/Makefile
> >>> +    if grep -q 'nostdinc' Rules.mk; then
> >>> +         # Support for old build system, attempt to set -f{function,data}-sections and rebuild
> >>> +        sed -i 's/CFLAGS += -nostdinc/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/' Rules.mk
> >>> +        cp -p arch/x86/Makefile arch/x86/Makefile.bak
> >>> +        sed -i 's/--section-alignment=0x200000/--section-alignment=0x1000/' arch/x86/Makefile
> >>> +        # Restore timestamps to prevent spurious rebuilding
> >>> +        touch --reference=arch/x86/Makefile.bak arch/x86/Makefile
> >>> +        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> >>> +        sed -i 's/CFLAGS += -nostdinc -ffunction-sections -fdata-sections/CFLAGS += -nostdinc/' Rules.mk
> >>> +        mv -f arch/x86/Makefile.bak arch/x86/Makefile
> >>> +    else
> >>> +        # -f{function,data}-sections set by CONFIG_LIVEPATCH
> >>> +        make "-j$CPUS" $XEN_DEBUG &> "${OUTPUT}/build_${name}_compile.log" || die
> >>> +    fi
> >> This really ought to be the other way around, by spotting the thing we
> >> know is good, and then falling back to the heuristics.  In light of the
> >> updates to the Xen side, something like:
> > I'm not sure I agree. I do prefer to spot the 'bad' one, and just
> > fallback to expecting Xen to correctly set -f{function,data}-sections
> > otherwise.
> >
> >> if grep -q CC_SPLIT_SECTIONS Kconfig; then
> > Because this logic ties us to not moving CC_SPLIT_SECTIONS from being
> > defined in xen/Kconfig (or even changing it's name), and gain ties the
> > livepatch tools to internal details about the Xen build system.
> 
> It doesn't particularly matter which way around the if/else is.  It does
> matter that we're choosing based on something relevant.
> 
> nostdinc in Rules.mk has exactly the same amount of "magic string in
> magic file" as CC_SPLIT_SECTIONS in Kconfig, but has absolutely nothing
> to do with the property we actually care about.
> 
> Really what you actually want is
> 
> if grep -q CC_SPLIT_SECTIONS Kconfig; then
>     # Xen behaves sensibly
> elif grep -q 'nostdinc' Rules.mk; then
>     # Legacy mess with Rules.mk
> else
>     die "Help with build system divination"
> fi
> 
> The "behaves sensibly" case is unlikely to change name and unlikely to
> move locations, but each are easy to cope with via `grep -e FOO -e BAR
> file1 file2`, and this approach avoids the problem of blindly (and
> falsely) assuming that anything which is 4.14 and later splits sections
> correctly, and that this will remain true even when someone adds "# use
> to have -nostdinc here" to Rules.mk.

TBH, I don't find the proposed solution is much better to what's in
this patch, and as said I really dislike tying the behavior of the
livepatch build tools to heuristics against Xen internal build files -
be it a Kconfig or a Makefile. Specially because your proposed
approach adds heuristics to detect the 'good' case which should be the
default one going forward.

A better option might be to just make the 'build adjustments' a
command line option that the user can pass to the tools, ie:
--build-adjust and let the user decide whether it needs the
adjustments or not. If I was a livepatch user myself I would seriously
consider picking the linker script changes and backport that to my
production version.

Thanks, Roger.

