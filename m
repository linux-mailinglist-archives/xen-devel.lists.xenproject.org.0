Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A1C7376AB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 23:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552389.862451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBixW-0000zn-7s; Tue, 20 Jun 2023 21:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552389.862451; Tue, 20 Jun 2023 21:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBixW-0000wS-4h; Tue, 20 Jun 2023 21:32:18 +0000
Received: by outflank-mailman (input) for mailman id 552389;
 Tue, 20 Jun 2023 21:32:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnc8=CI=citrix.com=prvs=5286b1552=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBixV-0000wK-7D
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 21:32:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec2d0586-0fb1-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 23:32:15 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2023 17:32:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH8PR03MB7269.namprd03.prod.outlook.com (2603:10b6:510:252::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 20 Jun
 2023 21:32:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 21:32:07 +0000
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
X-Inumbo-ID: ec2d0586-0fb1-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687296735;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rO3UCCmaGidt9E1Ab3n8Vy3rMFV8ej6+lMRZXe7GUmQ=;
  b=BVj+OGG0wwk1xEh6lBLrbt9JFwx+tc7jyBbshdunsy/nFrkMbj9LZPK/
   veK5rTedKg7gtichu1chyPFIvu2KeZjGdO4u5ueiPxnocX6tYFYQQFP7T
   eFEH8ZwZ56R2HcFdhCeyMWkhrTd2QeMvAWy/Zd7Ny39DJdpnsjsnI9dyb
   8=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 113554270
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gXi8e6jQjX525c9vU9FJp9l3X1619xEKZh0ujC45NGQN5FlHY01je
 htvWGqOPa6PNmqjLop+bNuzp0oHvJaGy4BkTwppqSlgF3sb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gWGzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQUEhZVMx6R2dmGmvWVQNls2ZR7FpfkadZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGyabI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTjq6M22gLLroAVID0LXlbkmf6ns3aRAvJ7d
 2NOxyQE9LdnoSRHSfG4BXVUukWsogYRUsBLFOsS8giV1q3O7gCWB24JQyRAbtNgv8gzLRQx3
 1mAhM/gHj1omKecUW6a7LqSojK0NCUPLGkNIyQDSGMt89Tl5Y0+kB/LZtJiC7KuyM34Hynqx
 DKHpzR4gK8c5eYJ3aim+VHMgxq3u4PECAUy423/XH+h7w5/TJ6oYcqv81ezxe1bMI+TQ12Fv
 X4Fs8uT9uYDCdeKjiPlaPoJNKGk4bCCKjK0vLJ0N5wo9jDo8Hn6e4lVuWh6PB0wbZ9CfiL1a
 kjOvw8X/IVUIHahca5wZcS2Ftguyq/jU9/iU5g4c+ZzX3S4TyfflAkGWKJa9zmFfJQE+U3nB
 aqmTA==
IronPort-HdrOrdr: A9a23:acK78a4MkYa+j+wB5QPXwHvXdLJyesId70hD6qm+c20jTiX+rb
 HjoB177264tN5yMEtQ6OxoXZPwMU80mqQFk7X5A43SITUO1FHYWb2KqLGSigEJNUXFh5VgPI
 1bAs5D4OSZNykDsS4RiDPIaerIueP3iZxA5t2uhUuFLzsaHZ2ItD0Jdjpze3ceLGIqafVWdf
 rshbsk1l/QHUj/LP7LTkXtcNKz2OEj/6iWKiLuciRXqTVm+gnYpoISfSLoqiv3klt0sNAf2F
 mAswvk4q6k99GXoyWsqVM7l64m1+fJ+59kGNGCj8ATKHHJggasYIxnMofpgNnrmpDd1GoX
X-Talos-CUID: 9a23:UgAdpG8cOE2g5ELHCGWVv0IuPJh4fG+D90eKZGGyOWY2GOWvF1DFrQ==
X-Talos-MUID: 9a23:BTeNuwQZVbCJwsXhRXTMmTpva/9v/Z2WJxkttckp4fSKH3VvbmI=
X-IronPort-AV: E=Sophos;i="6.00,258,1681185600"; 
   d="scan'208";a="113554270"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8HUDXyLxI+C/O6A2AooW9kdzn5lf7ekFMrZOnBdhulkxgBbKVmkKKHBeGrSR1KDtTne+Nqw5T8HCpBknXotec0w0MrOHH11GxM7HOw/TJTEDj4KJDIGcwTzSdZZpMfUQbiqaoHRl+y+j4G6mEfQqyCm6Kg2RF2Zdwyt40bJ74xLtmBQfshCWmjUUxTObDK4rodPjshAI6bLFuY2x6JiBszQ0m8ooGfKogvXTWENXcPYFDk5EZO26RBSuF502h/uanwWgQxQd0prySBZf0aCVkx0p/3/PJgOspEEeFrlFKth24vMUAAQBRaC3v4UmT79o2w1LwN4ieEwZ8b5fz0s7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPXW5OU7etxJMwU0slMW1UP1X34n9rktThlZtghZnpw=;
 b=bb/5b9i8BlVaNBimSBGWo0kZFw4uMbYG/WRpjBgeBCK4CHdbkxYe8evBvW83Crst0qVCsz1tQBoWrqulX/5qtzYDrXHdIBTs4fK0bJ3qpuXrfa+Uy68so0+rXdxbf9JsqumUxpXBlWlVmroSqSzPsohGzXc1CTNC6n8OHw17+tFbB5ewEwTCfIyZArnSAGnFXqn1d4ag6H5ndUEBdHq8OY9U0tq8EEcXEe4ALTM0jQBNNBAzuJ4Zm3Wh2sinYRIkhTFnLZzXvTLphB6KMlitUYUOOPHspGPpuHFkxWG9xHpBc0bw7lvgYLbLYurjuqTeGTOL24R6l6J85ndlvhHVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPXW5OU7etxJMwU0slMW1UP1X34n9rktThlZtghZnpw=;
 b=CL8n6DUCRKqtZSXL1j5ZP6xLYO0zxiauWucVo+7PRGlbWTIOmgbbx50afZ3kCMAhnWKnSybzJwmTZmv4coLn2dmTKyd1w7XepeGyaubZAdG4AIf5B2WDaoNS7Qt6Z4cPnRIWk4qGqgI7Foo7yGL+cqPPq5TjskmKuVEtmsu2vm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7d0d6045-eda8-91eb-b58b-015ebe64c7b5@citrix.com>
Date: Tue, 20 Jun 2023 22:31:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 1/3] xen: Add files needed for minimal ppc64le build
Content-Language: en-GB
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1687283294.git.sanastasio@raptorengineering.com>
 <a2acef7759c79df311b06428f0ab4b6a940fc0d4.1687283294.git.sanastasio@raptorengineering.com>
 <8505b097-3191-ec7f-57f9-59cd49367981@citrix.com>
 <321410422.7928643.1687296448794.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <321410422.7928643.1687296448794.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH8PR03MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 1327ed09-7bed-47c1-08d2-08db71d5cc0a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f82Zc8xSIp8arJcbCFHaiGvowuPObVQkSlqfanswE4IGXFAvLtahgVjlXrUVfbKnoJvi3rFk9oa6cRv4JajxWXWq7uG3TYHHE9jTjemouWUT6VewdstOLRT16hEWiiFmjKlQbQ3jCwTOVrT7W1f/zhptbkPp6npgV0L56sjZ0fsabRgTHQngvgwB7I3ZyvIw8njHzjqPKXdDqCRU589imLZ0RwLm3Z2OmA6TzSFV4QB7j96TWd8XS5eIzg6wIiq/cnTUil+LWJxB5ZoZ2CDKwzxTfUxCtORkskqUinmE19OpoEWNd+vhz/xeRH2g9daBXQxX6QXQRPOlXb/5/f8HusVvXXWmN5mnR04OwZSN8AUe/KtDVlt0b86NNdTD8UspFNuTgo2ZpZ2hD8i94j5XfX6DU6BKU3HXMBOa2G33Ptxu4TSy3XatDcusPvfSAHAgPPpJv3duwbEJAYx6rmIDXamkM0cc/VH1va13Zsx49+PRyKptht6RSBx7lDKh6XVtm9rirFYttLgOPjEq+2YLey6mXaHQMAzS3M9ZejlrAxbwsrqDgLZNqLMeRVBZfJBbRHYCksQH3Cws+n57xAdyir55ofxFWjBBzVGIrKrOvUE/wLHQgJ6hwVp4ITGLX0hKNMW+F87ao9I/KYjH/YU1gA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199021)(478600001)(5660300002)(66476007)(4326008)(6916009)(2906002)(66556008)(54906003)(31686004)(66946007)(41300700001)(316002)(53546011)(6666004)(6486002)(8676002)(8936002)(6506007)(6512007)(186003)(26005)(83380400001)(2616005)(38100700002)(82960400001)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vlk1NnNxYmNZK2JGeTFLTlZUeGRiZnV0bUNrYmJHaU1GRjAyOEcyYnMyNy9Z?=
 =?utf-8?B?SDhrZ1d0cUlJSHBic1lqVXZpVHRSSkVJa3p5WVVCQnZVdDZUcmlTbXZ6ckhJ?=
 =?utf-8?B?aEx1TkFQN2xVYjJ2N0FhWGZMRXRFRlpvTC93WTBLVC9qZ0dCZFU4UjY1Q1ov?=
 =?utf-8?B?VGRRUGtpbUxXWGxJSXBnWEVzbXNRL0NzZ1BSaGZueFI5dnU4elAvN1FlS2Rl?=
 =?utf-8?B?WGhrWU4wNUNCUkRmUlBwbzB6Qk8zUGxzYzRyMjAwQno5NzVlZkdlWEFSWWh2?=
 =?utf-8?B?R3dKMDVRWmROOFY5MHljTnJscWV2UkMybGtOMHZFNUhTeHZ3M2lueU5oYjdr?=
 =?utf-8?B?TVV3cFRuZ0RmZW5PYXl2WlRySjBEekRMN0dCdlJDRGdpbzAxMjk2NkgyWFNa?=
 =?utf-8?B?M3h0NnJNY1Uyei9yZys0L3Jhak1MeGJSaDlpVFl4RDUyemRFYVdaZ3NEYWdL?=
 =?utf-8?B?TS9SRjdEZS9qV2d2N3VvWVRMYmppYkJaaTYzSGkwSEZBVVVvVE1DMXBlbTdB?=
 =?utf-8?B?WFBkSmJJZWxhaDdQU2Q1OFRMeXRQUGtRSHJzQ29NUzVoWDd1MG4vWHN6YWpp?=
 =?utf-8?B?dmVudXEyMmpEczJyVXFrVkw5ZzAzVzhmTU1ZUkhOZWZkQkxtUktqbHhGb2Rz?=
 =?utf-8?B?QUNNRW9MV29kOWZlUlNFMW45WGhlT0dwRElYb3cyeHh2STJtOHhmdmJYclNz?=
 =?utf-8?B?TkRVL3ZXcEVDdk14VGpWL1JISkttQXpoZW9EaHJMZHBhOTg2S3dlM2JWS3lN?=
 =?utf-8?B?RFg0MmtkajVkQ2ZVcXI0RXVBN2tpOHpLb1NGUkpoblJHbW5Yd203NDBpbGNI?=
 =?utf-8?B?SVJQQkhINzNoNWlIcFdpQ2RUSWFIM2cyVkRwYWZZMVgwSXJjWGxEc0krMmk0?=
 =?utf-8?B?cjVjMHlWbDZGdjZ5UmYvY0IrUm40WE5ycWJNYnVNbExLUVJjd3pQa3FQWHFP?=
 =?utf-8?B?SnhFUEQrRm8rbzFKMGRlMjNCWDBOM2I0NTUyMldyWHNoeStwaFd3V3ZsMUpV?=
 =?utf-8?B?VzlURXBpcmlPT25UZy83T1FycnRicDg5RlFMSUJ3cjY2YUtFNXkyM1FZQ284?=
 =?utf-8?B?dnJwUVR2Yy9rV0ZFMVB3THVtNlRLOTJUcjNBN3ZTVjROZEVINXlhalJCc0Y4?=
 =?utf-8?B?TWVSUkdNYk5oS1pyUm1iQTFtWTY2SnFtU0NTendTcDB2MTdNSTNaYXJDNHJo?=
 =?utf-8?B?NkpzR2duY2ZoNUcrY3U4ZHJsMEdjd0l6U1NuYjFwZTNzWG1NSVZCZjRzZlY4?=
 =?utf-8?B?ajQvOUEyNVZmMFF3eUdMYkxmenpqVzVSQlVPS2QvY1RpNlhKd0FlZFBmNWFk?=
 =?utf-8?B?Ri8xVUk0ckJtRW5pN2UxUHNBdE53V1RVeFNYVXZLUFNEMXlpRmRlV1VBa1RO?=
 =?utf-8?B?ckNqeVNZRjdPdS95dnVYdURWbzQwRE1tK2EzcC9HSWFsMW9xL3BnVGROSDJI?=
 =?utf-8?B?RGhCWWsvMFc3VnRRTThDaXBSZ2hYN3cwUUVMWDhmUlJrZHg2UVNZcFhCVllP?=
 =?utf-8?B?SXJma2NUUDV2ai84eERtL1VzcHArc0RuOTFPbkQ4eGpuLzFxdUFodkplbEd0?=
 =?utf-8?B?QnNjY1Z5bnpwQVA1MWh3aUlzUFEwNFZQK2tRZTNzN1BkNDRBeGFCOWlCSVF4?=
 =?utf-8?B?aW95ejJkUGY5UFZ5OXJnVjJHNnNiK3h2eC90L3N4UUx3NDh2bGdmOGdrbFVs?=
 =?utf-8?B?SXlhaVk2RFo1Rmwreko0TFhnNWFsRDJHY1FWNEg4bkU2d3dzakpNa012eVlr?=
 =?utf-8?B?WStZYmlhVTErTUV5aHZLbDlSeGhNK2VheEcwL0dyYmtyQjdidnBUQXlud2pV?=
 =?utf-8?B?a1NHWlgrYS9tUDZZekkvREtMNzd6OXJESnlncWFZOWpRSlhPNG81L25wTFdH?=
 =?utf-8?B?cTREWWh3ZEtSbkVPZis0djFUVUVSa0lXTFZ0bjNxQkh0aXFrbzVhYnJWNzZz?=
 =?utf-8?B?b1Radmhib2lwTFFIMHFwSmhBQ1E1b1lLOUVORnB6ZGF2S1h0RTJISW1vOEIw?=
 =?utf-8?B?eHVzeTAzbDZoanhZTUsyZmtsckxvSUpPUFpjWHdvRXgrYklmWVZ5UGFIWTVz?=
 =?utf-8?B?R0ZTUEszRExNRDJpMGJLTlh2N3ZCOGt1YkZsUk9zd2pITVJOdzNKVUZnYzZU?=
 =?utf-8?B?czdzTkV5UktISXloOUlFakI4dWVjRnJWRVRoWnhLL1hjSmRRVXRZalpaSmVJ?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sh3RI8Y5/LrY+riqJCLy1PHIpzqzXGkQsL+gtEWBa/g6fg2AiRRQ3LaHfynCwG46PmZnxlt8sBU1MPsK4q5CKulGxr/HOJpMSMLBw76YL7qr56Ud/ozGRql6AP4F1YV/NrwiHApVLpOGkPluikl41qpUQzF5GXvVNKNN5SZro93X/xTIr1sxgCM0ERt41jS3pluV2hiebzoRauHgeKU69l5g4/dePtaZGZAxeGuLceG/g96m8BAzrnKPMFMwbgIDTJzcgW6BOQLpNJ3YUQX2aQpRAlRehBiPvGevweb81idMa8Ln3/TjE/AlaDwAGqwNDGN/vdA4+5z8Pz2ZkqLwiT7m7tV6mqn3eDJdwJDTkcePRwIwOrjuiZTGfKfnkVT2mHtjBGNjrdBAz6+agfGmGGibI2vMLmrghIAkEIe/qrYeOCyKx1K7zjDN6wwVwJgyinPjxsL7oWOIWtvO4PV/cs+h31ITy4tJ8e4xLPe9iz4KWVnPr4UprrHrrgs/7cwp9EqJ2juTJaJhDP98bBBLfXTzGDl2VLCZLcqDgrNMTKmYeCoOYIdrrMqmmWjSwNSadjujdkdgjwL0WSKckaj5tFpUjG/4KtnJgQ7UXSFWM1gBsB3lt5MMMX1GOetGkEmJYqElpFyXy9lvCmAFtPXCWhMZFOCQEr6kEegQ8yveQ4Ro3g/8+sl/2LIYYwvN10YT23ln9Tqx2ib+xM1oHOVQJJNWIKsGsMgubew5yDcaGCN/GgwxvX5VZURMzJK1hAAOT5N/aTiliPN5BPQ9zN7bjk0+IylaT5DuvfT8eFFTvpAB6W48Fk6O9yL7clCFTAAHmJE9Nu2y86tRy44OdreITg399dWm0H9NP0z4P+BCGZpggWqiSSoPB4g/1R5ArnlYRGBvF+F7BxWBOaRnL7rE0qAMaDKKM99uR4Y7L7rhLeQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1327ed09-7bed-47c1-08d2-08db71d5cc0a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 21:32:07.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSqRG+9DLb1Lvmz3Id0lyrZcF8bBsMympDDS3TsO/qd1/tWesT8wv1l7FUvHbzZs735bbHs46HIGOkpfZyIOgQHQI+5DKGh/3L3aqemSopQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7269

On 20/06/2023 10:27 pm, Timothy Pearson wrote:
>> On 20/06/2023 7:12 pm, Shawn Anastasio wrote:
>>> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
>>> new file mode 100644
>>> index 0000000000..f75d9be4ed
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/xen.lds.S
>>> <snip>
>>> +/**
>>> + * OF's base load address is 0x400000 (XEN_VIRT_START).
>>> + * By defining sections this way, we can keep our virtual address base at
>>> 0x400000
>>> + * while keeping the physical base at 0x0.
>>> + *
>>> + * Without this, OF incorrectly loads .text at 0x400000 + 0x400000 = 0x800000.
>>> + * Taken from x86/xen.lds.S
>>> + */
>> Sorry, one last thing.
>>
>> What's OF?  Searching around suggests it might be OpenFirmware, but I'm
>> not certain if that's applicable in this context either?
>>
>> ~Andrew
> OF is indeed Open Firmware.  It was mainly used on old Apple machines, but its legacy lives on in SLOF (SlimLine Open Firmware) which is the QEMU bootloader for the pSeries machine type.

Ok.  Seeing as everything else appears to be in order, I'll expand this
abbreviation on commit for the benefit of others reading the comment.

~Andrew

