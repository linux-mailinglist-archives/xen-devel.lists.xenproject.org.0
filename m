Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A896B9782
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509630.785745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RA-0004dT-N7; Tue, 14 Mar 2023 14:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509630.785745; Tue, 14 Mar 2023 14:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RA-0004aR-JY; Tue, 14 Mar 2023 14:15:36 +0000
Received: by outflank-mailman (input) for mailman id 509630;
 Tue, 14 Mar 2023 14:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc5R9-0004aK-2L
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:15:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab5188f5-c272-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:15:30 +0100 (CET)
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
X-Inumbo-ID: ab5188f5-c272-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678803330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fko8ktTbERl+jnx1rVxdYJjeLy3W6/ckaPihOkE2uPs=;
  b=dkt14CsydKusQBZOghsOhLNQLGfCzN6KZfdYY5zRoKGljaxH9EB3q7VM
   Ccydosv5wmR97MJSm0sF8wIINcykLl7XXKcYqjAisYxDviqy9basC9py0
   /Y+fChcHVaxPUEfqB1PX+TjLzSYIbT+zGansz6dLlzJGmhnLug18IyFTo
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100695472
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6PJpTqiy6lDVZUk7R4aVGYjwX161fhAKZh0ujC45NGQN5FlHY01je
 htvXD2EbPmKZmLzct92Oomy/BkOu8DQm4VhQQQ4rSsxRnsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQIeSAAShWB39ummrm4T+Viqt4BdNPkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 jqYrjmlXUty2Nq3yxuG0ij9is70zSrefYBNGrCmxOF4qQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/I+wBGAzOzT+QnxLm0NVDtIctElnM4wWz0x1
 1WNks/pBDpgq7mcQzSW8bL8kN+pEXFLdylYP3ZCFFZbpYC5++nfky4jUP5zQb64qtj3QQjgm
 TuJqSQwq68x1dQEgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K374145CHx7ZiHCgUpLj2WZWqwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8jLLp32UixAVP0+pNZTewv6+e5D+8zD7TmLGcCTI+qPiNJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3CvZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt6K9Q0xvQIyLqYl
 px/M2cBoGfCabT8AV3iQhhehHnHB/6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:JiJSDa/N4mpD1f1lhIRuk+AEI+orL9Y04lQ7vn2ZKCYlCfBw8v
 rEoB1173HJYVoqNU3I2urwXJVoOEm8yXct2+ks1NSZLWvbUQmTXflfBOLZqlWLJ8SZzJ856U
 4KScdD4bPLYWSSwvyKhzVQvuxQpuWv4eSDv8+b5XFoVARrY6Zr40NCDBqBGEEefngkOXN8Lu
 vk2vZ6
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100695472"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>
Subject: [PATCH 1/7] tools/python: Drop pylintrc
Date: Tue, 14 Mar 2023 14:15:14 +0000
Message-ID: <20230314141520.3652451-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This was added in 2004 in c/s b7d4a69f0ccb5 and has never been referenced
since.  Given the the commit message of simply "Added .", it was quite
possibly a mistake in the first place.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/python/pylintrc | 307 ------------------------------------------
 1 file changed, 307 deletions(-)
 delete mode 100644 tools/python/pylintrc

diff --git a/tools/python/pylintrc b/tools/python/pylintrc
deleted file mode 100644
index efc4b0b3b2dd..000000000000
--- a/tools/python/pylintrc
+++ /dev/null
@@ -1,307 +0,0 @@
-# lint Python modules using external checkers.                            
-#                                                                                
-#     This is the main checker controling the other ones and the reports         
-#     generation. It is itself both a raw checker and an astng checker in order  
-#     to:                                                                        
-#     * handle message activation / deactivation at the module level             
-#     * handle some basic but necessary stats'data (number of classes, methods...)
-#                                                                                 
-# This checker also defines the following reports:                                    
-#   * R0001: Total errors / warnings                                              
-#   * R0002: % errors / warnings by module                                        
-#   * R0003: Messages                                                             
-#   * R0004: Global evaluation                                                    
-# 
-[MASTER]
-# Add <file or directory> to the black list. It should be a base name, not a
-# path. You may set this option multiple times.
-ignore=CVS
-
-# Pickle collected data for later comparisons.
-persistent=yes
-
-# Set the cache size for astng objects.
-cache-size=500
-
-
-
-[REPORTS]
-# Tells wether to display a full report or only the messages
-reports=yes
-
-# Use HTML as output format instead of text
-html=no
-
-# Use a parseable text output format, so your favorite text editor will be able
-# to jump to the line corresponding to a message.
-parseable=no
-
-# Colorizes text output using ansi escape codes
-color=no
-
-# Put messages in a separate file for each module / package specified on the
-# command line instead of printing them on stdout. Reports (if any) will be
-# written in a file name "pylint_global.[txt|html]".
-files-output=no
-
-# Python expression which should return a note less than 10 (10 is the highest
-# note).You have access to the variables errors warning, statement which
-# respectivly contain the number of errors / warnings messages and the total
-# number of statements analyzed. This is used by the global evaluation report
-# (R0004).
-evaluation=10.0 - ((float(5 * error + warning + refactor + convention) / statement) * 10)
-
-# Add a comment according to your evaluation note. This is used by the global
-# evaluation report (R0004).
-comment=no
-
-# Include message's id in output
-include-ids=yes
-
-
-
-# checks for                                                              
-#     * unused variables / imports                                               
-#     * undefined variables                                                      
-#     * redefinition of variable from builtins or from an outer scope            
-#     * use of variable before assigment                                         
-#     
-[VARIABLES]
-# Enable / disable this checker
-enable-variables=yes
-
-# Tells wether we should check for unused import in __init__ files.
-init-import=no
-
-# List of variable names used for dummy variables (i.e. not used).
-dummy-variables=_,_1,_2,_3,_4,_5,dummy
-
-
-
-# checks for :                                                            
-#     * doc strings                                                              
-#     * modules / classes / functions / methods / arguments / variables name     
-#     * number of arguments, local variables, branchs, returns and statements in
-# functions, methods                                                       
-#     * required module attributes                                             
-#     * dangerous default values as arguments                                    
-#     * redefinition of function / method / class                                
-#     * uses of the global statement                                             
-#                                                                                 
-# This checker also defines the following reports:                                    
-#   * R0101: Statistics by type                                                   
-# 
-[BASIC]
-# Enable / disable this checker
-enable-basic=yes
-
-# Required attributes for module, separated by a comma
-required-attributes=
-
-# Regular expression which should only match functions or classes name which do
-# not require a docstring
-no-docstring-rgx=.*
-
-# Minimal length for module / class / function / method / argument / variable
-# names
-min-name-length=1
-
-# Regular expression which should only match correct module names
-module-rgx=(([a-z_][a-z0-9_]*)|([A-Z][a-zA-Z0-9]+))$
-
-# Regular expression which should only match correct class names
-class-rgx=[A-Z_][a-zA-Z0-9]+$
-
-# Regular expression which should only match correct function names
-function-rgx=[a-z_][A-Za-z0-9_]*$
-
-# Regular expression which should only match correct method names
-method-rgx=[a-z_][A-Za-z0-9_]*$
-
-# Regular expression which should only match correct argument names
-argument-rgx=[a-z_][A-Za-z0-9_]*$
-
-# Regular expression which should only match correct variable names
-variable-rgx=[a-z_][A-Za-z0-9_]*$
-
-# Good variable names which should always be accepted, separated by a comma
-good-names=i,j,k,ex,Run,_
-
-# Bad variable names which should always be refused, separated by a comma
-bad-names=foo,bar,baz,toto,tutu,tata
-
-# List of builtins function names that should not be used, separated by a comma
-bad-functions=apply,input
-
-
-
-# checks for sign of poor/misdesign:                                      
-#     * number of methods, attributes, local variables...                        
-#     * size, complexity of functions, methods                                   
-#     
-[DESIGN]
-# Enable / disable this checker
-enable-design=yes
-
-# Maximum number of arguments for function / method
-max-args=15
-
-# Maximum number of locals for function / method body
-max-locals=15
-
-# Maximum number of return / yield for function / method body
-max-returns=6
-
-# Maximum number of branch for function / method body
-max-branchs=12
-
-# Maximum number of statements in function / method body
-max-statements=50
-
-# Maximum number of parents for a class (see R0901).
-max-parents=7
-
-# Maximum number of attributes for a class (see R0902).
-max-attributes=7
-
-# Minimum number of public methods for a class (see R0903).
-min-public-methods=2
-
-# Maximum number of public methods for a class (see R0904).
-max-public-methods=20
-
-
-
-# checks for :                                                            
-#     * methods without self as first argument                                   
-#     * overriden methods signature                                              
-#     * access only to existant members via self                                 
-#     * attributes not defined in the __init__ method                            
-#     * supported interfaces implementation                                      
-#     * unreachable code                                                         
-#     
-[CLASSES]
-# Enable / disable this checker
-enable-classes=yes
-
-# List of interface methods to ignore, separated by a comma. This is used for
-# instance to not check methods defines in Zope's Interface base class.
-ignore-iface-methods=isImplementedBy,deferred,extends,names,namesAndDescriptions,queryDescriptionFor,getBases,getDescriptionFor,getDoc,getName,getTaggedValue,getTaggedValueTags,isEqualOrExtendedBy,setTaggedValue,isImplementedByInstancesOf,adaptWith,is_implemented_by
-
-# Tells wether missing members accessed in mixin class should be ignored. A
-# mixin class is detected if its name ends with "mixin" (case insensitive).
-ignore-mixin-members=yes
-
-
-
-# checks for                                                              
-#     * external modules dependencies                                            
-#     * relative / wildcard imports                                                         
-#     * cyclic imports                                                           
-#     * uses of deprecated modules
-#                                                                                 
-# This checker also defines the following reports:                                    
-#   * R0401: External dependencies                                                
-#   * R0402: Modules dependencies graph                                           
-# 
-[IMPORTS]
-# Enable / disable this checker
-enable-imports=no
-
-# Deprecated modules which should not be used, separated by a comma
-deprecated-modules=regsub,string,TERMIOS,Bastion,rexec
-
-# Create a graph of every (i.e. internal and external) dependencies in the given
-# file (report R0402 must not be disabled)
-import-graph=
-
-# Create a graph of external dependencies in the given file (report R0402 must
-# not be disabled)
-ext-import-graph=
-
-# Create a graph of internal dependencies in the given file (report R0402 must
-# not be disabled)
-int-import-graph=
-
-
-
-# checks for                                                              
-#     * excepts without exception filter                                         
-#     * string exceptions                                                        
-#     
-[EXCEPTIONS]
-# Enable / disable this checker
-enable-exceptions=yes
-
-
-
-# checks for :                                                            
-#     * unauthorized constructions                                               
-#     * strict indentation                                                       
-#     * line length                                                              
-#     * use of <> instead of !=
-#     
-[FORMAT]
-# Enable / disable this checker
-enable-format=no
-
-# Maximum number of characters on a single line.
-max-line-length=80
-
-# Maximum number of lines in a module
-max-module-lines=1000
-
-# String used as indentation unit. This is usually " " (4 spaces) or "\t" (1 tab).
-indent-string='    '
-
-
-
-# does not check anything but gives some raw metrics :                    
-#     * total number of lines                                                    
-#     * total number of code lines                                               
-#     * total number of docstring lines                                          
-#     * total number of comments lines                                           
-#     * total number of empty lines                                              
-#                                                                                 
-# This checker also defines the following reports:                                    
-#   * R0701: Raw metrics                                                          
-# 
-[METRICS]
-# Enable / disable this checker
-enable-metrics=yes
-
-
-
-# checks for:                                                             
-#     * warning notes in the code like FIXME, XXX                                
-#     * PEP 263: source code with non ascii character but no encoding declaration
-#     
-[MISCELLANEOUS]
-# Enable / disable this checker
-enable-miscellaneous=yes
-
-# List of note tags to take in consideration, separated by a comma. Default to
-# FIXME, XXX, TODO
-notes=FIXME,XXX,TODO
-
-
-
-# checks for similarities and duplicated code. This computation may be
-#     memory / CPU intensive, so you should disable it if you experiments some
-#     problems.
-#                                                                                 
-# This checker also defines the following reports:                                    
-#   * R0801: Duplication                                                          
-# 
-[SIMILARITIES]
-# Enable / disable this checker
-enable-similarities=yes
-
-# Minimum lines number of a similarity.
-min-similarity-lines=4
-
-# Ignore comments when computing similarities.
-ignore-comments=yes
-
-
-
-- 
2.30.2


